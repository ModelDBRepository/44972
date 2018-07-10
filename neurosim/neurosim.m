function neurosim(execution_mode)
% The function neurosim contains the main function that sets up and
%   runs the rest of the parts of the program that numerically
%   integrates a conductance-based neuron (global_defs.m[*], keep.m,
%   prm_init.m[*], menu.m[*], initialize_parameter_cycle.m,
%   compute_synaptic_events.m, compute_current_clamp_template.m,
%   initialize_segment_cycle.m, gsyn_template.m[*],
%   postsynaptic_neuronal_excitability.m, neuroplot.m[*],
%   count_action_potentials.m, quickinterp.m).  It can be run in three execution modes:
%   1) the program runs completely through all calculations, completes
%   the conductance-based model simulations, and plots the results; 2)
%   the program performs all of the calculations of the first mode but
%   runs without plotting any of the results; 3) the program stops
%   after the synaptic template has been computed and does not run the
%   conductance-based model simulations.  All of the binary data files
%   are saved in IEEE floating point (single, 4 bytes) with big-endian
%   byte ordering.  Descriptions of the global variables can be found
%   in global_defs.m.
%
% Function files called by this function: keep.m
%                                         prm_init.m
%                                         initialize_parameter_cycle.m
%                                         initialize_segment_cycle.m
%                                         gsyn_template.m
%                                         postsynaptic_neuronal_excitability.m
%                                         synplot.m
%
% This program is based on the earlier work of Herman Schobesberger, Ph.D., 
%   Boris S. Gutkin, Ph.D., and John P. Horn, Ph.D.
%
% by Diek W. Wheeler, Ph.D.

% Last change 03/13/02
% 06/12/02 Added currentMAX
% 06/27/02 added pulseND length to calculation of final integration
%          time segment
% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/20/02 for statements do not accept 'gvars.' variables, so local variables
%          are used to start the for-loop and then the local variables are
%	   immediately assigned to the appropriate global varaiables
% 08/21/02 removed tspan, y0, options, iCLAMP, epscBUFFER, and synTEMPLATE from
%	   the gvars structure so they are now passed through the function
%	   calls
%	   added 'clear global' command - after 'keep' command and before
%	   invocation of 'global gvars'
% 09/11/02 added command to specify working directory if not on a
%          Windows machine
% 01/10/03 added new data columns to the pulsecounts.dat file to
%          accomodate a new gain calculation, gain3, which is
%          NumAps/400.  Also added were the coefficient of
%          variation of NumAps and gain3, and the standard error of
%          the mean of gain3.  A Poisson distribution was assumed
%          to describe the number of APs.
% 04/05/03 Profiler will no longer be called at the end of the
%          program if only a conductance template was generated.
% 04/28/03 began renovation of coding style
% 05/15/03 started to add facilitaton and individual secondary synapses
%          Synapse.frequencyHz, Synapse.gsynThresholdNsiemen, and
%          Misc.avgInterEventIntervalMsec are no longer arrays and
%          are now the same for both primary and secondary synapses
% 05/16/03 finished adding facilitation and multiple secondaries
%          Synapse.frequencyModulatorAmplitudeHz no longer an array
% 05/26/03 modified the pulsecounts.dat file by rearranging the
%          order of parameters being output, removing unneeded
%          columns and adding facilitation factor and decay rate
% 05/30/03 added bootstrap gain calculations
% 09/12/03 replaced structure variable Cell with Neuron
% 10/30/03 added checks if the primary firing rate has been set to
%          eliminate division by zero warnings when gain is calculated
% 11/21/03 fixed the action potential counter function
% 12/03/03 updated calculation of gain to be (nAps/nEventsPerSynapse)
%          so it is independent of the numerical integration time
%          and the modulation of the firing rate
% 12/05/03 corrected action potential counter during multiple time
%          segments so gain value is computed correctly
% 12/10/03 the program no longer tries to calculate gain values
%          when only templates are being created so as to avoid
%          warning messages

% Obtain profile of program performance.
%
% Clear the profiling buffer and then start the profiling mode.  The
%   profiler is set to keep track of built-in functions as well as
%   those written specifically by the programmer.
  
profile clear;
profile on -detail builtin;

