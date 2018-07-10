function [prm_init_flag, synTEMPLATE, Synapse, Neuron, Iclamp, Misc] = ...
                                        prm_init(Synapse, Neuron, Iclamp, Misc)
% This function initializes variables and primes files for data
%   writing each time the function neurosim is executed.
%
% The value returned by the function call is used to either cease
%   execution of the program immediately or let the simulation
%   continue.  The key code that signals cessation of the program is
%   known only to the programmer and is hidden to the user.
%
% prm_init_flag == 1: continue execution of the program when control
%                    returns to the function neurosim.
% prm_init_flag == 0: discontinue execution of the program when control
%                    returns to the function neurosim.
%
% Function files called by this function: menu.m
%
% by Diek W. Wheeler, Ph.D.

% Last change 03/11/02
% 06/14/02 added RC-circuit option to cell choices
% 06/27/02 added pulseEND to the variable list
% 07/03/02 added gRCleakBAR and E_RCleak so the RC-circuit leak can be more
%          easily controlled by the user
% 07/19/02 set pulseEND default to zero as it will now be ignored in the
%          template files
% 08/12/02 added afterDELAY to allow the user to control the amount of
%          downtime the LabVIEW program will wait after a synaptic template has
%          been presented
% 08/14/02 added mSCALE to allow user control over activation rate of Na
% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/21/02 removed synTEMPLATE from the gvars structure so it is now passed
%	   through the function call
%          added lenTEMPLATE to the gvars structure
% 09/30/02 added headerSIZE to the variable list
% 11/22/02 added tsumMODE, when it is active only two conductance
%          pulse are generated, it works only in the steady rhythmic
%          firing mode
% 01/10/03 added new headers to the pulsecounts.dat file to
%          accomodate a new gain calculation, gain3, which is
%          NumAps/400.  Also added were the coefficient of
%          variation of NumAps and gain3, and the standard error of
%          the mean of gain3.  A Poisson distribution was assumed
%          to describe the number of APs.
% 04/05/03 changed startup values of primaryFREQS = 10.0 Hz and
%          integTIMES = 1000.0 ms.
% 04/07/03 rearranged variable settings so that the code is in the
%          order of the main menu listing
% 04/23/03 added initialization of the selection for modulator of
%          the presynaptic frequency: sine wave or step function
% 05/14/03 afterDELAY no longer an array of values, but simply a
%          number
% 05/15/03 started to add facilitaton and individual secondary synapses
%          Synapse.frequencyHz, Synapse.gsynThresholdNsiemen, and
%          Misc.avgInterEventIntervalMsec are no longer arrays and
%          are now the same for both primary and secondary synapses
% 05/16/03 finished adding facilitation and multiple secondaries
% 05/26/03 modified the pulsecounts.dat file by rearranging the
%          order of parameters being output, removing unneeded
%          columns and adding facilitation factor and decay rate
% 05/30/03 added bootstrap parameters
% 09/12/03 replaced structure variable Cell with Neuron
% 11/15/03 removed host computer selection from the menu
% 11/17/03 removed header size selection from the menu, now set
%          permanently to 128
% 12/11/24 added A-type potassium current

global gvars DEBUG                 % Definitions are located in global_defs.m

% Set the flag that is the value returned by the call to the function
%   prm_init.
%
% flag == 1: continue with the program when control returns to the
%            function neurosim
% flag == 0: stop the program when control returns to the function
%            neurosim
  prm_init_flag = 1;

% Establish the debugging mode for programmers which is hidden from
%   the normal user.  This allows the programmer to set up a special
%   set of parameters for debugging purposes without disrupting any
%   normal simulation settings.  The three debugging modes 11, 12, and
%   13 correspond to the execution modes 1, 2, and 3, respectively,
%   and are executed without ever accessing the menu function.  For
%   the rest of the function prm_init, the programmer will be able to
%   establish two sets of default values for all of the simulation
%   parameters.  One set will be used for debugging, and the other set
%   will be used for normal execution of the program by the user.
%

% The flag DEBUG is set equal to the number of times that 10 can be
%   divided into the current value of the parameter gvars.executionMODE.
%   Therefore, DEBUG will be set to either 0 == false or 1 == true.
%
% The parameter gvars.executionMODE is set equal to the quotient
%   remainder when the current value of gvars.executionMODE is divided
%   by 10.  Therefore, gvars.executionMODE will be set to either 1, 2,
%   or 3.
  DEBUG = floor(gvars.executionMODE/10);
  Misc.isDebug = floor(gvars.executionMODE/10);
  gvars.executionMODE = mod(gvars.executionMODE,10);

