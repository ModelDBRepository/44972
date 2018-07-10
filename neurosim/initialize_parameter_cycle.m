function [Synapse, Iclamp, Misc, currentClampDataMsecPampArray, ...
	  nicotinicWaveformBufferNsiemenArray] = ...
              initialize_parameter_cycle(Synapse, Neuron, Iclamp, Misc, ...
					 iPrimaryLoop, iCurrentClampStep)
% This function initializes variables and files required for each new
%   parameter cycle in the function neurosim.
%
% This function is called by the function neurosim().  The values
%   passed in through the function call correspond to the structure
%   variables Synapse, Neuron, and Misc, the current index of the
%   primary frequencies' loop and the current current-step number.
%
% The function returns the updated structure variables Synapse,
%   Neuron, Iclamp and Misc, the suffix to be added to the current
%   parameter cycle's datafile names, the subdirectory to be
%   generated for the current parameter cycle, a 2-D array holding
%   the timing (ms) and current (pA) information pertaining to the
%   current clamp, and the buffer that holds the overflow for the
%   nicotinic conductance template.
%
% currentClampDataMsecArray is a 2-D array that consists of a
%   temporal array (ms) and the corresponding values of the applied
%   current clamp (pA)
%
% nicotinicWaveformBufferNsiemenArray is a 1-D array that holds the
%   overflow from the nicotinic synaptic conductance template,
%   which is necessary to guarantee the proper addition of the
%   nicotinic conductances if a synaptic potential is triggered
%   within one synaptic pulse length of the end of the template (nS)
%
% Function files called by this function: compute_synaptic_events.m
%                                         compute_current_clamp_template.m
%
% by Diek W. Wheeler, Ph.D.

% Last change 06/06/02
% 07/23/02 added subFOLDER as a global variable so current clamp templates
%          can be written to the proper subfolder
% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/20/02 corrected problem with subFOLDER formatting
% 08/21/02 removed iCLAMP and epscBUFFER from the gvars structure so they are
%	   now passed through the function call
%          added lenTEMPLATE to the gvars structure
% 03/07/03 increased the number of decimal places for fireRATE(2)
%          from 1 to 3 in the suffix for folder and data names
% 04/27/03 function calc_pulse() renamed to compute_synaptic_events()
% 04/28/03 renamed fro cycle_init()
%          began renovation of coding style
% 05/01/03 finished renovation of coding style
% 05/15/03 started to add facilitaton and individual secondary synapses
%          Synapse.frequencyHz, Synapse.gsynThresholdNsiemen, and
%          Misc.avgInterEventIntervalMsec are no longer arrays and
%          are now the same for both primary and secondary synapses
% 05/16/03 finished adding facilitation and multiple secondaries
% 05/26/03 added the number of secondary synapses to the folder names
% 05/27/03 added facilitation data to folder name
% 09/03/03 finished coding renovations
% 09/12/03 replaced structure variable Cell with Neuron
% 11/14/03 removed all references to the global variable gvars

% Create local variables for legibility

isDebug = Misc.isDebug;
TRUE = 1;
FALSE = 0;

currentStep = 2;

% Prepare the suffix to be added on to this parameter cycle's file
%   names.  The suffix includes the current cycle's maximum
%   conductance for the M-type potassium conductance, the maximum
%   conductance for the cyclic nucleotide-gated cation current, the
%   primary firing frequency, and the secondary firing frequency.

Misc.dataSuffix = sprintf('_%d_%d_n%d_%.2f', Neuron.gmBarNsiemen, ...
			  Neuron.gcngBarNsiemen, (Synapse.number-1), ...
			  Synapse.frequencyHz);

% Initialize the subdirectory to be generated for the current
%   parameter cycle.  Appended to the base word "data" is a suffix
%   consisting of the current parameter suffix, the amplitude of the
%   modulatory oscillations of the primary firing frequencies, the
%   rate at which the primary firing frequencies are modulated, the
%   phase difference between the modulatory oscillations of the
%   primary and secondary firing frequencies, the maximum
%   conductance for the nicotinic synaptic conductance for the
%   secondaries relative to the threshold synaptic conductance, the
%   rise and decay rates of the conductance waveform, the
%   facilitation factor and decay rate, and the current clamp step
%   number.
%
% There is a check made to see if the simulation is being run on a PC
%   or not, so the proper command can be executed to create the new
%   directory.

secondaryPercentOfThresholdGsyn = 100 * Synapse.gsynBarNsiemenArray(2) / ...
    Synapse.gsynThresholdNsiemen;

secondaryFrequencyModulatorPhaseDegree = ...
                      Synapse.frequencyModulatorPhaseRadianArray(2) * 180 / pi;

dirName = sprintf('%s/data%s+%.1f+%.1f_phi%d_gsyn%d_tau%d-%d', ...
		  Misc.simulationDirectoryName, Misc.dataSuffix, ...
		  Synapse.frequencyModulatorAmplitudeHz, ...
		  Synapse.frequencyModulatorRateHz, ...
		  secondaryFrequencyModulatorPhaseDegree, ...
		  secondaryPercentOfThresholdGsyn, ...
	          Synapse.gsynRiseTimeMsec, ...
	          Synapse.gsynFallTimeMsecArray(1));

if (Synapse.gsynFallTimeMsecArray(2) > 0)
    dirName = sprintf('%s-%d', dirName, Synapse.gsynFallTimeMsecArray(2));