% Check to see if an execution_mode number was included in the function call.
% execution_mode = 1: executes full ode computations with plotting
%                  2: executes full ode computations without plotting
%                  3: stops after synaptic conductance template is computed
%
% If the user did not provide an execution mode when the neurosim function
%   was called, or entered an invalid number, the program then prompts the
%   user to enter a valid execution mode.  The program keeps looping
%   through the prompt routine until the user enters an acceptable
%   execution mode.  Besides the excution modes 1, 2, and 3, the program
%   also accepts modes 11, 12, and 13.  These modes are hidden from the
%   general user and correspond to a special debugging mode of the
%   program.  This allows the programmer to set up a special set of
%   parameters for debugging purposes without disrupting any normal
%   simulation settings.  In debugging mode, the three execution modes 1,
%   2, and 3 are executed without ever accessing the menu function.
  
if (nargin < 1 | isempty(find(execution_mode == [1; 2; 3; 11; 12; 13])))
    execution_mode = [];
    while (isempty(execution_mode))
	home;
	disp('Please input execution mode.');
	disp(' ');
	disp('    1: executes full ode computations');
	disp('    2: executes full ode computations without plotting');
	disp('    3: stops after synaptic conductance template is computed');
	execution_mode = input('\nMode: ');
	if ~isempty(execution_mode)
	    if isempty(find(execution_mode == [1; 2; 3; 11; 12; 13]))
		execution_mode = [];
	    end
	end
    end % while loop
end % if (nargin)

% Keep value of execution_mode and clear all other variables
%
% keep.m is a third party function file

keep execution_mode;
clear global;

global gvars DEBUG                 % Definitions are located in global_defs.m
global Synapse Neuron Iclamp Misc

TRUE = 1;
FALSE = 0;
  
% Assign value of execution mode to a global variable for use in other
%   parts of the program.

gvars.executionMODE = execution_mode;

% Initialize randomization seed based on system clock.

rand('state', sum(100*clock));

% Set the output mode for variable listings in the text window to LONG
%   in order to automatically print values to 15 digits.

format long;

% The diary command is executed and the output is saved in the file
%   output.txt.  This will save to file all of the text sent to the
%   MATLAB output window.
%
% The diary command is turned off in case the previous simulation had
%   been aborted prematurely and the diary command was left running.
%
% The text file output.txt is opened and then immediately closed in
%   order to clear it for the current simultion's output.

diary off;
fid = fopen('output.txt', 'w');
status = fclose(fid);
diary('output.txt');

% Call the function prm_init to initialize variables and files used by
%   the entire program.
%
% A flag is set by the value returned by the call to the function
%   prm_init.
%
% If the flag is zero, then print a blank line to the text display and
%   quit execution of the program.
%
% Else, continue execution of the program.
%
% synTEMPLATE is an array containing the template function describing
%   the time evolution of the nicotinic synaptic conductance.  It
%   covers a span of 50 ms with grain determined by size of saveSTEP

[prm_init_flag, synTEMPLATE, Synapse, Neuron, Iclamp, Misc] = ...
    prm_init(Synapse, Neuron, Iclamp, Misc);

if (prm_init_flag == 0)
    disp(' ');
    return;
end

% Check if computing full ode computations.
%
% If true, then 
%   1) Reopen file for pulse counting in append mode, since the file
%      was originally created in the function prm_init, and the file
%      header written,
%   2) initialize counter for how often pulse-counting data file
%      should be saved, closed, and then reopened,
%   3) set the value at which the file counter will be reset back to
%      zero,
%   4) open Figure 1 window for voltage plots and clear its graphics
%      buffer.

if (gvars.executionMODE < 3)
    pulse_fid = fopen(gvars.pulse_countsFILE, 'a');
    dataset_count = 1;
    dataset_reset = 1;
    
    if (gvars.executionMODE == 1)
	figure(1);
	clf;
    end
end % if (gvars.executionMODE < 3)

% Open a file for the I-V current-clamp step data if needed.

if (gvars.iclamp_stateFLAG == 2) % Current clamp step
    istep_file = sprintf('%s/istep.dat', gvars.sessionFOLDER);
    istep_fid = fopen(istep_file, 'w');
end

% Initialize a count of the number of current steps that will be simulated
  
iclamp_count = 0;

% Start cycling through parameter values.
%
% Loop 1: Maximum conductance for the cyclic nucleotide-gated cation
%         current. (nS)
% Loop 2: Maximum conductance for the M-type potassium current
%         conductance. (nS)
% Loop 3: Primary firing frequencies.  At the start of every loop,
%         select the next primary frequency from the list of
%         user-specified frequencies. (Hz)
% Loop 4: Secondary firing frequencies.  At the start of every loop,
%         compute the next secondary frequency based on the current
%         primary frequency and the number of secondaries. (Hz)
% Loop 5: Amplitude of the step currents during current-clamp
%         simulations. (pA)

