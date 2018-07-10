% This file contains all of the global variable definitions.
%
% Numerous global variables are used throughout the various functions
%   rather than passing variables through function calls.  To distinguish
%   global variables from local variables, the last word in all global
%   variable names is in capital letters.  Also, unlike the preceeding
%   words in a variable name, the last word is not separated from the
%   others by an underline character.  The words that make up local
%   variables are always in lower case and are always separated by an
%   underscore character.
%
% To maintain a consistent and coherent listing system, the global
%   variables are are grouped according to the function in which they
%   originate.  The global variables are listed in the order that the
%   function files are executed: neurosim.m, prm_init.m, menu.m, etc.
%
% by Diek W. Wheeler, Ph.D.

% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/21/02 removed tspan, y0, options, iCLAMP, epscBUFFER, and synTEMPLATE from
%	   the gvars structure so they are now passed through the function
%	   calls
%          added lenTEMPLATE to the gvars structure
% 11/22/02 added window of summation template mode, when it is
%          active only two conductance pulse are generated, it
%          works only in the steady rhythmic firing mode
% 04/09/03 renamed all of the global variables into 4 categories

% Global variables associated with the nicotinic synaptic conductance
%
% Synapse.eventTimeMsecArray
%         2-D array for the times of all of the primary and
%         secondary nicotinic synaptic events for the total
%         numerical integration time (ms)
% Synapse.firingModeArray
%         flag to determine the firing mode of the nicotinic
%         synapses: steady regular firing, no firing, stochastic 
%         Poisson-based firing
% Synapse.frequencyHz
%         firing rate of the synapses, multiple values are looped
%         through in turn by the simulation (Hz)
% Synapse.frequencyModulatorAmplitudeHz
%         amplitude of the modulatory oscillations of the firing
%         frequencies (Hz)
% Synapse.frequencyModulatorFunction
%         determines the waveform function that is used to modulate
%         the firing frequencies
% Synapse.frequencyModulatorPhaseRadianArray
%         phase difference between the modulatory oscillations of
%         the primary and secondary firing frequencies (radians)
% Synapse.frequencyModulatorRateHz
%         rate at which the primary firing frequencies are modulated (Hz)
% Synapse.gsynBarNsiemenArray
%         1-D array for the maximum nicotinic synaptic conductances
%         for both the primaries and secondaries (nS)
% Synapse.gsynFallTimeMsecArray
%         1-D array for the decay-time constants of the template
%         waveform function describing the time evolution of the
%         nicotinic synaptic conductance (ms)
% Synapse.gsynRiseTimeMsec
%         rising time constant of the template waveform function
%         describing the time evolution of the nicotinic synaptic
%         conductance (ms)
% Synapse.gsynScaling
%         scaling factor of the template function describing the time
%         evolution of the nicotinic synaptic conductance height and
%         is a function of Neuron.type
% Synapse.gsynThresholdNsiemen
%         threshold value for the nicotinic synaptic conductance (nS)
% Synapse.nEventArray
%         1-D array for the counters that keep track of the number of
%         primary and secondary synaptic events
% Synapse.nFrequency
%         number of firing frequencies to be looped through
% Synapse.number
%         number of nicotinic synapses to be modeled, must be at
%         least 2: 1 primary and 1 secondary

% Synapse.fire.rate	       (change to Synapse.freq.primary)
%
% Synapse.freq.secondary.num  number of secondary firing frequencies to loop
% 			         through, calculated by multiplying the primary
% 			         firing frequency times the number of secondary
% 			         synapses
% Synapse.num.secondary	       number of secondary synapses

% Global variables associated with the postsynaptic neural activity
%
% Neuron.gcngBarNsiemen
%      maximum conductance for the cyclic nucleotide-gated cation
%      leak current (nS)
% Neuron.gmBarNsiemen
%      maximum conductance for the M-type potassium current (nS)
% Neuron.initialValuesVmhnwArray
%      5-D array for the initial values of the simulation
%      variables (V,m,h,n,w) to be used between multiple
%      integration time segments
% Neuron.type
%      selects the type of sympathetic neuron to be modeled