% Set the spectrum of the frequencies for the primaries (Hz).
if DEBUG
    ztime = 20.0;
    gvars.primaryFREQS = [1000/ztime];
%    gvars.primaryFREQS = [1.0];
else
    gvars.primaryFREQS = [10.0];
    Synapse.nFrequency = length(gvars.primaryFREQS);
end

% Set the total numerical integration times.
%
% Initially the times are computed based on producing an average of
%   400 primary synaptic firings at the user defined primary
%   frequencies.  The times are rounded up to next highest whole
%   millisecond.
  if DEBUG
    gvars.integTIMES = 60;
  else
    for i = 1:length(gvars.primaryFREQS)
      if (gvars.primaryFREQS(i) < 0.3)
        gvars.integTIMES(i) = ceil(200 * (1000 / gvars.primaryFREQS(i)));
      else
        gvars.integTIMES(i) = ceil(400 * (1000 / gvars.primaryFREQS(i)));
      end
    end % i loop
    gvars.integTIMES = 1000;
  end % if DEBUG

% Set the array declaring the number of secondary synapses.
  if DEBUG
    gvars.numSECONDARIES = [1];
  else
    gvars.numSECONDARIES = [9];
  end

% Set the total number of synapses to be simulated.  THERE MUST BE AT
%   LEAST 2.  This minimum is required because the program as it is
%   currently written assumes that there is at least one primary
%   synapse and one secondary synapse.

gvars.numSYN = 1 + gvars.numSECONDARIES;


% Default levels for the maximum nicotinic synaptic conductances for
%   both the primaries and the secondaries.
%
% Primaries: define the absolute level in nS.
%
% Secondaries: define the level relative to the threshold nicotinic
%   synaptic conductance.

if DEBUG
    gvars.gsynBAR(1) = 1.0;
    gvars.gsynBAR(2:gvars.numSYN) = 0.90;
else
    gvars.gsynBAR(1) = 100.0;
    gvars.gsynBAR(2:gvars.numSYN) = 0.90;
end

% Set the default seed source of the random number generator.
%
% 1 == system clock
% 2 == user input
% 3 == read from file
  if DEBUG
    gvars.rand_stateFLAG = ones(length(gvars.primaryFREQS), 1);
  else
    gvars.rand_stateFLAG = ones(length(gvars.primaryFREQS), 1);
  end

% Set the default state for the random number generator, which is
%   seeded by the current value of the system clock.
  if DEBUG
     gvars.randSTATE = 777;
%    gvars.randSTATE = zeros(35,length(gvars.primaryFREQS));
%    for i = 1:length(gvars.primaryFREQS)
%      gvars.randSTATE(1,i) = round(sum((100+i-1)*clock));
%    end % i loop
  else
    gvars.randSTATE = zeros(35,length(gvars.primaryFREQS));
    for i = 1:length(gvars.primaryFREQS)
      gvars.randSTATE(1,i) = round(sum((100+i-1)*clock));
    end % i loop
  end

% Set the flag to determine the firing mode for the synapses.
%
% -1 == Steady firing
%  0 == No firing
% +1 == Stochastic firing
  
if DEBUG
    gvars.fireMODE(1) = -1;
    gvars.fireMODE(2:gvars.numSYN) = 0;
else
    gvars.fireMODE(1) = 1;
    gvars.fireMODE(2:gvars.numSYN) = 1;
end


% Set the temporal resolution of the data (t,V,m,h,n,w) that is saved
%   to file (msec).
  if DEBUG
    gvars.saveSTEP = 0.05;
  else
    gvars.saveSTEP = 0.25;
  end

% Set the initial start time for the synapse (msec).
%
% This delay allows the system to reach equilibrium before proceeding
%   with the rest of the simulation.
  if DEBUG
    gvars.pulseSTART = 40;
  else
    gvars.pulseSTART = 600;
  end

% If the window of summation mode is active, then only 2
%   conductance pulses are generated for the template.
  gvars.tsumMODE = 0;
  
% Set the amplitude of the modulation of the firing frequencies (Hz).
  if DEBUG
    gvars.f_oscAMPLITUDE = 0.0;
  else
    gvars.f_oscAMPLITUDE = 0.0;
  end

% Set the rate of modulation of the firing frequencies (Hz).
  if DEBUG
    gvars.f_oscRATE = 0.0;
  else
    gvars.f_oscRATE = 0.0;
  end