for iBootStrap = 1:gvars.nBootStrap

    for gcat_bar = gvars.gcatSTART:gvars.gcatSTEP:gvars.gcatEND
	
	gvars.gcatBAR = gcat_bar;
	
	for gm_bar = gvars.gmSTART:gvars.gmSTEP:gvars.gmEND
	
	    gvars.gmBAR = gm_bar;
	    
	    for j = 1:gvars.num_primaryLOOPS
		
		gvars.fireRATE = gvars.primaryFREQS(j);
		
		for i = 1:gvars.num_secondaryLOOPS
		
		    for iclamp_amplitude = gvars.istepSTART:gvars.istepSTEP:...
			    gvars.istepEND
			
			gvars.iclampAMPLITUDE = iclamp_amplitude;
			
% Update the number of the current step being simulated
			
			iclamp_count = iclamp_count + 1;
			
% If the current-clamp step mode is activated, then put the voltage
% plot into hold mode so that the multiple steps are all plotted on
% the same graph.
			
			if ((gvars.istepEND - gvars.istepSTART) / ...
			    gvars.istepSTEP > 1)
			    hold on;
			end

% Display in the command window the parameter values for the
% current parameter cycle.
			
			display_string = ...
			    sprintf('\n\tgCNG = %d nS  gM_bar = %d nS', ...
				    gvars.gcatBAR, gvars.gmBAR);
			disp(display_string); 
			
			display_string = ...
			    sprintf('\tFpre1 = %.2f Hz  Fpre2 = %.2f Hz', ...
				    gvars.fireRATE, gvars.fireRATE);
			disp(display_string);
			
			display_string = ...
			    sprintf('\tIntegration Time = %.2f ms\n', ...
				    gvars.integTIMES(j));
			disp(display_string); 

% TO BE REMOVED
Synapse.facilitationDecayRateMsec = gvars.facilitationDecayRateMsec;
Synapse.facilitationFactor = gvars.facilitationFactor;
Synapse.firingModeArray = gvars.fireMODE;
Synapse.frequencyHz = gvars.fireRATE;  
Synapse.frequencyModulatorAmplitudeHz = gvars.f_oscAMPLITUDE;
Synapse.frequencyModulatorFunction = gvars.fpre_modFLAG;
Synapse.frequencyModulatorPhaseRadianArray = gvars.f_oscPHASE;
Synapse.frequencyModulatorRateHz = gvars.f_oscRATE;
Synapse.gsynBarNsiemenArray = gvars.gsynBAR;
Synapse.gsynFallTimeMsecArray(1) = gvars.fallTIME;
Synapse.gsynFallTimeMsecArray(2) = gvars.fallTIME2;
Synapse.gsynRiseTimeMsec = gvars.riseTIME;
Synapse.gsynThresholdNsiemen = gvars.thresholdGSYN;
Synapse.isFacilitationActive = gvars.isFacilitationActive;
Synapse.number = gvars.numSYN;

Neuron.gcngBarNsiemen = gvars.gcatBAR;
Neuron.gmBarNsiemen = gvars.gmBAR;

Iclamp.activationDurationMsec = gvars.iclampDURATION;
Iclamp.mode = gvars.iclamp_stateFLAG;
Iclamp.postActivationLatencyMsec = gvars.iclampDOWNTIME;
Iclamp.preActivationLatencyMsec = gvars.iclampLATENCY;
Iclamp.preRampActivationLatencyMsec = gvars.iclampSETTLE;
Iclamp.rampAmplitudeStartPamp = gvars.irampSTART;
Iclamp.rampAmplitudeStopPamp = gvars.irampEND;
Iclamp.stepAmplitudePamp = gvars.iclampAMPLITUDE;
Iclamp.stepAmplitudeStartPamp = gvars.istepSTART;
Iclamp.stepAmplitudeStopPamp = gvars.istepEND;
Iclamp.zapAmplitudePamp = gvars.zap_fOSC;
Iclamp.zapDurationMsec = gvars.zapDURATION;
Iclamp.zapFrequencyMaximumHz = gvars.zap_hiFREQ;
Iclamp.zapFrequencyMinimumHz = gvars.zap_loFREQ;
Iclamp.zapMode = gvars.zap_stateFLAG;
Iclamp.zapPhaseRadian = gvars.zapPHASE;

Misc.activationStartMsec = gvars.pulseSTART;
Misc.executionMode = gvars.executionMODE;
Misc.lengthOfTemplate = gvars.lenTEMPLATE;
if (gvars.rand_stateFLAG == 1)
    Misc.randomSeedSourceName = 'system clock';
elseif (gvars.rand_stateFLAG == 2)
    Misc.randomSeedSourceName = 'user input';