% Neuron.C		       Membrane capacitance (pF)
%
% Neuron.current.max             maximum positive current during a total single
% 			         integration cycle
% Neuron.E.CNG		       Nernst equilibrium potential for the cyclic
% 			         nucleotide-gated cation leak current (mV)
% Neuron.E.K		       Nernst equilibrium potential for the 
% 			         delayed-rectifying potassium current (mV)
% Neuron.E.leak		       Nernst equilibrium potential for the 
% 			         voltage-independent leak current (mV)
% Neuron.E.Na		       Nernst equilibrium potential for the fast,
% 			         inactivating, voltage-dependent sodium
% 			         current (mV)
% Neuron.E.RCleak	               Nernst equilibrium potential for the RC-circuit
% 			         voltage-independent leak current (mV)
% Neuron.E.syn		       Nernst equilibrium potential for the nicotinic
% 			         synaptic current (mV)
% Neuron.g.CNG.end	       ending value when looping through multiple
% 			         values of the max. conductance for the cyclic
% 			         nucleotide-gated cation leak current (nS)
% Neuron.g.CNG.start	       starting value when looping through multiple
% 			         values of the max. conductance for the cyclic
% 			         nucleotide-gated cation leak current (nS)
% Neuron.g.CNG.step	       step value when looping through multiple values
% 			         of the maximum conductance for the cyclic
% 			         nucleotide-gated cation leak current (nS)
% Neuron.g.K.bar		       single value for the maximum conductance for the
% 			         delayed-rectifying potassium conductance (nS)
% Neuron.g.leak.bar	       single value for the maximum conductance for the
% 			         voltage-independent leak conductance (nS)
% Neuron.g.M.end		       ending value when looping through multiple
% 			         values of the maximum conductance for the
% 			         M-type potassium current (nS)
% Neuron.g.M.start	       starting value when looping through multiple
% 			         values of the maximum conductance for the
% 			         M-type potassium current (nS)
% Neuron.g.M.step		       step value when looping through multiple values
% 			         of the maximum conductance for the M-type
% 			         potassium current (nS)
% Neuron.g.Na.bar		       single value for the maximum conductance for the
% 			         fast, inactivating, voltage-dependent sodium
% 			         conductance (nS)
% Neuron.g.RCleak.bar	       single value for the maximum conductance for the
% 			         RC-circuit voltage-independent leak
% 			         conductance (nS)
% Neuron.Na.m.scale	       scaling factor for the Na activation parameter m
% 			         which controls the rate of activation

% Global variables associate with the current clamp mode
%
% Iclamp.activationDurationMsec
%        duration of activation of current clamp in either step or
%        ramp mode (ms)
% Iclamp.mode
%        flag to determine mode of operation of current clamp:
%        inactive, step currents, ramp current, or ZAP
% Iclamp.postActivationLatencyMsec
%        time for system to settle after conclusion of current clamp (ms)
% Iclamp.preActivationLatencyMsec
%        delay until activation of current clamp in either step or
%        ramp mode (ms)
% Iclamp.preRampActivationLatencyMsec
%        time for current clamp to settle before starting the
%        current ramp after the initial step is taken to the
%        starting current value (ms)
% Iclamp.rampAmplitudeStartPamp
%        starting current value for current ramp (pA)
% Iclamp.rampAmplitudeStopPamp
%        ending current value for current ramp (pA)
% Iclamp.stepAmplitudePamp
%        amplitude of the step currents during current-clamp
%        simulations (pA)
% Iclamp.stepAmplitudeStartPamp
%        starting current value when looping through multiple
%        values of the step current during current-clamp
%        simulations (pA)
% Iclamp.stepAmplitudeStopPamp
%        stopping value when looping through multiple values of the
%        step current during current-clamp simulations (pA)
% Iclamp.waveformAmplitudePamp
%        amplitude to scale a single current waveform (pA)
% Iclamp.zapAmplitudePamp
%        amplitude of sine wave used to compute the ZAP current function (pA)
% Iclamp.zapDurationMsec
%        duration of the ZAP function (ms)
% Iclamp.zapFrequencyMaximumHz
%        high end of the frequency spectrum used in generating the
%        ZAP function (Hz)
% Iclamp.zapFrequencyMinimumHz
%        low end of the frequency spectrum used in generating the
%        ZAP function (Hz)
% Iclamp.zapMode
%        determines whether the ZAP current function proceeds from
%        low to high frequencies or high to low frequencies
% Iclamp.zapPhaseRadian
%        phase lag of the ZAP current oscillations (rad)

% Iclamp.step.step	       step value when looping through multiple
% 			         values of the step current during
% 			         current-clamp simulations (pA)
%
%