% Set the phase of the modulation of the firing frequencies (radians).
  if DEBUG
    gvars.f_oscPHASE(1) = 0;
    gvars.f_oscPHASE(2:gvars.numSYN) = 0;
  else
    gvars.f_oscPHASE(1) = 0;
    gvars.f_oscPHASE(2:gvars.numSYN) = 0;
  end

% Set the default cell type.  The two cell types are currently only
%   distinguished by the differing fall times for their EPSC's.
% Default levels for the threshold nicotinic synaptic conductance for
%   primaries and secondaries for firing an action potential.
%
% B cells: riseTIME = 1 fallTIME =  5 fallTIME2 =  0 gsynSCALING = 0.534985
%          threshold = 10.68 nS       tsum = 14.8 ms @ gsyn/gsyn-th = 0.90
% C cells: riseTIME = 1 fallTIME = 10 fallTIME2 =  0 gsynSCALING = 0.696835
% D cells: riseTIME = 1 fallTIME =  5 fallTIME2 = 35 gsynSCALING = 1.374379754
% E cells: riseTIME = 1 fallTIME =  5 fallTIME2 = 50 gsynSCALING = 1.497017741
% M cells: riseTIME = 1 fallTIME = 25 fallTIME2 =  0 gsynSCALING = 0.8394993544
%          threshold = 6.50 nS
% S cells: riseTIME = 1 fallTIME = 50 fallTIME2 =  0 gsynSCALING = 0.9048007131
%          threshold = 5.81 nS        tsum = 22.1 ms @ gsyn/gsyn-th = 0.90
  if DEBUG
    gvars.cellTYPE = 'B';
    gvars.riseTIME = 1;
    gvars.fallTIME = 5;
    gvars.fallTIME2 = 0;
    gvars.thresholdGSYN = 10.68;
    gvars.gsynSCALING = 0.534985;
  else
    gvars.cellTYPE = 'B';
    gvars.riseTIME = 1;
    gvars.fallTIME = 5;
    gvars.fallTIME2 = 0;
    gvars.thresholdGSYN = 10.68;
    gvars.gsynSCALING = 0.534985;
  end

% Set the segmental, numerical integration time (msec).
%
% Longer numerical integration times are broken into temporal segments
%   of this size.
  if DEBUG
    gvars.baseTIME = 50000;
  else
    gvars.baseTIME = 50000;
  end

% Set the maximum conductance (nS), the Nernst potential (mV), and the
%   activation-parameter scaling factor for the for the fast,
%   inactivating, voltage-dependent sodium current.
  if DEBUG
    gvars.gNaBAR = 800;
    gvars.E_Na = 60;
    gvars.mSCALE = 0.5;
  else
    gvars.gNaBAR = 800;
    gvars.E_Na = 60;
    gvars.mSCALE = 0.5;
  end

% Set the maximum conductance (nS) and Nernst potential (mV) for the
%   delayed-rectifying potassium current.
  if DEBUG
    gvars.gKBAR = 2000;
    gvars.E_K = -90;
  else
    gvars.gKBAR = 2000;
    gvars.E_K = -90;
  end

% Set the maximum conductance (nS) and Nernst potential (mV) for the
%   voltage-independent leak current.
  if DEBUG
    gvars.gleakBAR = 3;
    gvars.E_leak = -40;
  else
    gvars.gleakBAR = 3;
    gvars.E_leak = -40;
  end

% Set the maximum conductance (nS) and Nernst potential (mV) for the
%   RC-circuit voltage-independent leak current.
  if DEBUG
    gvars.gRCleakBAR = 2;
    gvars.E_RCleak = 0;
  else
    gvars.gRCleakBAR = 0;  % == 2 nS for the RC-circuit test cell
    gvars.E_RCleak = 0;
  end

% Set the ranges for the maximum conductance of the M-type potassium
%   current (nS).
  if DEBUG
    gvars.gmSTART = 40;
    gvars.gmSTEP = -20;
    gvars.gmEND = 40;
  else
    gvars.gmSTART = 40;
    gvars.gmSTEP = -20;
    gvars.gmEND = 40;
  end

% Set the ranges for the maximum conductance of the cyclic
%   nucleotide-gated cation leak current (nS).
  if DEBUG
    gvars.gcatSTART = 0;
    gvars.gcatSTEP = 4;
    gvars.gcatEND = 0;
  else
    gvars.gcatSTART = 0;
    gvars.gcatSTEP = 4;
    gvars.gcatEND = 0;
  end