else
    Misc.randomSeedSourceName = 'read from file';
end
Misc.randomNumberStateVector = gvars.randSTATE;
Misc.saveStepMsec = gvars.saveSTEP;
Misc.shouldComputeSynapticEvents = gvars.templateFLAG;
Misc.simulationDirectoryName = gvars.sessionFOLDER;
Misc.totalIntegrationTimeMsecArray = gvars.integTIMES;
Misc.twoEventTemplateMode = gvars.tsumMODE;
% TO BE REMOVED

% Call the function initialize_parameter_cycle() to initialize the
% variables and files needed for each new cycle.
%
% The parameters passed in through the function call correspond to
%   the structure variables Synapse, Neuron, and Misc, the current
%   index of the primary frequencies' loop and the current
%   current-step number.
%
% The function returns the updated structure variables Synapse,
%   Neuron, and Misc, the suffix to be added to the current parameter
%   cycle's datafile names, the subdirectory to be generated for
%   the current parameter cycle, a 2-D array holding the timing and
%   current information pertaining to the current clamp, and the
%   buffer that holds the overflow for the nicotinic conductance template.
%
% iCLAMP is a 2-D array that consists of a temporal array (ms) and the
%   corresponding values of the applied current clamp (pA)
%
% epscBUFFER is a 1-D array that holds the overflow from the nicotinic
%   synaptic conductance template, which is necessary to guarantee the
%   proper addition of the nicotinic conductances if a synaptic
%   potential is triggered within one synaptic pulse length of the end
%   of the template

                        [Synapse, Iclamp, Misc, iCLAMP, epscBUFFER] = ...
			    initialize_parameter_cycle(Synapse, Neuron, ...
						       Iclamp, Misc, j, ...
						       iclamp_count);

% TO BE REMOVED
suffix = Misc.dataSuffix;
folder = Misc.dataDirectoryName;

gvars.pulseTIMES = Synapse.eventTimeMsecArray;
gvars.fireMODE = Synapse.firingModeArray;
gvars.fireRATE = Synapse.frequencyHz;
gvars.fpre_modFLAG = Synapse.frequencyModulatorFunction;
gvars.pulseCOUNTER = Synapse.nEventArray;
gvars.numSYN = Synapse.number;
nSynapses = Synapse.number;

gvars.subFOLDER = Misc.dataDirectoryName;
gvars.startTIME = Misc.integrationSegmentStartMsec;
gvars.initFLAG = Misc.isMoreThanOneTimeSegment;
gvars.pulse_loopSTART = Misc.nEventStartArray;
gvars.tsumMODE = Misc.twoEventTemplateMode;
% TO BE REMOVED
	    
% Break up the total, numerical integration time into temporal
%   segments of length gvars.baseTIME.
%
% it1 == the number of whole gvars.baseTIME-length segements that can
%        be divided into the total integration time, gvars.integTIMES(j).
% it2 == the remaining portion of the total integration time,
%        gvars.integTIMES(j), that is not accounted for by it1.

                        it1 = floor(gvars.integTIMES(j)/gvars.baseTIME);
			it2 = mod(gvars.integTIMES(j),gvars.baseTIME);

% Initialize the array that holds the length of integration time for
%   each temporal segement.
%
% The parameter time_loop_counts keeps track of the total number of
%   numerical integration loops that will be executed.
%
% If it1 > 0, then the total integration time is longer than
%   gvars.baseTIME, so prime the necessary number of array segments
%   with gvars.baseTIME.
%
% If it2 > 0, then either the total integration time is less than
%   gvars.baseTIME, or the total integration time is not evenly
%   divisible by gvars.baseTIME.

                        time_loop_counts = 0;
			if (it1 > 0)
			    for time_loop_counts = 1:it1
				int_time(time_loop_counts) = gvars.baseTIME;
			    end
			end
			if (it2 > 0)
			    time_loop_counts = time_loop_counts + 1;
			    int_time(time_loop_counts) = it2;
			end
			
% Clear the arrays holding the AP firing times and the AP ISI's for
%   each new cycle.

                        ap_time = 0;
			ap_isi = 0;

% Zero out variable that tracks the maximum current for each new cycle.

                        gvars.currentMAX = 0;

% Reset flag at beginning of integration to indicate a single time segment.

                        gvars.initFLAG = FALSE;
	    
% Reset action potential counter

                        nAps = 0;
	    
% Cycle through the total numerical integration time, segment by
%   segment.

                        for time_loop = 1:time_loop_counts