% Global variables associated with the general maintenance of the program
%
% Misc.activationStartMsec
%      the nicotinic synapses and the current clamp may not be
%      activated before this time in order to allow the system
%      to reach equilibrium (ms)
% Misc.avgInterEventIntervalMsec
%      average time between synaptic events (ms)
% Misc.dataDirectoryName
%      name of the subdirectory that holds the results of the
%      simulation for the current parameter settings, a new
%      subfolder is generated for each set of parameters
% Misc.dataSuffix
%      suffix added to the names of datafiles and subdirectories
%      that contains some of the parameter settings for a given
%      parameter cycle
% Misc.executionMode
%      determines how much of the total program will execute before
%      the program terminates
% Misc.integrationSegmentStartMsec
%      time at which the current integration time segment begins,
%      updated for each integration time segment (ms)
% Misc.integrationSegmentStopMsec
%      time at which the current integration time segment ends, the
%      value is calculated by the program and changes depending on
%      the number of integration segments the simulation must be
%      broken up into in order to accomodate the limitations of the
%      computer's memory (ms)
% Misc.isActionPotential
%      indicates whether or not a new action potential has been
%      found when scanning through the membrane voltage data
% Misc.isDebug
%      flag for setting debugging mode, debug mode skips the menu
%      program and has its own set of default parameter settings,
%      all 3 execution modes are still available
% Misc.isMoreThanOneTimeSegment
%      indicates if there is more than one integration time segment
%      is to be cycled through
% Misc.lengthOfTemplate
%      length of the nicotinic synaptic conductance template synTEMPLATE
% Misc.nActionPotential
%      counter which tracks the number of action potentials found
%      in the voltage data
% Misc.nEventStartArray
%      2-D array for the starting event count of the primary and
%      secondary nicotinic synaptic events, the value of which is
%      updated if the total numerical integration time has been
%      broken into smaller segments
% Misc.nPoints
%      number of data points to be saved during the current
%      numerical integration segment
% Misc.randomNumberStateVector
%      35-element vector containing the current state of the random
%      number generator
% Misc.randomSeedSourceName
%      string that describe the source of seed for the random
%      number generator: system clock, user input, read from file
% Misc.saveStepMsec
%      how often the values of the variables of the
%      simulation(t,V,m,h,n,w) are saved to file (ms)
% Misc.shouldComputeSynapticEvents
%      determines the source of the nicotinic synaptic conductance
%      template: menu options or file
% Misc.simulationDirectoryName
%      name of the directory that holds the results of the
%      simulation, a new directory is generated every time the
%      simulation is run anew, each new directory is time stamped
% Misc.totalIntegrationTimeMsecArray
%      1-D array for the total integration times at each primary
%      firing frequency to be looped through, the default value is
%      a function of the frequency so that the simulation runs long
%      enough to produce approximately 400 EPSPs (ms)
% Misc.twoEventTemplateMode
%      determines the window of summation template mode, when it is
%      active only two conductance pulse are generated, it works
%      only in the steady rhythmic firing mode

% Misc.data.summary.file       name of the file that holds the parameter
% 			         settings of and the data produced by the
% 			         simulation
% Misc.dynamics.flag	       flag to determine source of dynamics code:
% 			         Yamada or Hermann & Boris
% Misc.dynamics.source	       2-D text array for strings describing the source
% 			         of dynamics code: Yamada or Hermann & Boris
% Misc.host.flag	       flag to determine on which host machine the
% 			         simulation is currently running
% Misc.host.machine	       3-D text array for strings describing the host
% 			         machine on which the simulation is currently
% 			         running: HornBlue1, HornDell5, HornDell6,
% 			         HornDell7, HornDell9, Condor
% Misc.parameter.file	       Binary file source for the simulation parameters
%
% Misc.parameter.flag	       flag to determine source of simulation
% 			         parameters: menu options or file
% Misc.parameter.source	       2-D text array for strings describing the source
% 			         of the simulation parameters: menu options or
% 			         file
% Misc.rand.seed.source	       3-D text array for strings describing the source
% 			         of seed for random number generator: system
% 			         clock, user input, read from file
% Misc.rand.state.file	       ????
%
% Misc.save.file	       Binary file source to which the simulation
% 			         parameters are saved
% Misc.save.flag	       flag to determine source to which the simulation
% 			         parameters are saved
% Misc.template.file	       Binary file source for the nicotinic synaptic
% 			         conductance template
% Misc.template.file.mark      marker to keep track of position in synaptic
% 			         conductance template file when reading in
%			         multiple integration-time segments
% Misc.template.source	       2-D text array for strings describing the source
% 			         of the nicotinic synaptic conductance
% 			         template: menu options or file
% Misc.time.downtime.LabVIEW   the amount of downtime that the LabVIEW program
% 			         will wait after it has run a synaptic template
% 			         for the determination of gain (sec)
% Misc.time.segment	       integration-time segement size that long
% 			         simulations will be broken down into to
% 			         accomodate computer memory restrictions (ms)