% Set the Nernst potential for the cyclic nucleotide-gated cation leak
%   current (mV).
  gvars.E_cat = 0;

% Set the Nernst potential for the nicotinic synaptic current (mV).
  gvars.E_syn = 0;

% Set the maximum conductance (nS), Nernst potential (mV), and the
%   activation time constant scaling factor for the A-type
%   potassium current.
  if DEBUG
    gvars.gABAR = 200;
    gvars.E_A = -84;
    gvars.aActTauScaleFactor = 1;
  else
    gvars.gABAR = 0;
    gvars.E_A = -84;
    gvars.aActTauScaleFactor = 1;
  end

% Set the whole-cell, membrane capacitance (pF).
  if DEBUG
    gvars.C = 100;
%    gvars.C = 33;
  else
    gvars.C = 100;
  end

% Set the initial values for the membrane voltage and the
%   activation/inactivation variables
Neuron.initialValuesArray(1) = -62.4;       % Init. holding potential (mV)
Neuron.initialValuesArray(2) = 0.0000422117;% Initial sodium activation
Neuron.initialValuesArray(3) = 0.9917;      % Initial sodium inactivation
Neuron.initialValuesArray(4) = 0.00264776;  % Initial potassium activation
Neuron.initialValuesArray(5) = 0.0605834;   % Initial m current activation
Neuron.initialValuesArray(6) = 0.0626768;   % Initial A-current activation
Neuron.initialValuesArray(7) = 0.145326;    % Initial A-current inactivation

% Set the flag to determine the status of the current-clamp function.
%
% 1 == inactive.
% 2 == step.
% 3 == ramp.
% 4 == ZAP.
% 5 == single waveform
  if DEBUG
    gvars.iclamp_stateFLAG = 1;
  else
    gvars.iclamp_stateFLAG = 1;
  end

% Set the parameters for the current clamp function.
%
% Latency  == the time delay until the start of the current step (ms).
% Settle   == the time for the system to settle at the start of the
%             current ramp (ms).
% Duration == the temporal duration of the current step. (ms)
% Downtime == the time for the system to settle after the current
%             step is finished (ms).
  if DEBUG
    gvars.iclampLATENCY = 0;
    gvars.iclampSETTLE = 400;
    gvars.iclampDURATION = 500;
    gvars.iclampDOWNTIME = 200;
  else
    gvars.iclampLATENCY = 0;
    gvars.iclampSETTLE = 400;
    gvars.iclampDURATION = 500;
    gvars.iclampDOWNTIME = 200;
  end

% Set the ranges for the amplitudes of the current-clamp steps (pA).
  if DEBUG
    gvars.istepSTART = -200;
    gvars.istepSTEP = 50;
    gvars.istepEND = -200;
  else
    gvars.istepSTART = -200;
    gvars.istepSTEP = 200;
    gvars.istepEND = -200;
  end

% Set the ranges for the amplitudes of the current-clamp ramp (pA).
  if DEBUG
    gvars.irampSTART = -200;
    gvars.irampEND = 200;
  else
    gvars.irampSTART = -200;
    gvars.irampEND = 200;
  end

% Set the parameters for the current-clamp ZAP function.
%
% Fosc      == the amplitude of the ZAP-current oscillations (pA).
% Duration  == the temporal duration of the ZAP function (mS).
% Lofreq    == the lowest frequency implemented in the ZAP function (Hz).
% Hifreq    == the highest frequency implemented in the ZAP function (Hz).
% Phase     == the phase lag of the ZAP-current oscillations (radians).
% Stateflag == either 1: low-high frequency progression,
%                  or 2: high-low frequency progression.
  if DEBUG
    gvars.zap_fOSC = 100;
    gvars.zapDURATION = 2000;
    gvars.zap_loFREQ = 0;
    gvars.zap_hiFREQ = 20;
    gvars.zapPHASE = 0;
    gvars.zap_stateFLAG = 1;
  else
    gvars.zap_fOSC = 100;
    gvars.zapDURATION = 20000;
    gvars.zap_loFREQ = 0;
    gvars.zap_hiFREQ = 20;
    gvars.zapPHASE = 0;
    gvars.zap_stateFLAG = 1;
  end

% Set the parameters for the current-clamp single waveform function.
  if DEBUG
      Iclamp.waveformAmplitudePamp = 100;
  else
      Iclamp.waveformAmplitudePamp = 100;
  end
  