% If this is the first integration-time segment, then set the
%   parameter gvars.integrationTIME to the first segment length plus a
%   delay to accommodate the settling of the system into equilibrium.
%
% Else, update the parameter gvars.integrationTIME to its previous value
%   plus the next segment's length.
%
% If the current integration-time segment is also the final segment,
%   then add the final settling time's length to the segment's length

                            if (time_loop == 1)
				gvars.integrationTIME = ...
				    int_time(time_loop) + gvars.pulseSTART;
			    else
				gvars.integrationTIME = ...
				    gvars.integrationTIME + ...
				    int_time(time_loop);
			    end
			    if (time_loop == time_loop_counts)
				gvars.integrationTIME = ...
				    gvars.integrationTIME + gvars.pulseEND;
			    end

% Update the initialization flag to signal that the program has cycled
%   beyond the first integration-time segment.  Certain parameters
%   will be reinitialized differently based on the flag's status.

                            if (time_loop > 1)
				gvars.initFLAG = TRUE;
			    end
	      
% TO BE REMOVED
Misc.executionMode = gvars.executionMODE;
Misc.integrationSegmentStartMsec = gvars.startTIME;
Misc.integrationSegmentStopMsec = gvars.integrationTIME;
Misc.isMoreThanOneTimeSegment = gvars.initFLAG;
Misc.saveStepMsec = gvars.saveSTEP;
% TO BE REMOVED	      

% Call the function initialize_segment_cycle to initialize, or
% reinitialize, variables for each integration-time segment cycle.
%
%  tspan		       1-D array for the simulation times at which the
%			         data will be saved (ms)
%  y0			       5-element array for the default
%                                resting values of the simulation
%                                variables (V, m, h, n, w, mA, hA) 
%  options		       structure variable for the options
%                                to be passed to the function that
%                                numerically integrates the
%                                differential equations of the
%                                conductance-based model

                            [tspan, y0, options, Misc] = ...
				initialize_segment_cycle(Neuron, Misc);
	      
% TO BE REMOVED
gvars.numPOINTS = Misc.nPoints;
% TO BE REMOVED
	      
% Display in the command window a message notifying the user that the
%   synaptic-conductance template is about to be calculated.  This
%   feature was added to keep the user apprised of the progress of the
%   program's execution.  The message is also time stamped to help the
%   user evaluate execution times.
%
% Call the function gsyn_template to calculate the
%   synaptic-conductance template.
%
% Display in the command window a message notifying user of the
%   completion of the template's calculation.  This message is also
%   time stamped.
  
                            display_string = ...
				sprintf('Calling gsyn_template #%d of %d...%s',...
					time_loop, time_loop_counts, ...
					datestr(now,14));
			    disp(display_string);
			    
			    GSYN = ...
				gsyn_template(j, folder, suffix, time_loop, ...
					      time_loop_counts, epscBUFFER, ...
					      synTEMPLATE);
			    display_string = ...
				sprintf('Template #%d done...%s', ...
					time_loop, datestr(now,14));
			    disp(display_string);

% Check if computing the full ode computations.
%
% If true, then numerically integrate the conductance equations, write
%   the resulting data to a file, and count the number of action
%   potentials.
%
% If false, do nothing.

                            if (gvars.executionMODE < 3)

% Display in the command window a message notifying user that the
%   conductance equations are about to be numerically integrated.
%   This feature was added to keep the user apprised of the progress
%   of the program's execution.  The message is also time stamped to
%   help the user evaluate execution times.
%
% Call the function ode15s to numerically integrate the conductance
%   equations.
%
% Display in the command window a message notifying user of completion
%   of the numerical integration.  This message is also time stamped.

                                strng = ...
				    sprintf('Calling ode15s...%s', ...
					    datestr(now,14));
				disp(strng);
				
				gvars.tspanStart = tspan(1);
				gvars.tspanStop = tspan(length(tspan));
				gvars.tspanFlag = 1;
				
				[t, y] = ...
				    ode15s('postsynaptic_neuronal_excitability', ...
					   tspan, y0, options, GSYN, iCLAMP);
				
				strng = ...
				    sprintf('\nOde15s done...%s', ...
					    datestr(now,14));
				disp(strng);

% The initialization parameter array is prepared for the next
%   numerical-integration segment.  The values for the numerically
%   integrated parameters (voltage, m, h, n, w) will start in the next
%   integration segment where they left off in the just completed
%   segment.
                
                                Neuron.initialValuesArray = ...
				    y(gvars.numPOINTS,:);