end

if (Synapse.isFacilitationActive)
    dirName = sprintf('%s_fac%d-%d', dirName, ...
                                     round(Synapse.facilitationFactor), ...
				     round(Synapse.facilitationDecayRateMsec));
end

if (Iclamp.mode == currentStep)
    dirName = sprintf('%s_step%d', dirName, iCurrentClampStep);
end

dirName = sprintf('%s_%d', dirName, iPrimaryLoop);

if (ispc)
    status = mkdir(dirName);
else % not a PC
    mkdirCommand = sprintf('mkdir %s', dirName);
    unix(mkdirCommand);
end

% Prime the random number generator.
%
% A different random seed source is selected by the user for each
%   primary firing frequency that the program is to cycle through.
%
% If the source of the random seed is from either the system clock or
%   the user, then the random number generator is reset to its Nth
%   state, where N is the first element in the vector containing the
%   current state of the uniform generator.
%
% Else, the source of the random seed has been read in from a file, so
%   the state of the random number generator is set to the state
%   corresponding to the 35-element vector that was saved to file.

switch Misc.randomSeedSourceName
   case 'system clock'
       rand('state', Misc.randomNumberStateVector(1,iPrimaryLoop));
   case 'user input'
       rand('state', Misc.randomNumberStateVector(1,iPrimaryLoop));
   case 'read from file'
       rand('state', Misc.randomNumberStateVector(:,iPrimaryLoop));
   otherwise
       display('**ERROR with the name of the random-seed source!**');
end % switch

% Write the current state of the random number generator to a text file.

ranNoStateFileName = sprintf('%s/rand_state%s.dat', dirName, Misc.dataSuffix);
ranNoStateFileId = fopen(ranNoStateFileName, 'w');
fprintf(ranNoStateFileId, '%.30f\n', rand('state'));
status = fclose(ranNoStateFileId);
 
% Assign directory name to global variable

Misc.dataDirectoryName = dirName;

% Convert the mean stochastic firing rate to the mean time between
%   pulses (ms).

if (Synapse.frequencyHz > 0)
    Misc.avgInterEventIntervalMsec = 1000 ./ Synapse.frequencyHz;
else
    Misc.avgInterEventIntervalMsec = 100000;  % Avoid divide by zero error
end

% Initialize the action-potential flag to zero for the new parameter
%   cycle.

Misc.isActionPotential = 0;

% Initialize the action-potential counter to zero for the new
%   parameter cycle.

Misc.nActionPotential = 0;

% Initialize the arrays for the pulse times for both the primary and
%   secondary synapses for the new parameter cycle.

Synapse.eventTimeMsecArray(1:Synapse.number) = 0;

% Initialize the arrays for the pulse counters for both the primary
%   and secondary synapses for the new parameter cycle.

Synapse.nEventArray(1:Synapse.number) = 0;

% Initialize the numerical integration starting time for the new
%   parameter cycle, which will be updated for long integrations that
%   are broken up into smaller segments (ms).

Misc.integrationSegmentStartMsec = 0;

% Initialize the flag that is triggered if more than one numerical
%   integration time segment is to be cycled through.

Misc.isMoreThanOneTimeSegment = 0;

% Initialize the array for the starting values of the main variables
%   (V, m, h, n, w), which will be used to provide continuity between
%   multiple numerical-integration time segments.

Misc.initialValuesArray = 0;

% Display in the command window a message notifying the user that the
%   interpulse interval times are about to be calculated.  This
%   feature keeps the user apprised of the progress of the program's
%   execution.  The message is also time stamped to help the user
%   evaluate execution times.
%
% Call the function compute_synaptic_events() to compute all of the
%   synaptic event times.
%
% The values being passed during the function call are the structure
%   variables Synapse and Misc, and the current index of the primary
%   frequencies loop.
%
% The values returned by the function are the updated structures
%   Synapse and Misc.

if (Misc.shouldComputeSynapticEvents) % menu options, else read in from file

    displayString = sprintf('Calling compute_synaptic_events()...%s', ...
			    datestr(now,14));
    disp(displayString);
    [Synapse, Misc] = compute_synaptic_events(Synapse, Misc, iPrimaryLoop);

end

% Initialize the array that holds the overflow from the nicotinic
%  synaptic conductance template.
%
% This is a precaution against instances when a synaptic potential is
%   triggered within one synaptic pulse length of the end of the
%   template.

nicotinicWaveformBufferNsiemenArray = zeros(Misc.lengthOfTemplate, 1);

% Initialize the starting index values of the primary and secondary
%   nicotinic synaptic pulses.
%
% These values are updated if the total, numerical integration time
%   has been broken into smaller segments.

Misc.nEventStartArray(1:Synapse.number) = 1;

% Call the function compute_current_clamp_template() to compute
%   the current clamp template.
%
% The updated structure variables Iclamp and Misc and the current
% index of the primary frequencies' loop is passed into the function.
%
% The function returns a 2-D array holding the timing (ms) and
%   current (pA) information pertaining to the current clamp

currentClampDataMsecPampArray = ...
    compute_current_clamp_template(Synapse, Iclamp, Misc, iPrimaryLoop);

% Initialize flag that signals that the program has cycled beyond the
%   first integration-time segment.  Certain parameters will be
%   reinitialized differently based on the flag's status.

Misc.isMoreThanOneTimeSegment = FALSE;

% end initialize_parameter_cycle()