% Set the dynamics flag which determines whether to use Yamada's or
%   Hermann & Boris' dynamics code and parameter settings
%
% 1 == Yamada
% 2 == Hermann & Boris
  if DEBUG
    gvars.dynamicsFLAG = 1;
  else
    gvars.dynamicsFLAG = 1;
  end

% Set the save-file flag which determines whether to save the
%   simulation's parameters to a binary file for later recall
%
% 1 == none
% 2 == binary file
  if DEBUG
    gvars.saveFLAG = 1;
  else
    gvars.saveFLAG = 1;
  end

% Set the default filename to which the simulation parameters will be saved
  if DEBUG
    gvars.saveFILE = 'none';
  else
    gvars.saveFILE = 'none as yet assigned';
  end

% Set the parameters flag which determines whether to use the menu
%   options or a parameter file as the source for the simulation's
%   parameters
%
% 1 == menu options
% 2 == parameter file
  if DEBUG
    gvars.parameterFLAG = 1;
  else
    gvars.parameterFLAG = 1;
  end

% Set the default file name for the simulation parameters
  if DEBUG
    gvars.parameterFILE = 'none';
  else
    gvars.parameterFILE = 'none as yet assigned';
  end

% Set the template flag which determines whether to use the menu
%   options or a binary file as the source for the nicotinic synaptic
%   conductance template
%
% 1 == menu options
% 2 == binary file
  if DEBUG
    gvars.templateFLAG = 1;
  else
    gvars.templateFLAG = 1;
  end

% Set the default file name for the nicotinic synaptic conductance template
  if DEBUG
    gvars.templateFILE = 'none';
  else
    gvars.templateFILE = 'none as yet assigned';
  end

% Set the size of the header to the template files, either 19 or
%   128 single floating-point numbers
  gvars.headerSIZE = 128;
  
% Set the default after-template delay time (sec)
  if DEBUG
      gvars.afterDELAY = 2;
  else
      gvars.afterDELAY = 2;
  end

% This delay (msec) allows the system to reach equilibrium at the end
%   of the simulation.
  if DEBUG
    gvars.pulseEND = 0; % Now an ignored feature (07/19/02).
  else
    gvars.pulseEND = 0; % Now an ignored feature (07/19/02).
  end

% Set the flag to determine the waveform of the
%   presynaptic-frequency modulator
%
% 1 == sine wave
% 2 == step function
  if DEBUG
    gvars.fpre_modFLAG = 1;
  else
    gvars.fpre_modFLAG = 1;
  end

% Set facilitation mode

if DEBUG
    gvars.isFacilitationActive = 0;
    gvars.facilitationFactor = 2;
    gvars.facilitationDecayRateMsec = 12;
else
    gvars.isFacilitationActive = 0;
    gvars.facilitationFactor = 2;
    gvars.facilitationDecayRateMsec = 12;
end
  
% Bootstrap parameters.

gainFid = fopen('gain.dat', 'w');
fprintf(gainFid, 'gain_Bstrap\tSEM_Bstrap\tN_Bstrap\tFpre_Bstrap\n');
fclose(gainFid);
gvars.nBootStrap = 1;

% Call the function menu to allow the user to change the simulation
%   parameter values.  The value returned by the function call is used
%   to either cease execution of the program immediately or let the
%   simulation continue.  The key code that signals cessation of the
%   program is known only to the programmer and is hidden to the user.

% TO BE REMOVED
Neuron.type = gvars.cellTYPE;
% TO BE REMOVED

  [prm_init_flag, Synapse, Neuron, Iclamp] = menu(Synapse, Neuron, Iclamp);
  if (prm_init_flag == 0)
    synTEMPLATE = 0;
    return;
  end

% Set the count of the number of primary frequencies to be cycled
%   through.
  gvars.num_primaryLOOPS = length(gvars.primaryFREQS);
  
% Set the count of the number of secondary synaptic formations to be
%   cycled through.
  gvars.num_secondaryLOOPS = length(gvars.numSECONDARIES);

% Set the maximum nicotinic synaptic conductances for both the
%   primaries (nS) and secondaries.  The primary conductance is set to
%   an absolute value in nanoSiemens.  The secondary conductance is
%   set to a value relative to the threshold synaptic conductance.

gvars.gsynBAR(1) = gvars.gsynBAR(1);
gvars.gsynBAR(2:gvars.numSYN) = gvars.gsynBAR(2:gvars.numSYN) .* ...
    gvars.thresholdGSYN;