% Write the numerically integrated data (voltage, m, h, n, w) to a
%   binary file using IEEE floating point (single, 4 bytes) with
%   big-endian byte ordering.

   	                        data_file = sprintf('%s/data%s_%d.bin', ...
						    folder, suffix, time_loop);
				data_fid = fopen(data_file, 'w', 'ieee-be');
				count = fwrite(data_fid, t, 'single');
				count = fwrite(data_fid, y, 'single');
				status = fclose(data_fid);

% Write maximum current to a text datafile

                                imax_file = sprintf('%s/imax.dat', folder);
				imax_fid = fopen(imax_file, 'w');
				fprintf(imax_fid, '%.8e\n', gvars.currentMAX);
				status = fclose(imax_fid);

% Write the I-V current-clamp step data to a file.  Each full
%   numerical integration loop produces one data point for the I-V
%   plot, which is written to a text file.  The current and voltage
%   are recorded at the time that the current step is turned off,
%   minus 20 msec.  The 20 msec adjustment was added because in MATLAB
%   the voltage trace starts to change in reaction to a step in the
%   current before the step actually begins.  If the step parameters
%   have been set properly by the user, this should be at a point
%   where the system has reached an equilibrium membrane voltage.

                                if (gvars.iclamp_stateFLAG == 2)
				    ps_icl_icd = gvars.pulseSTART + ...
					gvars.iclampLATENCY + ...
					gvars.iclampDURATION;
				    istep_index = find(t == ps_icl_icd-20);
				    fprintf(istep_fid, '%.8f\t\t%.8f\n', ...
					    gvars.iclampAMPLITUDE, ...
					    y(istep_index));
				end
		
% Count the number of action potentials.  This is accomplished by
%   stepping through the voltage data point by point.
%
% If the current voltage value is positive then a check is made to see
%   if the voltage has just turned positive.
%
%   If it has just become positive, then a flag is set indicating that
%     the voltage is now positive, and the action potential counter is
%     incremented by one.  The time that the voltage becomes positive
%     is recorded in the array ap_time as the temporal location of the
%     current action potential.
%
%     If the number of action potentials is greater than one, then the
%       time between the current action potential and the last action
%       potential is recorded in the array ap_isi.
%
%   Else, the voltage is still in the positive domain, so do nothing.
%
% Else, the flag indicating that the voltage is positive is set to
%   zero.

                                [apCount, apTimeMsec, apIsiMsec] = ...
				    count_action_potentials(y(:,1), t, ...
							    gvars.numPOINTS);
				gvars.apCOUNT = apCount;
				nAps = nAps + apCount;
				
			    end % if (gvars.executionMODE < 3)

% Set the starting time for the next numerical-integration time loop
%   to the ending time of the current integration loop.  This
%   maintains continuity from one loop to the next.

                            gvars.startTIME = ...
				gvars.integrationTIME + gvars.saveSTEP;

			end % time_loop loop

% Check if only the synaptic conductance template is being computed.
%   If so, then skip to the end of the parameter loops to avoid the
%   sections of code that write pulse and action-potential counting to
%   file.

                        if (gvars.executionMODE == 3)
			    break;
			end

% Write the action-potential firing-time data to a text file.

                        ap_file = sprintf('%s/ap%s.dat', folder, suffix);
			ap_fid = fopen(ap_file, 'w');
			fprintf(ap_fid, '%.8f\n', apTimeMsec);
			status = fclose(ap_fid);

% Write the action-potential interspike interval data to a text file.

                        ap_isi_file = ...
			    sprintf('%s/ap_isi%s.dat', folder, suffix);
			ap_isi_fid = fopen(ap_isi_file, 'w');
			fprintf(ap_isi_fid, '%.8f\n', apIsiMsec);
			status = fclose(ap_isi_fid);

% Check to see is there were any primary pulses generated.
%
% If there were not any primary pulses, then set the mean presynaptic
%   firing rate, or primary firing rate, to -1, which is the
%   designated value for an unknown quantity.  By setting the firing
%   rate to -1 instead of just leaving it as zero, a division by zero
%   error is avoided later when the actual gain is computed.
%
% Else, the simulated, mean presynaptic firing rate, as opposed to the
%   set firing rate, is calculated from the total number of generated
%   primary pulses divided by the current parameter cycle's total
%   numerical-integration time in seconds.

                        nPrimaryEvents = gvars.pulseCOUNTER(1);
			if (gvars.pulseCOUNTER(1) == 0)
			    f1_pre = -1;
			else
			    f1_pre = ...
				nPrimaryEvents * (1000 / gvars.integTIMES(j));
			end

% The simulated, mean presynaptic firing rate of the secondaries is
%   calculated from the total number of generated secondary pulses
%   divided by the current parameter cycle's total
%   numerical-integration time in seconds.

                        integTimeSec = 1000 / gvars.integTIMES(j);
			nSecondaryEvents = ...
			    sum(gvars.pulseCOUNTER(2:...
						   (gvars.numSECONDARIES(i)+1)));
			f2_pre = ...
			    nSecondaryEvents * (1000 / gvars.integTIMES(j));

% Add up the total number of primary and secondary presynaptic pulses
%   that were generated.

                        nEvents = sum(gvars.pulseCOUNTER);

% The total, simulated, mean presynaptic firing rate of both the
%  primaries and secondaries is calculated from the total number of
%  generated primary and secondary pulses divided by the current
%  parameter cycle's total numerical-integration time in seconds.

                        f_total_pre = nEvents * (1000 / gvars.integTIMES(j));

% Compute the mean frequency of the postsynaptic action potentials.
%   The average is calculated by dividing the total number of action
%   potentials by the current parameter cycle's total
%   numerical-integration time in seconds.

                        f_ap = nAps * (1000 / gvars.integTIMES(j));

% The synaptic gain is calculated from the action potential firing
%   rate divided by the ideal presynaptic firing rate (i.e. the set
%   firing rate for the primaries, not the actual primary rate
%   resulting from the numerical simulation).

                        nEventsPerSynapse = nEvents / nSynapses;
			if (nEventsPerSynapse > 0)
			    gain = nAps / nEventsPerSynapse;
			else
			    gain = -1;
			end
			
% The ideal number of presynaptic events per synapse can be
%   determined from the ideal presynaptic firing rate and the full
%   integration time for that rate (usually == 400 events/synapse).

                        ideal_num_presyn = ...
			    ceil(gvars.fireRATE * gvars.integTIMES(j));

% The coefficient of variation for the ideal number of presynaptic
%   events per synapse is one over the square root of the ideal
%   number (usually == 0.05 or 5%).

                        if (ideal_num_presyn > 0)
			    ideal_num_presyn_CV = 1/sqrt(ideal_num_presyn);
			else
			    ideal_num_presyn_CV = -1;
			end
	    
% A Poisson distribution is assumed to describe the number of APs (nAP),
%   so the coefficient of variation is equal to one over the square
%   root of nAP.

                        if (nAps > 0)
			    nApsCv = 1 / sqrt(nAps);
			else
			    nApsCv = -1;
			end
			
% The coefficient of variation for the gain is determined from the
%   coefficents of variation for the number of APs and the ideal
%   number of presynaptic events per synapse (usually 400).
%   [CV(x/y)]^2 = [CV(x)]^2 + [CV(y)]^2

                        gainCv = sqrt(nApsCv^2 + nEventsPerSynapse^2);
			if (nAps > 0)
			    gainCv = sqrt((1/nAps) + (1/nEventsPerSynapse));
			else
			    gain_CV = -1;
			end
	    
% Since there is only one gain determination per presynaptic
%   frequency, the standard error of the mean for the gain is equal to
%   the standard deviation (SEM = stdev/sqrt(n=1)), which is the
%   coefficient of variation for the gain times the value for the
%   gain.

                        gainSem = gainCv * gain;
	    
% Write the pulse-count data, frequency data, gain, synaptic
%   conductance, M-current conductance, cyclic nucleotide-gated cation
%   leak conductance, synaptic-conductance decay constant, lab
%   computer number, and phase modulation to a text file.

                        fprintf(pulse_fid, '%9.4f\t', gvars.integTIMES(j));
			fprintf(pulse_fid, '%9.4f\t', gvars.fireRATE);
			fprintf(pulse_fid, '%9.4f\t', gvars.f_oscAMPLITUDE);
			fprintf(pulse_fid, '%9.4f\t', gvars.f_oscRATE);
			fprintf(pulse_fid, '%7.2f\t', ...
				gvars.f_oscPHASE(2)*180/pi);
			fprintf(pulse_fid, '%9.4f\t', gvars.numSECONDARIES(i));
			fprintf(pulse_fid, '%9.4f\t', gvars.thresholdGSYN);
			fprintf(pulse_fid, '%9.4f\t', gvars.gsynBAR(1));
			fprintf(pulse_fid, '%9.4f\t', ...
				gvars.gsynBAR(1) / gvars.thresholdGSYN);
			fprintf(pulse_fid, '%9.4f\t', gvars.gsynBAR(2));
			fprintf(pulse_fid, '%9.4f\t', ...
				gvars.gsynBAR(2) / gvars.thresholdGSYN);
			fprintf(pulse_fid, '%9.4f\t', gvars.gmBAR);
			fprintf(pulse_fid, '%9.4f\t', gvars.gcatBAR);
			fprintf(pulse_fid, '%7.2f\t', gvars.fallTIME);
			fprintf(pulse_fid, '%9.4f\t', ...
				gvars.isFacilitationActive * ...
				gvars.facilitationFactor);
			fprintf(pulse_fid, '%9.4f\t', ...
				gvars.isFacilitationActive * ...
				gvars.facilitationDecayRateMsec);
			fprintf(pulse_fid, '%9.4f\t', nPrimaryEvents);
			fprintf(pulse_fid, '%9.4f\t', f1_pre);
			fprintf(pulse_fid, '%9.4f\t', nSecondaryEvents);
			fprintf(pulse_fid, '%9.4f\t', f2_pre);
			fprintf(pulse_fid, '%9.4f\t', nEvents);
			fprintf(pulse_fid, '%9.4f\t', f_total_pre);
			fprintf(pulse_fid, '%9.4f\t', nAps);
			fprintf(pulse_fid, '%9.4f\t', f_ap);
			fprintf(pulse_fid, '%9.4f\t', gain);
			fprintf(pulse_fid, '%9.4f\t', gainCv);
			fprintf(pulse_fid, '%9.4f\n', gainSem);
			