% A special flag is set for those instances where dual exponential
%   kinetics are required to model the falling phase of the nicotinic
%   synaptic conductance dynamics.
  if (gvars.cellTYPE == 'D' | gvars.cellTYPE == 'E')% double exponential B cell
    skok_flag = 1;
  else
    skok_flag = 0;
  end

% Initialize the directory for the data generated during the current
%   session.
%
% The folder that is created has as its base the word 'session.'
%   Appended to this are the current date and the current time.
%
% There is a check made to see if the simulation is being run on a PC
%   or not, so the proper command can be executed to create the new
%   directory.
  now_date = datestr(now, 2);
  now_time = datestr(now, 13);
  gvars.sessionFOLDER = sprintf('session%s%s%s_%s_%s_%s', now_date(1:2), ...
                  now_date(4:5), now_date(7:8), now_time(1:2), ...
                  now_time(4:5), now_time(7:8));

  comp = computer;
  if (comp(1:5) == 'PCWIN')
    status = mkdir(gvars.sessionFOLDER);
  else % computer == 'LINUX'
    make_folder = sprintf('mkdir %s', gvars.sessionFOLDER);
    unix(make_folder);
  end

% Check if computing full ode computations.
%
% If true, then open the text file for the pulse-counting data and
%   write the header to the file.  The header labels the columns of
%   data that will be written to the file.  The column names are in a
%   format that is readable by Igor (WaveMetrics).
  if (gvars.executionMODE < 3)

    gvars.pulse_countsFILE = sprintf('%s/pulsecounts.dat',gvars.sessionFOLDER);
    pulse_fid = fopen(gvars.pulse_countsFILE, 'w');

    fprintf(pulse_fid, 'Fire_Time_ms\t');
    fprintf(pulse_fid, 'Fire_Rate_Hz\t');
    fprintf(pulse_fid, 'Famp_Hz\t');
    fprintf(pulse_fid, 'Frate_Hz\t');
    fprintf(pulse_fid, 'Fphase_Rad\t');
    fprintf(pulse_fid, 'n2nds\t');
    fprintf(pulse_fid, 'gsyn-th_nS\t');
    fprintf(pulse_fid, 'gsyn1_nS\t');
    fprintf(pulse_fid, 'gsyn1/gsyn-th\t');
    fprintf(pulse_fid, 'gsyn2_nS\t');
    fprintf(pulse_fid, 'gsyn2/gsyn-th\t');
    fprintf(pulse_fid, 'gM_bar_nS\t');
    fprintf(pulse_fid, 'gCNG_bar_nS\t');
    fprintf(pulse_fid, 'tauFall_ms\t');
    fprintf(pulse_fid, 'FacilFactor\t');
    fprintf(pulse_fid, 'FacilRate_ms\t');
    fprintf(pulse_fid, 'nEPSPs1\t');
    fprintf(pulse_fid, 'F1pre_Hz\t');
    fprintf(pulse_fid, 'nEPSPs2\t');
    fprintf(pulse_fid, 'F2pre_Hz\t');
    fprintf(pulse_fid, 'nEPSPs\t');
    fprintf(pulse_fid, 'Fin_Hz\t');
    fprintf(pulse_fid, 'nAPs\t');
    fprintf(pulse_fid, 'Fout_Hz\t');
    fprintf(pulse_fid, 'gain\t');
    fprintf(pulse_fid, 'gain_CV\t');
    fprintf(pulse_fid, 'gain_SEM\n');

    status = fclose(pulse_fid);

  end % if (gvars.executionMODE)

% Compute the template for the nicotinic synaptic conductance and save
%   the template to an array.
%
% The array covers a 50 ms window with a grain determined by gvars.saveSTEP.
%
% There is a check to see if the flag is set signaling the use of dual
%   exponentials to describe the nicotinic synaptic dynamics.
  time = 0:gvars.saveSTEP:500;

  if (skok_flag)
    synTEMPLATE = [(-2*exp(-time/gvars.riseTIME) + ...
                                                exp(-time/gvars.fallTIME) + ...
                               exp(-time/gvars.fallTIME2))/gvars.gsynSCALING]';
  else
    synTEMPLATE = [(-exp(-time/gvars.riseTIME) + exp(-time/gvars.fallTIME)) ...
                                                         / gvars.gsynSCALING]';
  end
  gvars.lenTEMPLATE = length(synTEMPLATE);			   