% Check the file counter to see how often to close and reopen the
%   pulse-counting data file.
%
% If the counter has reached the reset value, then close the
%    pulse-counting data file, reopen it in append mode, and reset the
%    file counter to zero.

                        if (dataset_count == dataset_reset)
			    status = fclose(pulse_fid);
			    pulse_fid = fopen(gvars.pulse_countsFILE, 'a');
			    dataset_count = 0;
			end;

% The file-counter for keeping track of when to close and reopen the
%   pulse-counting data file is incremented at the end of every
%   parameter loop.

                        dataset_count = dataset_count + 1;

		    end % gvars.iclampAMPLITUDE loop
		    
		end % i loop
		
	    end % j loop
	    
	end % gvars.gmBAR loop
	
    end % gvars.gcatBAR loop
    
    if (gvars.executionMODE < 3)
	meanPrePulseCountPerSynapse = nEvents / gvars.numSYN;
	meanPreFreqHz = meanPrePulseCountPerSynapse / integTimeSec;
	if (meanPrePulseCountPerSynapse == 0)
	    gains(iBootStrap) = 0;
	else
	    gains(iBootStrap) = gvars.apCOUNT / meanPrePulseCountPerSynapse;
	end
    end
    gvars.randSTATE(1, 1) = round(sum(100*clock));

end % iBootStrap loop

if (gvars.executionMODE < 3)
    bootstrap_gain(gains, gvars.nBootStrap, gvars.sessionFOLDER,meanPreFreqHz);
end

% Close the file for the I-V current-clamp step data if it was opened.

if (gvars.iclamp_stateFLAG == 2)
    status = fclose(istep_fid);
end

% Check if computing the full ode computations.
%
% If true, then close the pulse-counting data file for the last time
%   after all of the parameter cycles are completed.

if (gvars.executionMODE < 3)
    status = fclose(pulse_fid);
end

% For record keeping, display in the command window the version of
%   MATLAB being run.
  
strng = sprintf('\nMATLAB Version %s.\n\nFinis.\n', version);
disp(strng);

% The diary command is turned off.

diary off;

% Change directories into the folder generated for the current
%   numerical simulation, generate a performance report for the
%   current simulation, change back to the main working directory,
%   turn off the profiler, and move the saved diary file to the
%   current simulation's directory.  The profiler is not called if
%   only a conductance template was generated.

cd(gvars.sessionFOLDER);
if (gvars.executionMODE < 3)
    profile report rs_profile;
end
cd ..;
if (gvars.executionMODE < 3)
    profile off;
end
if (isunix == 1)
    cmdString = sprintf('cp output.txt %s', gvars.sessionFOLDER);
    unix(cmdString);
else
    copyfile('output.txt', gvars.sessionFOLDER, 'f');
end

% end function neurosim(execution_mode)


function bootstrap_gain(gain, N, sessionFolder, preFreqHz)

gainMean = mean(gain);
gainStdev = std(gain);
gainSem = gainStdev / N;
strng = sprintf('\ngain = %.2f +/- %.2f (n=%d)', gainMean, gainSem, N);
disp(strng);

gainFid = fopen('gain.dat', 'a');
fprintf(gainFid, '%.6f\t%.6f\t%d\t%.4f\n', gainMean, gainSem, N, preFreqHz);
fclose(gainFid);
copyfile('gain.dat', sessionFolder);

% end function bootstrap_gain(gain, N, sessionFolder)
