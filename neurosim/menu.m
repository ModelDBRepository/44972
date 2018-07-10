function [menu_flag, Synapse, Neuron, Iclamp] = menu(Synapse, Neuron, Iclamp)
% This function allows users to establish parameter settings for the
%   simulation.
%
% The value returned by the function call is used to either cease
%   execution of the program immediately or let the simulation
%   continue.  The key code that signals cessation of the program is
%   known only to the programmer and is hidden to the user.
%
% menu_flag == 1: continue execution of the program when control
%                 returns to the function neurosim.
% menu_flag == 0: discontinue execution of the program when control
%                 returns to the function neurosim.
%
% Function files called by this function: none
% 
% by Diek W. Wheeler, Ph.D.

% Last change 04/16/02
%   when the number of secondaries is changed by user input, the total
%   number of synapses remains at 2, it is not changed to n+1.
% 06/14/02 added RC-circuit option to cell choices
% 06/27/02 added pulseEND to main menu selection, pulse_end_menu,
%          template_submenu, parameter_submenu, and save_menu
% 07/03/02 added gRCleakBAR and E_RCleak so the RC-circuit leak can be more
%          easily controlled by the user
% 07/23/02 removed pulseEND from being read in from a saved template file
% 07/24/02 removed pulseEND from menu selection
%          put random seed selection back at top of menu list
% 08/12/02 added afterDELAY to the main menu selection, to the parameter
%          read-in function, and to the parameter write-out function
%          added cell_type_submenu function to allow the user to modify the
%          parameters describing the standard cell types 
% 08/14/02 added mSCALE to allow user control over activation rate of Na
% 08/15/02 increased template header size to 512-bytes, or 128 single floats
% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/20/02 rand_stateFILE was only being written out and read in as an array of
%	   length 20 instead of length 42 to match up with the length of
%	   blank_array, which caused problems when the number of primaryFREQS
%	   was increased and the program attempted to add another copy of
%	   blank_array to rand_stateFILE
% 08/21/02 added rounding function float to read-in of saveSTEP
%          value during read-in of a template from file
% 08/23/02 modified the functions that control the saving and
%          loading of parameters so that now the global structure
%          gvars is loaded and saved all at once rather than one
%          variable at a time
% 09/30/02 added headerSIZE to the menu selection along with header_size_menu
% 11/22/02 added threshold-gsyn value to main menu when displaying
%          gsyn values
%          added window of summation template mode, when it is
%          active only two conductance pulse are generated, it
%          works only in the steady rhythmic firing mode
% 03/11/03 changed display of thresholdGSYN and gsynBAR from 2
%          decimal places to 3
% 04/04/03 rearranged menu list in order of frequency of use and to better
%          group template-only selections
% 04/07/03 switched the list order of parameter saving and loading
%          and template loading
%          rearranged the functions called from the main menu so
%          they are coded in the order that they are listed
%          corrected extra code that updated both hostFLAG and
%          hostNUMBER so only hostNUMBER remains and corrected
%          machine number allocations
%          deleted all code related to afterDELAY, but the
%          parameter still exists in other functions
% 04/23/03 added selection for modulator of the presynaptic
%          frequency: sine wave or step function
% 05/15/03 started to add facilitaton and individual secondary synapses
%          Synapse.frequencyHz, Synapse.gsynThresholdNsiemen, and
%          Misc.avgInterEventIntervalMsec are no longer arrays and
%          are now the same for both primary and secondary synapses
% 05/16/03 finished adding facilitation and multiple secondaries
% 05/26/03 added update_integration_times function to update the
%          number of integration times whenever the number of
%          primary frequencies is potentially changed
% 05/30/03 added bootstrap parameters to menu
% 09/04/03 rearranged current clamp menu selections
% 09/12/03 replaced structure variable Cell with Neuron
% 11/01/03 changed cell_type to neuron_type
% 11/14/03 added menu item for initial V, m, h, n, and w values
% 11/15/03 removed host computer selection from the menu
% 11/17/03 removed header size selection from the menu, now set
%          permanently to 128, combined cation conductance
%          parameters into a single menu selection
% 12/11/24 added A-type potassium current

  global gvars DEBUG                 % Definitions are located in global_defs.m

% Initialize the flag to be returned by the function menu.  The value
%   returned by the function call is used to either cease execution of
%   the program immediately or let the simulation continue.  The key
%   code that signals cessation of the program is known only to the
%   programmer and is hidden to the user.
%
% 1 == continue execution of the program
% 0 == discontinue execution of the program
  menu_flag = 1;

  blank_array = '                                          ';

  gvars.rand_stateFILE = repmat(blank_array, 20, 1);

  gvars.parameterFILE = repmat(blank_array, 20, 1);

  gvars.saveFILE = repmat(blank_array, 20, 1);

% 3-D text array for strings describing the source of seed for random
%   number generator.
  gvars.rand_seedSOURCE = ['system clock  ';
			   'user input    ';
			   'read from file'];

  iclamp_mode = ['inactive';
                 'step    ';
                 'ramp    ';
                 'ZAP     ';
		 'waveform'];

  fpre_modulator = ['sine wave        ';
                    'step function    ';
                    'summed sine waves'];

% 2-D text array for strings describing the source of dynamics code.
  gvars.dynamicsSOURCE = ['Yamada         ';
                          'Hermann & Boris'];

% 2-D text array for strings describing the source of the nicotinic
%   synaptic conductance template.
  gvars.templateSOURCE = ['menu options';
                          'binary file '];

  gvars.parameterSOURCE = ['menu options  ';
                           'parameter file'];

  if (gvars.executionMODE == 3)
    template_params_only = 1;
  else
    template_params_only = 0;
  end

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please enter a selection from the menu below ');
    strng = sprintf('%s(current values in parentheses): \n', strng);
    disp(strng);

    strng = sprintf('    1) Presynaptic firing frequency {favg} ([');
    Synapse.nFrequency = length(gvars.primaryFREQS);
    nFreqs = Synapse.nFrequency;
    for i = 1:nFreqs
      strng = sprintf('%s%.2f ', strng, gvars.primaryFREQS(i));
    end % i loop
    strng = sprintf('%s] Hz) ', deblank(strng));
    disp(strng);
    update_integration_times(nFreqs);

    strng = sprintf('    2) Total numerical integration time {integTIMES} ([');
    for i = 1:nFreqs
      strng = sprintf('%s%.2f ', strng, gvars.integTIMES(i));
    end % i loop
    strng = sprintf('%s] ms) ', deblank(strng));
    disp(strng);

    strng = sprintf('    3) Number of secondary synapses ');
    strng = sprintf('%s(%d) ', strng, gvars.numSECONDARIES);
    disp(strng);

    strng = sprintf('    4) Maximum synaptic conductance levels {gsyn} ');
    strng = sprintf('%s([%.3f]', strng, gvars.gsynBAR(1));
    strng = sprintf('%s %.3f*[', strng, gvars.thresholdGSYN);
    for i = 2:gvars.numSYN
	strng = sprintf('%s%.3f', strng, gvars.gsynBAR(i));
	if (i < gvars.numSYN)
	    strng = sprintf('%s ', strng);
	end
    end
    strng = sprintf('%s])', strng);
    disp(strng);

    strng = sprintf('    5) Random seed source (');
    dim = length(gvars.primaryFREQS);
    for i = 1:dim
      strng = sprintf('%s%s', strng, ...
                    deblank(gvars.rand_seedSOURCE(gvars.rand_stateFLAG(i),:)));
      if (gvars.rand_stateFLAG(i) < 3)
        strng = sprintf('%s: %d', strng, gvars.randSTATE(1,i));
      else
        strng = sprintf('%s: %s', strng, deblank(gvars.rand_stateFILE(i,:)));
      end
      if (i < dim)
        strng = sprintf('%s, ', strng);
      end
    end % i loop
    strng = sprintf('%s)', strng);
    disp(strng);

    strng = sprintf('    6) Firing modes ([%d][', gvars.fireMODE(1));
    for i = 2:gvars.numSYN
      strng = sprintf('%s%d ', strng, gvars.fireMODE(i));
    end
    strng = sprintf('%s])', deblank(strng));
    disp(strng);

    strng = sprintf('    7) Temporal resolution for saving data ');
    strng = sprintf('%s(%.5f ms) ', strng, gvars.saveSTEP);
    disp(strng);

    strng = sprintf('    8) Duration of settling time at start of run ');
    strng = sprintf('%s(%.1f ms) ', strng, gvars.pulseSTART);
    disp(strng);

    strng = sprintf('    9) Tsum template mode (');
    if (gvars.tsumMODE == 1)                % parameters not saved to file
      strng = sprintf('%sactive (mode 1))', strng);
    elseif (gvars.tsumMODE == 2)                % parameters not saved to file
      strng = sprintf('%sactive (mode 2))', strng);
    else                                    % parameters saved to a binary file
      strng = sprintf('%sinactive)', strng);
    end
    disp(strng);
    
    strng = sprintf('   10) Amplitude of modulation of the firing frequency ');
    strng = sprintf('%s{fosc} (%.2f Hz) ', strng, gvars.f_oscAMPLITUDE);
    disp(strng);

    strng = sprintf('   11) Rate of modulation of the firing frequency ');
    strng = sprintf('%s{fHR} (%.2f Hz) ', strng, gvars.f_oscRATE);
    disp(strng);

    strng = sprintf('   12) Phase of modulation of the firing frequencies ');
    strng = sprintf('%s([%.2f] [', strng, gvars.f_oscPHASE(1));
    if (length(gvars.f_oscPHASE) < gvars.numSYN)
        gvars.f_oscPHASE(3:gvars.numSYN) = gvars.f_oscPHASE(2);
    end
    for i = 2:gvars.numSYN
	strng = sprintf('%s%.2f ', strng, gvars.f_oscPHASE(i));
    end
    strng = sprintf('%s] radians)', deblank(strng));
    disp(strng);

    strng = sprintf('   13) Neuron type (%s)', gvars.cellTYPE);
    disp(strng);

    strng = sprintf('   14) Segmental integration time');
    strng = sprintf('%s (%.1f ms) ', strng, gvars.baseTIME);
    disp(strng);

    if (~template_params_only)
      strng = sprintf('   15) Sodium current parameters');
      strng = sprintf('%s (gNa_bar=%.1f nS;', strng, gvars.gNaBAR);
      strng = sprintf('%s E_Na=%.1f mV;', strng, gvars.E_Na);
      strng = sprintf('%s mSCALE=%.3f)', strng, gvars.mSCALE);
      disp(strng);

      strng = sprintf('   16) Potassium current parameters');
      strng = sprintf('%s (gK_bar=%.1f nS;', strng, gvars.gKBAR);
      strng = sprintf('%s E_K=%.1f mV)', strng, gvars.E_K);
      disp(strng);

      strng = sprintf('   17) Maximum M-current conductance {gM} ');
      strng = sprintf('%s(%.1f : %.1f : ', strng, gvars.gmSTART, gvars.gmSTEP);
      strng = sprintf('%s%.1f nS)', strng, gvars.gmEND);
      disp(strng);

      strng = sprintf('   18) Leak current parameters');
      strng = sprintf('%s (gLeak_bar=%.1f nS;', strng, gvars.gleakBAR);
      strng = sprintf('%s E_Leak=%.1f mV;', strng, gvars.E_leak);
      strng = sprintf('%s gRcLeak_bar=%.1f nS;', strng, gvars.gRCleakBAR);
      strng = sprintf('%s E_RcLeak=%.1f mV)', strng, gvars.E_RCleak);
      disp(strng);

      strng = sprintf('   19) Cation current parameters');
      strng = sprintf('%s (gCat_bar=%.2f', strng, gvars.gcatSTART);
      strng = sprintf('%s:%.2f', strng, gvars.gcatSTEP);
      strng = sprintf('%s:%.2f nS;', strng, gvars.gcatEND);
      strng = sprintf('%s E_cat=%.1f mV)', strng, gvars.E_cat);
      disp(strng);

      strng = sprintf('   20) Nernst potential for nicotinic synaptic');
      strng = sprintf('%s current (E_syn=%.1f mV)', strng, gvars.E_syn);
      disp(strng);

      strng = sprintf('   21) A current parameters');
      strng = sprintf('%s (gA_bar=%.1f nS;', strng, gvars.gABAR);
      strng = sprintf('%s E_A=%.1f mV; ', strng, gvars.E_A);
      strng = sprintf('%s actTauScale=%.1f)', strng, gvars.aActTauScaleFactor);
      disp(strng);

      strng = sprintf('   22) Membrane capacitance (C=%.1f pF)', gvars.C);
      disp(strng);

      strng = sprintf(['   23) Initial V (%.2f mV), m (%.8f), ' ...
		       'h (%.8f), n (%.8f), w (%.8f), mA (%.8f), ' ...
		       'hA (%.8f)'], ...
                      Neuron.initialValuesArray(1), ...
		      Neuron.initialValuesArray(2), ...
		      Neuron.initialValuesArray(3), ...
		      Neuron.initialValuesArray(4), ...
		      Neuron.initialValuesArray(5), ...
		      Neuron.initialValuesArray(6), ...
		      Neuron.initialValuesArray(7));
      disp(strng);

      strng = sprintf('   24) Current clamp mode: ');
      strng = sprintf('%s%s', strng, ...
                               deblank(iclamp_mode(gvars.iclamp_stateFLAG,:)));
      disp(strng);

      strng = sprintf('   25) Dynamics code source (');
      strng = sprintf('%s%s)', strng, ...
                          deblank(gvars.dynamicsSOURCE(gvars.dynamicsFLAG,:)));
      disp(strng);
    
    end % if (~template_params_only)

    strng = sprintf('   26) Save simulation parameters (');
    if (gvars.saveFLAG == 1)                % parameters not saved to file
      strng = sprintf('%snone)', strng);
    else                                    % parameters saved to a binary file
      strng = sprintf('%s%s)', strng, gvars.saveFILE);
    end
    disp(strng);
    strng = sprintf('   27) Source of the parameters (');
    strng = sprintf('%s%s', strng, ...
                       deblank(gvars.parameterSOURCE(gvars.parameterFLAG, :)));
    if (gvars.parameterFLAG == 2) % Parameter File
      strng = sprintf('%s: %s', strng, gvars.parameterFILE);
    end
    strng = sprintf('%s)', strng);
    disp(strng);

    strng = sprintf('   28) Synaptic conductance template source (');
    strng = sprintf('%s%s', strng, ...
                          deblank(gvars.templateSOURCE(gvars.templateFLAG,:)));
    if (gvars.templateFLAG == 2) % Binary File
      strng = sprintf('%s: %s', strng, gvars.templateFILE);
    end
    strng = sprintf('%s)', strng);
    disp(strng);

    strng = sprintf('   29) Synaptic frequency modulator: ');
    strng = sprintf('%s%s', strng, ...
                          deblank(fpre_modulator(gvars.fpre_modFLAG,:)));
    disp(strng);

    strng = sprintf('   30) Facilitation:');
    if (gvars.isFacilitationActive)
	strng = sprintf('%s active', strng);
	strng = sprintf('%s (xFactor = %.2f, decay rate = %.2f ms)', strng, ...
			gvars.facilitationFactor, ...
			gvars.facilitationDecayRateMsec);
    else
	strng = sprintf('%s inactive', strng);
    end	
    disp(strng);

    strng = sprintf('   31) Number of bootstrap cycles (%d)',gvars.nBootStrap);
    disp(strng);

    disp('    z) Run');

    if DEBUG
      reply = 'z';
    else
      reply = input('\nYour selection: ', 's');
    end
    switch reply
        case '1'
	    presynaptic_frequency_menu;
	    len_rs = length(gvars.randSTATE(1,:));
	    len_freqs = length(gvars.primaryFREQS);
	    if (len_rs < len_freqs)
		for i = ((len_rs+1):len_freqs)
		    gvars.randSTATE(:,i) = round(sum(100*clock));
		    gvars.rand_stateFLAG(i) = 1;
		    gvars.rand_stateFILE(i,:) = blank_array;
		end % i loop
	    elseif (len_freqs < len_rs)
		rand_state = gvars.randSTATE(:,1:len_freqs);
		gvars.randSTATE = rand_state;
		gvars.rand_stateFLAG(len_freqs+1:len_rs) = 1;
		rand_state_file = gvars.rand_stateFILE(1:len_freqs,:);
		gvars.rand_stateFILE = rand_state_file;
	    end
	    reply = [];
        case '2'
            integration_time_menu;
	    reply = [];
      case '3'
	      num_2nds_menu;
		  reply = [];
      case '4'
	      gsyn_menu;
		  reply = [];
      case '5'
	      random_seed_menu
		  reply = [];
      case '6'
	      firing_mode_menu;
		  reply = [];
      case '7'
	      save_step_menu;
		  reply = [];
      case '8'
	      pulse_start_menu;
		  reply = [];
      case '9'
	      tsum_menu;
		  reply = [];
      case '10'
	      f_osc_amplitude_menu;
		  reply = [];
      case '11'
	      f_osc_rate_menu;
		  reply = [];
      case '12'
	      f_osc_phase_menu;
		  reply = [];
      case '13'
	      [Synapse, Neuron] = neuron_type_menu(Synapse, Neuron);
		  reply = [];
      case '14'
       base_time_menu;
       reply = [];
      case '15'
	      sodium_menu;
		  reply = [];
      case '16'
	      potassium_menu;
		  reply = [];
      case '17'
	gm_menu;
	reply = [];
      case '18'
	leak_menu;
	reply = [];
      case '19'
	gcat_menu;
	reply = [];     
      case '20'
	synaptic_nernst_menu;
	reply = [];
      case '21'
	ga_menu;
	reply = [];
      case '22'
	capacitance_menu;
	reply = [];
      case '23'
	Neuron = initial_values_menu(Neuron);
	reply = [];
      case '24'
	  [Synapse, Neuron, Iclamp] = current_clamp_menu(Synapse, ...
							 Neuron, Iclamp);
	  reply = [];
      case '25'
	  dynamics_menu;
	  reply = [];
      case '26'
	  save_menu;
	  reply = [];
      case '27'
	  parameter_menu;
	  reply = [];
      case '28'
	  template_menu;
	  reply = [];
      case '29'
	  fpre_modulator_menu;
	  reply = [];
      case '30'
	  facilitation_menu;
	  reply = [];
      case '31'
	  bootstrap_menu;
	  reply = [];
      case 'z'
	  ; % run program
      case '!'
        menu_flag = 0; % terminate program
      otherwise
	reply = [];
    end % switch
  end % while loop

  Neuron.type = gvars.cellTYPE;
  Synapse.gsynRiseTimeMsec = gvars.riseTIME;
  Synapse.gsynFallTimeMsecArray = [gvars.fallTIME; gvars.fallTIME2];
  Synapse.gsynThresholdNsiemen = gvars.thresholdGSYN;
  Synapse.gsynScaling = gvars.gsynSCALING;

% end function menu()

function presynaptic_frequency_menu

  global gvars

  clc;
  if (length(gvars.primaryFREQS) == 1)
    strng = sprintf('The frequency at which primaries fire is [');
  else
    strng = sprintf('The frequencies at which primaries fire are [');
  end
  dim = length(gvars.primaryFREQS);
  for i = 1:dim
    strng = sprintf('%s%.2f', strng, gvars.primaryFREQS(i));
    if (i < dim)
      strng = sprintf('%s ', strng);
    end
  end % i loop
  strng = sprintf('%s] Hz.', strng);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.primaryFREQS;
    else
      presynaptic_freqs = str2num(reply);
      if isempty(presynaptic_freqs)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.primaryFREQS = presynaptic_freqs;
      end % isempty(presynaptic_freqs)
    end % if (isempty(reply))
  end % while loop

function integration_time_menu

  global gvars

  clc;
  if (length(gvars.primaryFREQS) == 1)
    strng = sprintf('The total numerical integration time is [');
  else
    strng = sprintf('The total numerical integration times are [');
  end
  dim = length(gvars.primaryFREQS);  
  for i = 1:dim
    strng = sprintf('%s%.1f', strng, gvars.integTIMES(i));
    if (i < dim)
      strng = sprintf('%s ', strng);
    end
  end % i loop
  strng = sprintf('%s] ms.', strng);
  disp(strng);
  strng = sprintf('\nEnter a single negative number to have times ');
  disp(strng);
  strng = sprintf('automatically computed based on 400 primary synaptic firings.');
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.integTIMES;
    else
      integ_times = str2num(reply);
      if isempty(integ_times)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      elseif (integ_times(1) < 0)
        for i = 1:length(gvars.primaryFREQS)
          if (gvars.primaryFREQS(i) < 0.3)
            gvars.integTIMES(i) = ceil(200 * (1000 / gvars.primaryFREQS(i)));
          else
            gvars.integTIMES(i) = ceil(400 * (1000 / gvars.primaryFREQS(i)));
	  end
	end
      else
        gvars.integTIMES = integ_times;
      end % isempty(integ_times)
    end % if (isempty(reply))
  end % while loop

function num_2nds_menu

  global gvars

  clc;
  strng = sprintf('The number of secondary synapses is');
  strng = sprintf('%s [%d].', strng, gvars.numSECONDARIES);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.numSECONDARIES;
    else
      num_2nds = str2num(reply(1));
      if isempty(num_2nds)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.numSECONDARIES = num_2nds;
        gvars.numSYN = gvars.numSECONDARIES + 1;
					   % Set the total number of synapses
                                           %   to be simulated by the N+1 Rule,
 				           %   where there is 1 primary synapse
				           %   and N secondaries.
        len = length(gvars.fireMODE);
        if (gvars.numSYN > len)
	  for i = (len+1):gvars.numSYN
            gvars.fireMODE(i) = gvars.fireMODE(len);
	    gvars.gsynBAR(i) = gvars.gsynBAR(len);
	  end
	end
      end % isempty(num_2nds)
    end % if (isempty(reply))
  end % while loop

function gsyn_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    disp('Please select a synaptic conductance to modify: ');
    strng = sprintf('\n    1) Maximum absolute primary conductance ');
    strng = sprintf('%s(%.3f nS)', strng, gvars.gsynBAR(1));
    disp(strng);
    strng = sprintf('    2) Maximum relative to a secondary conductance of');
    strng = sprintf('%s %.3f nS ([', strng, gvars.thresholdGSYN);
    for i = 2:gvars.numSYN
	strng = sprintf('%s%.3f', strng, gvars.gsynBAR(i));
	if (i < gvars.numSYN)
	    strng = sprintf('%s ', strng);
	end
    end
    strng = sprintf('%s])', strng);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter a value for the maximum absolute ');
          prompt = sprintf('%sprimary conductance or hit <RETURN>: ', prompt);
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
	    conductance = gvars.gsynBAR(1);
	  elseif (conductance < 0)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gsynBAR(1) = conductance;
	reply = [];
      case '2'
%        gsyn_secondary_menu;
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter a value for the maximum relative ');
          prompt = sprintf('%ssecondary conductance: ', prompt);
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
	    conductance(:) = gvars.gsynBAR(2:gvars.numSYN);
	  elseif (conductance < 0)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
	len = length(conductance)
	cc = conductance
	gvars.gsynBAR(2:(len+1)) = conductance(1:len);
	if (len < gvars.numSECONDARIES)
	    gvars.gsynBAR((len+2):gvars.numSYN) = conductance(len);
	end
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function gsyn_secondary_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    disp('Please select a method for assigning synaptic conductance values');
    disp('%s to the secondaries:');
    strng = sprintf('\n    1) user defined ');
    disp(strng);
    strng = sprintf('    2) random ');
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter a value for the maximum absolute ');
          prompt = sprintf('%sprimary conductance: ', prompt);
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gsynBAR(1) = conductance;
	reply = [];
      case '2'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter a value for the maximum relative ');
          prompt = sprintf('%ssecondary conductance: ', prompt);
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gsynBAR(2) = conductance;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function random_seed_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    disp('To modify a random seed source, please select from the menu below:');
    disp(' ');
    for i = 1:length(gvars.primaryFREQS)
      strng = sprintf('    %d) %s', i, ...
                    deblank(gvars.rand_seedSOURCE(gvars.rand_stateFLAG(i),:)));
      if (gvars.rand_stateFLAG(i) < 3)
        strng = sprintf('%s: %d', strng, gvars.randSTATE(1,i));
      else
        strng = sprintf('%s: %s', strng, deblank(gvars.rand_stateFILE(i,:)));
      end
      disp(strng);
    end % i loop
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    sub_menu_flag = 0;
    for i = 1:length(gvars.primaryFREQS)
%      if (reply == num2str(i))
      if (str2num(reply) == i)
        random_seed_submenu(i);
	reply = [];
	sub_menu_flag = 1;
	break;
      end
    end % i loop
    if ~sub_menu_flag
      switch reply
        case 'z'
          ; % Return to previous menu
        otherwise
          disp(' ');
          disp('****That is not a valid selection. Please try again.****');
  	  fprintf(1,'\nHit any key to continue: ');
	  pause;
	  reply = [];
      end % switch reply
    end % if ~sub_menu_flag
  end % while loop
  
function random_seed_submenu(n)

  global gvars

  blank_array = '                                          ';

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a source for random seed ');
    strng = sprintf('%s#%d from the menu below:\n', strng, n);
    disp(strng);
    disp('    1) System clock');
    disp('    2) User input');
    disp('    3) Read in from file');
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        gvars.randSTATE(1,n) = round(sum(100*clock));
        gvars.rand_stateFLAG(n) = str2num(reply);
      case '2'
        rand_state = [];
	while (isempty(rand_state))
          prompt = sprintf('\nPlease enter a number to initialize the state ');
	  prompt = sprintf('%sof the random\nnumber generator ', prompt);
	  prompt = sprintf('%s(will be rounded to nearest integer): ', prompt);
	  rand_state = str2num(input(prompt, 's'));
	  if isempty(rand_state)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  else
	    gvars.randSTATE(1,n) = round(rand_state);
	  end % isempty(rand_state)
	end % while loop
        gvars.rand_stateFLAG(n) = str2num(reply);
      case '3'
        rand_state_fid = -1;
	brk = 0;
        while (rand_state_fid == -1)
	  strng = sprintf('rand_state%.1f.dat', gvars.primaryFREQS(n));
          prompt = sprintf('\nName of file (default=%s)', strng);
          prompt = sprintf('%s(type @ to abort): ', prompt);
          rand_state_file = input(prompt, 's');
          if (isempty(rand_state_file))
	    rand_state_file = blank_array;
            rand_state_file = strng;
	  elseif (rand_state_file(1) == ['@'])                          % Abort
	    reply = [];
	    rand_state_fid = 1;
	    brk = 1;
	  else
            rand_state_file = rand_state_file;
          end

	  if (~brk)
            rand_state_fid = fopen(deblank(rand_state_file), 'r');
	    if (rand_state_fid == -1)
	      disp(' ');
	      disp('****File not found. Please try again****');
	    else
              rand_state = fscanf(rand_state_fid, '%f', inf);
              status = fclose(rand_state_fid);
              if (length(rand_state) ~= 35)
	        strng = sprintf('\n****File contained an invalid state');
	        strng = sprintf('%s vector.  Please try again.****\n', strng);
                disp(strng);
	        rand_state_fid = -1;
	      else
 	        gvars.rand_stateFILE(n,:) = ...
                              blank_array(1:length(gvars.rand_stateFILE(n,:)));
                gvars.rand_stateFILE(n,1:length(rand_state_file)) = ...
                                                               rand_state_file;
	        gvars.randSTATE(:,n) = rand_state;
	      end
	    end % if (rand_state_fid == -1)
	  end % if (~brk)
        end % while (rand_state_fid == -1)
	if ~isempty(reply)
          gvars.rand_stateFLAG(n) = str2num(reply);
	end
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****Invalid selection. Please try again.****');
        fprintf(1,'\nHit any key to continue: ');
	pause 
	reply = [];
    end % switch
  end % while loop
  
function firing_mode_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    disp('Stochastic firing == +1');
    disp('No firing         ==  0');
    disp('Steady firing     == -1');
    disp(' ');
    disp('Please select a firing mode to modify: ');
    strng = sprintf('\n    1) Firing mode for primaries ');
    strng = sprintf('%s(%d)', strng, gvars.fireMODE(1));
    disp(strng);
    strng = sprintf('    2) Firing mode for secondaries ([');
    for i = 2:gvars.numSYN
      strng = sprintf('%s%d ', strng, gvars.fireMODE(i));
    end
    strng = sprintf('%s])', deblank(strng));
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        mode = [];
	while (isempty(mode))
          prompt = sprintf('\nPlease enter a value for the firing mode for ');
          prompt = sprintf('%sprimaries or hit <RETURN>: ', prompt);
	  mode = str2num(input(prompt, 's'));
	  if (isempty(mode))
	    mode = gvars.fireMODE(1);
	  elseif (isempty(find(mode == [1; 0; -1]) > 0))
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	    mode = [];
	  end % isempty(mode)
	end % while loop
        gvars.fireMODE(1) = mode;
	reply = [];
      case '2'
        mode = [];
	while (isempty(mode))
	    prompt = sprintf(['\nPlease enter values for the firing' ...
			      ' modes for the secondaries or' ...
			      ' hit <RETURN>: ']);
			      
	    mode = str2num(input(prompt, 's'));
	  if (isempty(mode))
	    mode(1:(gvars.numSYN-1)) = gvars.fireMODE(2:gvars.numSYN);
	  else
	      lenMode = length(mode);
	      for i = 1:lenMode
		  if (isempty(find(mode(i) == [1; 0; -1]) > 0))
		      disp(' ');
		      strng = sprintf(['****You entered at least one ' ...
				       'invalid number. Please try ' ...
				       'again.****']);
		      disp(strng);
		      mode = [];
		      break;
		  end
	      end
	      if ((gvars.numSYN-1) > lenMode)
		  mode((lenMode+1):gvars.numSYN) = mode(lenMode);
	      end
	  end % isempty(mode)
	end % while loop
        gvars.fireMODE(2:gvars.numSYN) = mode(1:(gvars.numSYN-1));
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function secondary_firing_mode_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    disp('Stochastic firing == +1');
    disp('No firing         ==  0');
    disp('Steady firing     == -1');
    disp(' ');
    disp('Please select a firing mode to modify: ');
    strng = sprintf('\n    1) Firing mode for primaries ');
    strng = sprintf('%s(%d)', strng, gvars.fireMODE(1));
    disp(strng);
    strng = sprintf('    2) Firing mode for secondaries ');
    strng = sprintf('%s(%d)', strng, gvars.fireMODE(2));
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        mode = [];
	while (isempty(mode))
          prompt = sprintf('\nPlease enter a value for the firing mode for ');
          prompt = sprintf('%sprimaries or hit <RETURN>: ', prompt);
	  mode = str2num(input(prompt, 's'));
	  if (isempty(mode))
	    mode = gvars.fireMODE(1);
	  elseif (isempty(find(mode == [1; 0; -1]) > 0))
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	    mode = [];
	  end % isempty(mode)
	end % while loop
        gvars.fireMODE(1) = mode;
	reply = [];
      case '2'
        mode = [];
	while (isempty(mode))
          prompt = sprintf('\nPlease enter a value for the firing mode for ');
          prompt = sprintf('%ssecondaries or hit <RETURN>: ', prompt);
	  mode = str2num(input(prompt, 's'));
	  if (isempty(mode))
	    mode = gvars.fireMODE(2);
	  elseif (isempty(find(mode == [1; 0; -1]) > 0))
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	    mode = [];
	  end % isempty(mode)
	end % while loop
        gvars.fireMODE(2) = mode;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function save_step_menu

  global gvars

  clc;
  strng = sprintf('Currently data will be saved');
  strng = sprintf('%s every %.5f ms.', strng, gvars.saveSTEP);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.saveSTEP;
    else
      step_size = str2num(reply);
      if isempty(step_size)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.saveSTEP = step_size;
      end % isempty(step_size)
    end % if (isempty(reply))
  end % while loop

function pulse_start_menu

  global gvars

  clc;
  strng = sprintf('Current value for the duration of the settling time is ');
  strng = sprintf('%s%.1f ms.', strng, gvars.pulseSTART);
  disp(strng);
  strng = sprintf('\nThis time allows the system to reach equilibrium ');
  strng = sprintf('%sbefore the synaptic firing begins.', strng);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.pulseSTART;
    else
      settle_time = str2num(reply);
      if isempty(settle_time)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.pulseSTART = settle_time;
      end % isempty(settle_time)
    end % if (isempty(reply))
  end % while loop

function pulse_end_menu

  global gvars

  clc;
  strng = sprintf('** WARNING!  This variable is no longer included in the');
  strng = sprintf('%s template header. **', strng);
  disp(strng);
  strng = sprintf('** If gvars.pulseEND is non-zero,');
  strng = sprintf('%s it may affect firing rate calculations. **\n', strng);
  disp(strng);
  strng = sprintf('Current value for the duration of the post-settling time');
  strng = sprintf('%s is %.1f ms.', strng, gvars.pulseEND);
  disp(strng);
  strng = sprintf('\nThis time allows the system to reach equilibrium ');
  strng = sprintf('%safter the synaptic firing has ended.', strng);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit return: ', 's');
    if (isempty(reply))
      reply = gvars.pulseEND;
    else
      settle_time = str2num(reply);
      if isempty(settle_time)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      elseif (settle_time < 0)
        disp(' ');
	disp('****That is a negative value. Please try again.****');
	reply = [];
      else
        gvars.pulseEND = settle_time;
      end % isempty(settle_time)
    end % if (isempty(reply))
  end % while loop

function tsum_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('The tsum template mode is currently');
    if (gvars.tsumMODE == 1)
      strng = sprintf('%s active (mode 1).', strng);
    elseif (gvars.tsumMODE == 2)
      strng = sprintf('%s active (mode 2).', strng);
    else
      strng = sprintf('%s inactive.', strng);
    end
    strng =sprintf('%s  Please make a selection from the menu below:\n',strng);
    disp(strng);
    disp('    1) Make the tsum template mode active (2 primary pulses)');
    strng = sprintf('    2) Make the tsum template mode active');
    strng = sprintf('%s (1 primary & 1 secondary pulse)', strng);
    disp(strng);
    disp('    3) Make the tsum template mode inactive');
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        gvars.tsumMODE = 1;
      case '2'
        gvars.tsumMODE = 2;
      case '3'
        gvars.tsumMODE = 0;
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****Invalid selection. Please try again.****');
        fprintf(1,'\nHit any key to continue: ');
	pause 
	reply = [];
    end % switch
  end % while loop
  
function f_osc_amplitude_menu

  global gvars

  clc;
  strng = sprintf('The amplitude of the firing frequency oscillations ');
  strng = sprintf('%s(fosc) is %.1f Hz.', strng, gvars.f_oscAMPLITUDE);
  disp(strng);
  strng = sprintf('\nThis parameter is used to sinusoidally modulate the ');
  strng = sprintf('%ssynaptic\nfiring frequency through a range of ', strng);
  strng = sprintf('%svalues.', strng);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.f_oscAMPLITUDE;
    else
      osc_amp = str2num(reply);
      if isempty(osc_amp)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.f_oscAMPLITUDE = osc_amp;
      end % isempty(osc_amp)
    end % if (isempty(reply))
  end % while loop

function f_osc_rate_menu

  global gvars

  clc;
  strng = sprintf('The rate of the firing frequency oscillations ');
  strng = sprintf('%s(fHR) is %.1f Hz.', strng, gvars.f_oscRATE);
  disp(strng);
  strng = sprintf('\nThis parameter is used to sinusoidally modulate the ');
  strng = sprintf('%ssynaptic\nfiring frequency through a range of ', strng);
  strng = sprintf('%svalues.', strng);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.f_oscRATE;
    else
      osc_rate = str2num(reply);
      if isempty(osc_rate)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.f_oscRATE = osc_rate;
      end % isempty(osc_rate)
    end % if (isempty(reply))
  end % while loop

function f_osc_phase_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    disp('Please select a frequency phase shift to modify: ');
    strng = sprintf('\n    1) Phase shift of primaries'' firing frequency ');
    strng = sprintf('%s(%.2f rad)', strng, gvars.f_oscPHASE(1));
    disp(strng);
    strng = sprintf(['    2) Phase shifts of secondaries'' firing' ...
		     ' frequency ([']);
    for i= 2:gvars.numSYN
	strng = sprintf('%s%.2f ', strng, gvars.f_oscPHASE(i));
    end
    strng = sprintf('%s] rad)', deblank(strng));
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        phase = [];
	while (isempty(phase))
          prompt = sprintf('\nPositive values correspond to a delay or right');
          prompt = sprintf('%s shift,\nnegative values to an', prompt);
          prompt = sprintf('%s advancement or left shift.', prompt);
	  disp(prompt);
	  prompt = sprintf('\nPlease enter a value for the primaries'' phase');
	  prompt = sprintf('%s shift or hit <RETURN>: ', prompt);
	  phase = str2num(input(prompt, 's'));
	  if isempty(phase)
	    phase = gvars.f_oscPHASE(1);
	  end % isempty(phase)
	end % while loop
        gvars.f_oscPHASE(1) = phase;
	reply = [];
      case '2'
        phase = [];
	while (isempty(phase))
          prompt = sprintf('\nPositive values correspond to a delay or right');
          prompt = sprintf('%s shift,\nnegative values to an', prompt);
          prompt = sprintf('%s advancement or left shift.', prompt);
	  disp(prompt);
	  prompt = sprintf('\nPlease enter a value for the secondaries''');
	  prompt = sprintf('%s phase shift or hit <RETURN>: ', prompt);
	  phase = str2num(input(prompt, 's'));
	  if isempty(phase)
	    phase(1:(gvars.numSYN-1)) = gvars.f_oscPHASE(2:gvars.numSYN);
	  else
	      lenPhase = length(phase);
	      if ((gvars.numSYN-1) > lenPhase)
		  phase((lenPhase+1):gvars.numSYN) = phase(lenPhase);
	      end
	  end % isempty(phase)
	end % while loop
        gvars.f_oscPHASE(2:gvars.numSYN) = phase(1:(gvars.numSYN-1));
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function [Synapse, Neuron] = neuron_type_menu(Synapse, Neuron)
% Set the parameters that control the cell dynamics.
%
% Risetime      == the time constant for the rising portion of the
%                  nicotinic synaptic conductance dynamics (ms).
% Falltime      == the time constant for the falling portion of the
%                  nicotnic synaptic conductance dynamics (ms).
% Thresholdgsyn == the threshold nicotinic synaptic conductance for
%                  primaries and secondaries for firing an action
%                  potential.
% Epscscaling   == the scaling parameter which keeps the maximum of
%                  the summed exponentials describing the nicotinic
%                  synaptic conductance dynamics scaled to unity.
%

  global gvars

  clc;
  default = 0;
  isInvalidNeuronType = 1;
  while (isInvalidNeuronType)
    prompt = sprintf('The current cell type is %s.\n', ...
		     gvars.cellTYPE);
    disp(prompt);
    prompt = sprintf('Select a new cell type to be modeled');
    prompt = sprintf('%s (B/C/D/E/M/R/S) or hit <RETURN>: ', prompt);
    reply = input(prompt, 's');
    if (isempty(reply))                               % Default response
      default = 1;
      isInvalidNeuronType = 0;          % Do nothing.  Just proceed to submenu.
    elseif (find(reply(1) == ['B'; 'b']) > 0)      % B cell type
      gvars.cellTYPE = 'B';
      gvars.riseTIME = 1;
      gvars.fallTIME = 5;
      gvars.fallTIME2 = 0;
      gvars.thresholdGSYN = 10.68;
      gvars.gsynSCALING = 0.534985;
      isInvalidNeuronType = 0;
    elseif (find(reply(1) == ['C'; 'c']) > 0)      % C cell type
      gvars.cellTYPE = 'C';
      gvars.riseTIME = 1;
      gvars.fallTIME = 10;
      gvars.fallTIME2 = 0;
      gvars.thresholdGSYN = 8.29;
      gvars.gsynSCALING = 0.696835;
      isInvalidNeuronType = 0;
    elseif (find(reply(1) == ['D'; 'd']) > 0)      % D cell type (double B)
      gvars.cellTYPE = 'D';
      gvars.riseTIME = 1;
      gvars.fallTIME = 5;
      gvars.fallTIME2 = 35;
      gvars.thresholdGSYN = 7.28;
      gvars.gsynSCALING = 1.374379754;
      isInvalidNeuronType = 0;
    elseif (find(reply(1) == ['E'; 'e']) > 0)      % E cell type (double B)
      gvars.cellTYPE = 'E';
      gvars.riseTIME = 1;
      gvars.fallTIME = 5;
      gvars.fallTIME2 = 50;
      gvars.thresholdGSYN = 7.22;
      gvars.gsynSCALING = 1.395769358;
      isInvalidNeuronType = 0;
    elseif (find(reply(1) == ['M'; 'm']) > 0)      % M cell type (medium decay)
      gvars.cellTYPE = 'M';
      gvars.riseTIME = 1;
      gvars.fallTIME = 25;
      gvars.fallTIME2 = 0;
      gvars.thresholdGSYN = 6.50;
      gvars.gsynSCALING = 0.8394993544;
      isInvalidNeuronType = 0;
    elseif (find(reply(1) == ['R'; 'r']) > 0)      % R cell type (RC-circuit
      gvars.cellTYPE = 'R';                        %              and B cell)
      gvars.riseTIME = 1;
      gvars.fallTIME = 5;
      gvars.fallTIME2 = 0;
      gvars.thresholdGSYN = 6.63;
      gvars.gsynSCALING  = 0.534985;
      isInvalidNeuronType = 0;
    elseif (find(reply(1) == ['S'; 's']) > 0)      % S cell type (slow)
      gvars.cellTYPE = 'S';
      gvars.riseTIME = 1;
      gvars.fallTIME = 50;
      gvars.fallTIME2 = 0;
      gvars.thresholdGSYN = 5.81;
      gvars.gsynSCALING = 0.9048007131;
      isInvalidNeuronType = 0;
    else                                           % Invalid cell type
      disp(' ');
      disp('****Invalid cell type. Please try again****');
      disp(' ');
    end
  end % while loop
  Neuron.type = gvars.cellTYPE;
  Synapse.gsynRiseTimeMsec = gvars.riseTIME;
  Synapse.gsynFallTimeMsecArray = [gvars.fallTIME; gvars.fallTIME2];
  Synapse.gsynThresholdNsiemen = gvars.thresholdGSYN;
  Synapse.gsynScaling = gvars.gsynSCALING;
  if (default)
    % Do nothing.  Return to main menu.
  else
    Synapse = neuron_type_submenu(Synapse);
  end

% end neuron_type_menu()

function Synapse = neuron_type_submenu(Synapse)

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a %s-cell parameter', gvars.cellTYPE);
    strng = sprintf('%s to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Rise-time constant for the nicotinic synaptic');
    strng = sprintf('%s conductance pulse (%.2f) ms', strng, gvars.riseTIME);
    disp(strng);
    strng = sprintf('    2) First fall-time constant for the nicotinic');
    strng = sprintf('%s synaptic conductance pulse', strng);
    strng = sprintf('%s (%.2f) ms', strng, gvars.fallTIME);
    disp(strng);
    strng = sprintf('    3) Second fall-time constant for the nicotinic');
    strng = sprintf('%s synaptic conductance pulse', strng);
    strng = sprintf('%s (%.2f) ms', strng, gvars.fallTIME2);
    disp(strng);
    strng = sprintf('    4) Threshold nicotinic synaptic conductance');
    strng = sprintf('%s (%.3f)', strng, gvars.thresholdGSYN);
    disp(strng);
    strng = sprintf('    5) Nicotinic synaptic conductance pulse scaling');
    strng = sprintf('%s constant (%.10f)', strng, gvars.gsynSCALING);
    disp(strng);
    disp('    z) Return to main menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        neuron_param = [];
	while (isempty(neuron_param))
          prompt = sprintf('\nPlease enter the rise-time constant: ');
	  neuron_param = str2num(input(prompt, 's'));
	  if isempty(neuron_param)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(neuron_param)
	end % while loop
        gvars.riseTIME = neuron_param;
	Synapse.gsynRiseTimeMsec = neuron_param;
	reply = [];
      case '2'
        neuron_param = [];
	while (isempty(neuron_param))
          prompt = sprintf('\nPlease enter the first fall-time constant: ');
	  neuron_param = str2num(input(prompt, 's'));
	  if isempty(neuron_param)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(neuron_param)
	end % while loop
        gvars.fallTIME = neuron_param;
	Synapse.gsynFallTimeMsecArray(1) = neuron_param;
	reply = [];
      case '3'
        neuron_param = [];
	while (isempty(neuron_param))
          prompt = sprintf('\nPlease enter the second fall-time constant: ');
	  neuron_param = str2num(input(prompt, 's'));
	  if isempty(neuron_param)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(neuron_param)
	end % while loop
        gvars.fallTIME2 = neuron_param;
	Synapse.gsynFallTimeMsecArray(2) = neuron_param;
	reply = [];
      case '4'
        neuron_param = [];
	while (isempty(neuron_param))
          prompt = sprintf('\nPlease enter the threshold conductance: ');
	  neuron_param = str2num(input(prompt, 's'));
	  if isempty(neuron_param)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(neuron_param)
	end % while loop
        gvars.thresholdGSYN = neuron_param;
	Synapse.gsynThresholdNsiemen = neuron_param;
	reply = [];
      case '5'
        neuron_param = [];
	while (isempty(neuron_param))
          prompt = sprintf('\nPlease enter the scaling constant: ');
	  neuron_param = str2num(input(prompt, 's'));
	  if isempty(neuron_param)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(neuron_param)
	end % while loop
        gvars.gsynSCALING = neuron_param;
	Synapse.gsynScaling = neuron_param;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop
  
% end neuron_type_submenu()
  
function base_time_menu

  global gvars

  clc;
  strng = sprintf('Current value for the segmental integration time is ');
  strng = sprintf('%s%.1f ms.', strng, gvars.baseTIME);
  disp(strng);
  strng = sprintf('\nThis parameter is used to break up long integrations ');
  strng = sprintf('%sinto more manageable segments.', strng);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.baseTIME;
    else
      seg_time = str2num(reply);
      if isempty(seg_time)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.baseTIME = seg_time;
      end % isempty(seg_time)
    end % if (isempty(reply))
  end % while loop

function sodium_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the fast, inactivating,');
    disp(strng);
    strng = sprintf('voltage-dependent sodium current to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Maximum conductance {gNa_bar}');
    strng = sprintf('%s (%.1f nS)', strng, gvars.gNaBAR);
    disp(strng);
    strng = sprintf('    2) Nernst potential {E_Na}');
    strng = sprintf('%s (%.1f mV)', strng, gvars.E_Na);
    disp(strng);
    strng = sprintf('    3) Scaling factor for the activation variable');
    strng = sprintf('%s kinetics {mSCALE} (%.3f)', strng, gvars.mSCALE);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the maximum conductance of the');
          prompt = sprintf('%s sodium current: ', prompt);
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gNaBAR = conductance;
	reply = [];
      case '2'
        potential = [];
	while (isempty(potential))
          prompt = sprintf('\nPlease enter the Nernst potential of the');
          prompt = sprintf('%s sodium current: ', prompt);
	  potential = str2num(input(prompt, 's'));
	  if isempty(potential)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(potential)
	end % while loop
        gvars.E_Na = potential;
	reply = [];
      case '3'
        scale_factor = [];
	while (isempty(scale_factor))
          prompt = sprintf('\nPlease enter the scaling factor of the');
          prompt = sprintf('%s sodium activation variable kinetics: ', prompt);
	  scale_factor = str2num(input(prompt, 's'));
	  if isempty(scale_factor)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(scale_factor)
	end % while loop
        gvars.mSCALE = scale_factor;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function potassium_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the delayed-recifying');
    disp(strng);
    strng = sprintf('potassium current to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Maximum conductance {gK_bar}');
    strng = sprintf('%s (%.1f nS)', strng, gvars.gKBAR);
    disp(strng);
    strng = sprintf('    2) Nernst potential {E_K}');
    strng = sprintf('%s (%.1f mV)', strng, gvars.E_K);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the maximum conductance of the');
          prompt = sprintf('%s potassium current: ', prompt);
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gKBAR = conductance;
	reply = [];
      case '2'
        potential = [];
	while (isempty(potential))
          prompt = sprintf('\nPlease enter the Nernst potential of the');
          prompt = sprintf('%s potassium current: ', prompt);
	  potential = str2num(input(prompt, 's'));
	  if isempty(potential)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(potential)
	end % while loop
        gvars.E_K = potential;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function gm_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    disp('Please select a parameter of the M-current conductance to modify: ');
    strng = sprintf('\n    1) Starting value for gM_bar ');
    strng = sprintf('%s(%.2f)', strng, gvars.gmSTART);
    disp(strng);
    strng = sprintf('    2) Stepping value for gM_bar ');
    strng = sprintf('%s(%.2f)', strng, gvars.gmSTEP);
    disp(strng);
    strng = sprintf('    3) Ending value for gM_bar ');
    strng = sprintf('%s(%.2f)', strng, gvars.gmEND);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the starting value for gM_bar: ');
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gmSTART = conductance;
	reply = [];
      case '2'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the stepping value for gM_bar: ');
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gmSTEP = conductance;
	reply = [];
      case '3'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the ending value for gM_bar: ');
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gmEND = conductance;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function leak_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the voltage-independent');
    disp(strng);
    strng = sprintf('leak currents to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Maximum conductance {gleak_bar}');
    strng = sprintf('%s (%.1f nS)', strng, gvars.gleakBAR);
    disp(strng);
    strng = sprintf('    2) Nernst potential {E_leak}');
    strng = sprintf('%s (%.1f mV)', strng, gvars.E_leak);
    disp(strng);
    strng = sprintf('    3) Maximum conductance of the RC-circuit leak');
    strng = sprintf('%s {gleak_bar} (%.1f nS)', strng, gvars.gRCleakBAR);
    disp(strng);
    strng = sprintf('    4) Nernst potential of the RC-circuit leak');
    strng = sprintf('%s {E_RCleak} (%.1f mV)', strng, gvars.E_RCleak);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the maximum conductance of the');
          prompt = sprintf('%s leak current: ', prompt);
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gleakBAR = conductance;
	reply = [];
      case '2'
        potential = [];
	while (isempty(potential))
          prompt = sprintf('\nPlease enter the Nernst potential of the');
          prompt = sprintf('%s leak current: ', prompt);
	  potential = str2num(input(prompt, 's'));
	  if isempty(potential)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(potential)
	end % while loop
        gvars.E_leak = potential;
	reply = [];
      case '3'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the maximum conductance of the');
          prompt = sprintf('%s RC-circuit leak current: ', prompt);
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gRCleakBAR = conductance;
	reply = [];
      case '4'
        potential = [];
	while (isempty(potential))
          prompt = sprintf('\nPlease enter the Nernst potential of the');
          prompt = sprintf('%s RC-circuit leak current: ', prompt);
	  potential = str2num(input(prompt, 's'));
	  if isempty(potential)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(potential)
	end % while loop
        gvars.E_RCleak = potential;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function gcat_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the cation current ');
    strng = sprintf('%sconductance to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Starting value for gCNG_bar ');
    strng = sprintf('%s(%.2f)', strng, gvars.gcatSTART);
    disp(strng);
    strng = sprintf('    2) Stepping value for gCNG_bar ');
    strng = sprintf('%s(%.2f)', strng, gvars.gcatSTEP);
    disp(strng);
    strng = sprintf('    3) Ending value for gCNG_bar ');
    strng = sprintf('%s(%.2f)', strng, gvars.gcatEND);
    disp(strng);
    strng = sprintf('    4) Nernst potential {E_cat}');
    strng = sprintf('%s (%.1f mV)', strng, gvars.E_cat);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the starting value for gCNG_bar: ');
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gcatSTART = conductance;
	reply = [];
      case '2'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the stepping value for gCNG_bar: ');
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gcatSTEP = conductance;
	reply = [];
      case '3'
        conductance = [];
	while (isempty(conductance))
          prompt = sprintf('\nPlease enter the ending value for gCNG_bar: ');
	  conductance = str2num(input(prompt, 's'));
	  if isempty(conductance)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(conductance)
	end % while loop
        gvars.gcatEND = conductance;
	reply = [];
      case '4'
        nernst = [];
	while (isempty(nernst))
          prompt = sprintf('\nPlease enter the Nernst potential of the');
          prompt = sprintf('%s cation current: ', prompt);
	  nernst = str2num(input(prompt, 's'));
	  if isempty(nernst)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(nernst)
	end % while loop
        gvars.E_cat = nernst;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function synaptic_nernst_menu

  global gvars

  reply = [];
  clc;
  strng = sprintf('The Nernst potential of the nicotinic synaptic');
  strng = sprintf('%s current (E_syn) is %.1f mV.', strng, gvars.E_syn);
  disp(strng);
  while (isempty(reply))
    reply = input('\nEnter a new value or hit return: ', 's');
    if (isempty(reply))
      reply = gvars.E_syn;
    else
      nernst_syn = str2num(reply);
      if isempty(nernst_syn)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.E_syn = nernst_syn;
      end % isempty(nernst_syn)
    end % if (isempty(reply))
  end % while loop

function ga_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the A-type');
    strng = sprintf('%s potassium current to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Maximum conductance {gA_bar}');
    strng = sprintf('%s (%.1f nS)', strng, gvars.gABAR);
    disp(strng);
    strng = sprintf('    2) Nernst potential {E_A}');
    strng = sprintf('%s (%.1f mV)', strng, gvars.E_A);
    disp(strng);
    strng = sprintf('    3) Scaling factor for the activation time constant');
    strng = sprintf('%s {aActTauScaleFactor} (%.1f ms)', strng, ...
		    gvars.aActTauScaleFactor);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
	case '1' % change starting value for the maximum conductance (nS)
	    min = 0;
	    gBar = gvars.gABAR;
	    gvars.gABAR = get_new_float(gBar, min);
	    reply = [];
	case '2' % change starting value for the Nernst potential (mV)
	    min = -10000;
	    eRev = gvars.E_A;
	    gvars.E_A = get_new_float(eRev, min);
	    reply = [];
	case '3' % change starting value for the scaling factor of
                 % the activation time constant
	    min = 0;
	    tauM = gvars.aActTauScaleFactor;
	    gvars.aActTauScaleFactor = get_new_float(tauM, min);
	    reply = [];
	case 'z'
	    ; % Return to previous menu
	otherwise
	    disp(' ');
	    disp('****That is not a valid selection. Please try again.****');
	    fprintf(1,'\nHit any key to continue: ');
	    pause;
	    reply = [];
    end % switch reply
  end % while loop
  
% end gm_menu
  
  
function capacitance_menu

  global gvars

  reply = [];
  clc;
  strng = sprintf('The membrane capacitance is %.1f pF.', gvars.C);
  disp(strng);
  while (isempty(reply))
    reply = input('\nEnter a new value or hit return: ', 's');
    if (isempty(reply))
      reply = gvars.C;
    else
      capacitance = str2num(reply);
      if isempty(capacitance)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.C = capacitance;
      end % isempty(capacitance)
    end % if (isempty(reply))
  end % while loop

function Neuron = initial_values_menu(Neuron)

reply = [];
while (isempty(reply))
    clc;
    strng = sprintf('Please select an initial value to modify: ');
    disp(strng);
    strng = sprintf('\n    1) Starting value for the membrane voltage ');
    strng = sprintf('%s(%.2f mV)', strng, Neuron.initialValuesArray(1));
    disp(strng);
    strng = sprintf('    2) Starting value for the sodium activation');
    strng = sprintf('%s variable (%.8f)', strng, ...
		    Neuron.initialValuesArray(2));
    disp(strng);
    strng = sprintf('    3) Starting value for the sodium inactivation');
    strng = sprintf('%s variable (%.8f)', strng, ...
		    Neuron.initialValuesArray(3));
    disp(strng);
    strng = sprintf('    4) Starting value for the delayed-rectifier');
    strng = sprintf('%s potassium activation variable (%.8f)', strng, ...
		    Neuron.initialValuesArray(4));
    disp(strng);
    strng = sprintf('    5) Starting value for the M-type postassium');
    strng = sprintf('%s activation variable (%.8f)', strng, ...
		    Neuron.initialValuesArray(5));
    disp(strng);
    strng = sprintf('    6) Starting value for the A-type postassium');
    strng = sprintf('%s activation variable (%.8f)', strng, ...
		    Neuron.initialValuesArray(6));
    disp(strng);
    strng = sprintf('    7) Starting value for the A-type postassium');
    strng = sprintf('%s inactivation variable (%.8f)', strng, ...
		    Neuron.initialValuesArray(7));
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
	case '1' % change starting value for the membrane voltage (mV)
	    min = -1e10;
	    V = Neuron.initialValuesArray(1);
	    Neuron.initialValuesArray(1) = get_new_float(V, min);
	    reply = [];
	case '2' % change starting value for the sodium activation variable
	    min = 0;
	    m = Neuron.initialValuesArray(2);
	    Neuron.initialValuesArray(2) = get_new_float(m, min);
	    reply = [];
	case '3' % change starting value for the sodium inactivation variable
	    min = 0;
	    h = Neuron.initialValuesArray(3);
	    Neuron.initialValuesArray(3) = get_new_float(h, min);
	    reply = [];
	case '4' % change starting value for the delayed-rectifier
                 % potassium activation variable
	    min = 0;
	    n = Neuron.initialValuesArray(4);
	    Neuron.initialValuesArray(4) = get_new_float(n, min);
	    reply = [];
	case '5' % change starting value for the M-type potassium
                 % activation variable
	    min = 0;
	    w = Neuron.initialValuesArray(5);
	    Neuron.initialValuesArray(5) = get_new_float(w, min);
	    reply = [];
	case '6' % change starting value for the A-type potassium
                 % activation variable
	    min = 0;
	    mA = Neuron.initialValuesArray(6);
	    Neuron.initialValuesArray(6) = get_new_float(mA, min);
	    reply = [];
	case '7' % change starting value for the A-type potassium
                 % inactivation variable
	    min = 0;
	    hA = Neuron.initialValuesArray(7);
	    Neuron.initialValuesArray(7) = get_new_float(hA, min);
	    reply = [];
	case 'z'
	    ; % Return to previous menu
	otherwise
	    disp(' ');
	    disp('****That is not a valid selection. Please try again.****');
	    fprintf(1,'\nHit any key to continue: ');
	    pause;
	    reply = [];
    end % switch reply
end % while loop

% end initial_values_menu


function [Synapse, Neuron, Iclamp] = current_clamp_menu(Synapse, Neuron,Iclamp)

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a mode for the current clamp');
    strng = sprintf('%s from the menu below:\n', strng);
    disp(strng);
    disp('    1) inactive');
    disp('    2) step');
    disp('    3) ramp');
    disp('    4) ZAP');
    disp('    5) waveform');
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        gvars.iclamp_stateFLAG = str2num(reply);
      case '2'
        current_step_menu;
        gvars.iclamp_stateFLAG = str2num(reply);
      case '3'
        current_ramp_menu;
        gvars.iclamp_stateFLAG = str2num(reply);
      case '4'
        current_zap_menu;
        gvars.iclamp_stateFLAG = str2num(reply);
      case '5'
	  [Synapse, Neuron, Iclamp] = current_waveform_menu(Synapse, ...
							    Neuron, Iclamp);
	  gvars.iclamp_stateFLAG = str2num(reply);
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****Invalid selection. Please try again.****');
        fprintf(1,'\nHit any key to continue: ');
	pause 
	reply = [];
    end % switch
  end % while loop
  
% end current_clamp_menu()

function current_step_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the current clamp');
    strng = sprintf('%s step to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Amplitudes of current steps');
    strng = sprintf('%s (%.1f :', strng, gvars.istepSTART);
    strng = sprintf('%s %.1f :', strng, gvars.istepSTEP);
    strng = sprintf('%s %.1f pA)', strng, gvars.istepEND);
    disp(strng);
    strng = sprintf('    2) Delay until start of current step');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampLATENCY);
    disp(strng);
    strng = sprintf('    3) Duration of current step');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampDURATION);
    disp(strng);
    strng = sprintf('    4) Settling time after current step');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampDOWNTIME);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        current_step_amplitude_menu;
	reply = [];
      case '2'
        latency = [];
	while (isempty(latency))
          prompt = sprintf('\nPlease enter the current clamp delay time: ');
	  latency = str2num(input(prompt, 's'));
	  if isempty(latency)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(latency)
	end % while loop
        gvars.iclampLATENCY = latency;
	reply = [];
      case '3'
        duration = [];
	while (isempty(duration))
          prompt = sprintf('\nPlease enter the current step duration: ');
	  duration = str2num(input(prompt, 's'));
	  if isempty(duration)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(duration)
	end % while loop
        gvars.iclampDURATION = duration;
	reply = [];
      case '4'
        downtime = [];
	while (isempty(downtime))
          prompt = sprintf('\nPlease enter the current step settling time: ');
	  downtime = str2num(input(prompt, 's'));
	  if isempty(downtime)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(downtime)
	end % while loop
        gvars.iclampDOWNTIME = downtime;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function current_step_amplitude_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the current step');
    strng = sprintf('%s amplitude to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Starting value for iclampAMPLITUDE');
    strng = sprintf('%s (%.1f)', strng, gvars.istepSTART);
    disp(strng);
    strng = sprintf('    2) Stepping value for iclampAMPLITUDE');
    strng = sprintf('%s (%.1f)', strng, gvars.istepSTEP);
    disp(strng);
    strng = sprintf('    3) Ending value for iclampAMPLITUDE');
    strng = sprintf('%s (%.1f)', strng, gvars.istepEND);
    disp(strng);
    disp('    z) Return to previous menu');

    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        amplitude = [];
	while (isempty(amplitude))
          prompt = sprintf('\nPlease enter the starting value for');
          prompt = sprintf('%s iclampAMPLITUDE: ', prompt);
	  amplitude = str2num(input(prompt, 's'));
	  if isempty(amplitude)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(amplitude)
	end % while loop
        gvars.istepSTART = amplitude;
	reply = [];
      case '2'
        amplitude = [];
	while (isempty(amplitude))
          prompt = sprintf('\nPlease enter the stepping value for');
          prompt = sprintf('%s iclampAMPLITUDE: ', prompt);
	  amplitude = str2num(input(prompt, 's'));
	  if isempty(amplitude)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(amplitude)
	end % while loop
        gvars.istepSTEP = amplitude;
	reply = [];
      case '3'
        amplitude = [];
	while (isempty(amplitude))
          prompt = sprintf('\nPlease enter the ending value for');
          prompt = sprintf('%s iclampAMPLITUDE: ', prompt);
	  amplitude = str2num(input(prompt, 's'));
	  if isempty(amplitude)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(amplitude)
	end % while loop
        gvars.istepEND = amplitude;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function current_ramp_menu

  global gvars

  gvars.istepSTART = 0;
  gvars.istepSTEP = 1;
  gvars.istepEND = 0;

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the current clamp');
    strng = sprintf('%s step to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Starting amplitude of current ramp');
    strng = sprintf('%s (%.1f pA)', strng, gvars.irampSTART);
    disp(strng);
    strng = sprintf('    2) Ending amplitude of current ramp');
    strng = sprintf('%s (%.1f pA)', strng, gvars.irampEND);
    disp(strng);
    strng = sprintf('    3) Delay until start of current ramp');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampLATENCY);
    disp(strng);
    strng = sprintf('    4) Time to settle at starting amplitude of ramp');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampSETTLE);
    disp(strng);
    strng = sprintf('    5) Duration of current ramp');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampDURATION);
    disp(strng);
    strng = sprintf('    6) Settling time after current ramp ');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampDOWNTIME);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        amplitude = [];
	while (isempty(amplitude))
          prompt = sprintf('\nPlease enter the starting amplitude of the');
          prompt = sprintf('%s current ramp: ', prompt);
	  amplitude = str2num(input(prompt, 's'));
	  if isempty(amplitude)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(amplitude)
	end % while loop
        gvars.irampSTART = amplitude;
	reply = [];
      case '2'
        amplitude = [];
	while (isempty(amplitude))
          prompt = sprintf('\nPlease enter the ending amplitude of the');
          prompt = sprintf('%s current ramp: ', prompt);
	  amplitude = str2num(input(prompt, 's'));
	  if isempty(amplitude)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(amplitude)
	end % while loop
        gvars.irampEND = amplitude;
	reply = [];
      case '3'
        latency = [];
	while (isempty(latency))
          prompt = sprintf('\nPlease enter the current clamp delay time: ');
	  latency = str2num(input(prompt, 's'));
	  if isempty(latency)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(latency)
	end % while loop
        gvars.iclampLATENCY = latency;
	reply = [];
      case '4'
        settle = [];
	while (isempty(settle))
          prompt = sprintf('\nPlease enter settling time before the start');
          prompt = sprintf('%s of the current ramp: ', prompt);
	  settle = str2num(input(prompt, 's'));
	  if isempty(settle)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(settle)
	end % while loop
        gvars.iclampSETTLE = settle;
	reply = [];
      case '5'
        duration = [];
	while (isempty(duration))
          prompt = sprintf('\nPlease enter the current ramp duration: ');
	  duration = str2num(input(prompt, 's'));
	  if isempty(duration)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(duration)
	end % while loop
        gvars.iclampDURATION = duration;
	reply = [];
      case '6'
        downtime = [];
	while (isempty(downtime))
          prompt = sprintf('\nPlease enter the current ramp settling time: ');
	  downtime = str2num(input(prompt, 's'));
	  if isempty(downtime)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(downtime)
	end % while loop
        gvars.iclampDOWNTIME = downtime;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function current_zap_menu

  global gvars

  zap_direction = ['low-high'; 'high-low'];

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the current clamp');
    strng = sprintf('%s ZAP function to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Amplitude of current');
    strng = sprintf('%s (%.1f pA)', strng, gvars.zap_fOSC);
    disp(strng);
    strng = sprintf('    2) Low frequency of ZAP function:');
    strng = sprintf('%s (%.1f Hz)', strng, gvars.zap_loFREQ);
    disp(strng);
    strng = sprintf('    3) High frequency of ZAP function:');
    strng = sprintf('%s (%.1f Hz)', strng, gvars.zap_hiFREQ);
    disp(strng);
    strng = sprintf('    4) Phase of ZAP function:');
    strng = sprintf('%s (%.2f rad)', strng, gvars.zapPHASE);
    disp(strng);
    strng = sprintf('    5) Direction of ZAP function:');
    strng = sprintf('%s (%s)', strng, ...
                                deblank(zap_direction(gvars.zap_stateFLAG,:)));
    disp(strng);
    strng = sprintf('    6) Delay until start of ZAP current');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampLATENCY);
    disp(strng);
    strng = sprintf('    7) Duration of ZAP function');
    strng = sprintf('%s (%.1f ms)', strng, gvars.zapDURATION);
    disp(strng);
    strng = sprintf('    8) Settling time after ZAP current');
    strng = sprintf('%s (%.1f ms)', strng, gvars.iclampDOWNTIME);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        amplitude = [];
	while (isempty(amplitude))
          prompt = sprintf('\nPlease enter the amplitude of the');
          prompt = sprintf('%s ZAP current: ', prompt);
	  amplitude = str2num(input(prompt, 's'));
	  if isempty(amplitude)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(amplitude)
	end % while loop
        gvars.zap_fOSC = amplitude;
	reply = [];
      case '2'
        frequency = [];
	while (isempty(frequency))
          prompt = sprintf('\nPlease enter the ZAP current low frequency: ');
	  frequency = str2num(input(prompt, 's'));
	  if isempty(frequency)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(frequency)
	end % while loop
        gvars.zap_loFREQ = frequency;
	reply = [];
      case '3'
        frequency = [];
	while (isempty(frequency))
          prompt = sprintf('\nPlease enter the ZAP current high frequency: ');
	  frequency = str2num(input(prompt, 's'));
	  if isempty(frequency)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(frequency)
	end % while loop
        gvars.zap_hiFREQ = frequency;
	reply = [];
      case '4'
        phase = [];
	while (isempty(phase))
          prompt = sprintf('\nPlease enter the phase of the ZAP current');
          prompt = sprintf('%s oscillations.\nPositive values', prompt);
          prompt = sprintf('%s correspond to a delay or right', prompt);
          prompt = sprintf('%s shift,\nnegative values to an', prompt);
          prompt = sprintf('%s advancement or left shift.', prompt);
	  disp(prompt);
	  prompt = sprintf('\nPlease enter a value for the ZAP phase shift: ');
	  phase = str2num(input(prompt, 's'));
	  if isempty(phase)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(phase)
	end % while loop
        gvars.zapPHASE = phase;
	reply = [];
      case '5'
        current_zap_submenu;
	reply = [];
      case '6'
        latency = [];
	while (isempty(latency))
          prompt = sprintf('\nPlease enter the ZAP current delay time: ');
	  latency = str2num(input(prompt, 's'));
	  if isempty(latency)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(latency)
	end % while loop
        gvars.iclampLATENCY = latency;
	reply = [];
      case '7'
        duration = [];
	while (isempty(duration))
          prompt = sprintf('\nPlease enter the ZAP current duration: ');
	  duration = str2num(input(prompt, 's'));
	  if isempty(duration)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(duration)
	end % while loop
        gvars.zapDURATION = duration;
	reply = [];
      case '8'
        downtime = [];
	while (isempty(downtime))
          prompt = sprintf('\nPlease enter the ZAP current settling time: ');
	  downtime = str2num(input(prompt, 's'));
	  if isempty(downtime)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(downtime)
	end % while loop
        gvars.iclampDOWNTIME = downtime;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function current_zap_submenu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a direction for the ZAP current');
    strng = sprintf('%s from the menu below:\n', strng);
    disp(strng);
    disp('    1) Low frequencies to high frequencies');
    disp('    2) High frequencies to low frequencies');
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        gvars.zap_stateFLAG = str2num(reply);
      case '2'
        gvars.zap_stateFLAG = str2num(reply);
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****Invalid selection. Please try again.****');
        fprintf(1,'\nHit any key to continue: ');
	pause 
	reply = [];
    end % switch
  end % while loop
  
function [Synapse, Neuron, Iclamp] = ...
                                 current_waveform_menu(Synapse, Neuron, Iclamp)

global gvars

reply = [];
while (isempty(reply))
    clc;
    strng = sprintf('Please select a parameter of the current clamp');
    strng = sprintf('%s step to modify: ', strng);
    disp(strng);
    strng = sprintf('\n    1) Amplitude of the waveform (%.2f pA)', ...
		    Iclamp.waveformAmplitudePamp);
    disp(strng);
    strng = sprintf('    2) Neuron type of the waveform (%s)', Neuron.type);
    disp(strng);
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        amplitude = [];
	while (isempty(amplitude))
          prompt = sprintf('\nPlease enter the amplitude of the waveform: ');
	  amplitude = str2num(input(prompt, 's'));
	  if isempty(amplitude)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(amplitude)
	end % while loop
	Iclamp.waveformAmplitudePamp = amplitude;
	reply = [];
      case '2'
        [Synapse, Neuron] = neuron_type_menu(Synapse, Neuron);
	reply = [];
      case '3'
        duration = [];
	while (isempty(duration))
          prompt = sprintf('\nPlease enter the current step duration: ');
	  duration = str2num(input(prompt, 's'));
	  if isempty(duration)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(duration)
	end % while loop
        gvars.iclampDURATION = duration;
	reply = [];
      case '4'
        downtime = [];
	while (isempty(downtime))
          prompt = sprintf('\nPlease enter the current step settling time: ');
	  downtime = str2num(input(prompt, 's'));
	  if isempty(downtime)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(downtime)
	end % while loop
        gvars.iclampDOWNTIME = downtime;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

function dynamics_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a source for the dymanics code');
    strng = sprintf('%s from the menu below:\n', strng);
    disp(strng);

    dim = size(gvars.dynamicsSOURCE);
    for i = 1:dim(1)
      strng = sprintf('    %d) %s', i, deblank(gvars.dynamicsSOURCE(i,:)));
      disp(strng);
    end
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1' % Yamada
        gvars.dynamicsFLAG = str2num(reply);
        gvars.C = 100;
        gvars.E_Na = 60;
        gvars.gNaBAR = 800;
      case '2' % Hermann & Boris
        gvars.dynamicsFLAG = str2num(reply);
        gvars.C = 150;
        gvars.E_Na = 55;
        gvars.gNaBAR = 4200;
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****Invalid selection. Please try again.****');
        fprintf(1,'\nHit any key to continue: ');
	pause 
	reply = [];
    end % switch
  end % while loop
  
function save_menu

  global gvars

  save_fid = -1;
  brk = 0;
  while (save_fid == -1)
    clc;
    prompt = sprintf('Please enter the name of a file to which to write');
    prompt = sprintf('%s the simulation parameters.\n', prompt);
    disp(prompt);
    strng = sprintf('params.mat');
    prompt = sprintf('Name of parameter file (default=%s)', strng);
    prompt = sprintf('%s(type @ to abort): ', prompt);
    save_file = input(prompt, 's');
    if (isempty(save_file))
      save_file = ' ';
      save_file = strng;
    elseif (save_file(1) == ['@'])                                      % Abort
      reply = [];
      save_fid = 1;
      brk = 1;
    else
      save_file = save_file;
    end % if (isempty(save_file))

    if (~brk)
      save_fid = 1;
      save(save_file, 'gvars');
      gvars.saveFLAG = 2;
      gvars.saveFILE = ' ';
      gvars.saveFILE(1:length(save_file)) = save_file;
    end % if (~brk)
  end % while (save_fid == -1)

function parameter_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a source for the simulation parameters');
    strng = sprintf('%s from the menu below:\n', strng);
    disp(strng);

    dim = size(gvars.parameterSOURCE);
    for i = 1:dim(1)
      strng = sprintf('    %d) %s', i, deblank(gvars.parameterSOURCE(i,:)));
      disp(strng);
    end
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1' % Menu Options
        gvars.parameterFLAG = str2num(reply);
      case '2' % Binary File
        gvars.parameterFLAG = str2num(reply);
        parameter_submenu;
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****Invalid selection. Please try again.****');
        fprintf(1,'\nHit any key to continue: ');
	pause 
	reply = [];
    end % switch
  end % while loop
  
function parameter_submenu

  global gvars

  parameter_fid = -1;
  brk = 0;
  while (parameter_fid == -1)
    strng = sprintf('params.mat');
    prompt = sprintf('\nName of parameter file (default=%s)', strng);
    prompt = sprintf('%s(type @ to abort): ', prompt);
    parameter_file = input(prompt, 's');
    if (isempty(parameter_file))
      parameter_file = ' ';
      parameter_file = strng;
    elseif (parameter_file(1) == ['@'])                                 % Abort
      reply = [];
      parameter_fid = 1;
      brk = 1;
    else
      parameter_file = parameter_file;
    end % if (isempty(parameter_file))

    if (~brk)
      parameter_fid = fopen(parameter_file, 'r');
      if (parameter_fid == -1)
        disp(' ');
        disp('****File not found. Please try again****');
      else
	status = fclose(parameter_fid);
	execution_mode = gvars.executionMODE;
	load(parameter_file, 'gvars');
	gvars.parameterFLAG = 2;
	gvars.executionMODE = execution_mode;
	gvars.parameterFILE = ' ';
        gvars.parameterFILE(1:length(parameter_file)) = parameter_file;
      end % if (parameter_fid == -1)
    end % if (~brk)
  end % while (parameter_fid == -1)
  
% end parameter_submenu()
  
function template_menu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    strng = sprintf('Please select a source for the nicotinic synaptic');
    strng = sprintf('%s conductance template from the menu below:\n', strng);
    disp(strng);

    dim = size(gvars.templateSOURCE);
    for i = 1:dim(1)
      strng = sprintf('    %d) %s', i, deblank(gvars.templateSOURCE(i,:)));
      disp(strng);
    end
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1' % Menu Options
        gvars.templateFLAG = str2num(reply);
      case '2' % Binary File
        gvars.templateFLAG = str2num(reply);
        template_submenu;
	gvars.fireMODE(1:gvars.numSYN) = 0;
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****Invalid selection. Please try again.****');
        fprintf(1,'\nHit any key to continue: ');
	pause 
	reply = [];
    end % switch
  end % while loop
  
function template_submenu
% Obtains a parameter file from the user and opens it

  global gvars

  template_fid = -1;
  brk = 0;
  while (template_fid == -1)
    strng = sprintf('gsyn.gtm');
    prompt = sprintf('\nName of binary file (default=%s)', strng);
    prompt = sprintf('%s(type @ to abort): ', prompt);
    template_file = input(prompt, 's');
    if (isempty(template_file))
      template_file = ' ';
      template_file = strng;
    elseif (template_file(1) == ['@'])                                  % Abort
      reply = [];
      template_fid = 1;
      brk = 1;
    else
      template_file = template_file;
    end % if (isempty(template_file))

    if (~brk)
      template_fid = fopen(deblank(template_file), 'r');
      if (template_fid == -1)
        disp(' ');
        disp('****File not found. Please try again****');
      else
        data = fread(template_fid, [1,gvars.headerSIZE], 'single', 'b');
        gvars.saveSTEP = float(data(1));
	gvars.thresholdGSYN = data(2);
	gvars.gsynBAR = data(3:4);
	gvars.gsynBAR(2) = gvars.gsynBAR(2) / gvars.thresholdGSYN;
	gvars.pulseSTART = data(5);
	gvars.f_oscAMPLITUDE = data(6);
	gvars.f_oscRATE = data(7);
	gvars.f_oscPHASE = data(8:9);
	gvars.numSECONDARIES = data(10);
	gvars.primaryFREQS = float(data(11));
	gvars.integTIMES = data(12);
	gvars.baseTIME = data(13);
	gvars.afterDELAY = data(14);
	junk = data(15:gvars.headerSIZE);
	gvars.gsyn_fileMARK = ftell(template_fid);
        status = fclose(template_fid);
	gvars.templateFILE = ' ';
        gvars.templateFILE(1:length(template_file)) = template_file;
	gvars.numSYN = gvars.numSECONDARIES + 1;
	if (gvars.numSYN > 2)
	    gvars.gsynBAR(3:gvars.numSYN) = gvars.gsynBAR(2);
	end
      end % if (template_fid == -1)
    end % if (~brk)
  end % while (template_fid == -1)


function fpre_modulator_menu

global gvars

reply = [];
while (isempty(reply))
    clc;
    strng = sprintf(['The current form of the presynaptic frequency '...
		     'modulator is a']);
    if (gvars.fpre_modFLAG == 1) % sine wave
	strng = sprintf('%s sine wave.', strng);
    elseif (gvars.fpre_modFLAG == 2) % step function
	strng = sprintf('%s step function.', strng);
    else
	strng = sprintf('%s summed sine waves.', strng);
    end
    strng = sprintf(['%s\n\nPlease select a new wave form from the menu' ...
		     ' below:\n'], strng);
    disp(strng);
    disp('    1) sine wave');
    disp('    2) step function');
    disp('    3) summed sine waves');
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
        case '1' % sine wave
            gvars.fpre_modFLAG = str2num(reply);
	    %sine_wave_menu;
        case '2' % step function
	    gvars.fpre_modFLAG = str2num(reply);
        case '3' % summed sine waves
	    gvars.fpre_modFLAG = str2num(reply);
        case 'z'
	    ; % Return to previous menu
        otherwise
	    disp(' ');
	    disp('****Invalid selection. Please try again.****');
	    fprintf(1,'\nHit any key to continue: ');
	    pause 
	    reply = [];
    end % switch
end % while loop

% end fpre_modulator_menu


function sine_wave_menu

global gvars

reply = [];
while (isempty(reply))
    clc;
    strng = sprintf(['The current form of the presynaptic frequency '...
		     'modulator is a']);
    if (gvars.fpre_modFLAG == 1) % sine wave
	strng = sprintf('%s sine wave.', strng);
    else
	strng = sprintf('%s step function.', strng);
    end
    strng = sprintf(['%s\n\nPlease select a new wave form from the menu' ...
		     ' below:\n'], strng);
    disp(strng);
    disp('    1) sine wave');
    disp('    2) step function');
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
        case '1' % sine wave
            gvars.fpre_modFLAG = str2num(reply);
	    sine_wave_menu;
        case '2' % step function
	    gvars.fpre_modFLAG = str2num(reply);
        case 'z'
	    ; % Return to previous menu
        otherwise
	    disp(' ');
	    disp('****Invalid selection. Please try again.****');
	    fprintf(1,'\nHit any key to continue: ');
	    pause 
	    reply = [];
    end % switch
end % while loop

% end sine_wave_menu

function step_function_menu

global gvars

reply = [];
while (isempty(reply))
    clc;
    strng = sprintf(['The current form of the presynaptic frequency '...
		     'modulator is a']);
    if (gvars.fpre_modFLAG == 1) % sine wave
	strng = sprintf('%s sine wave.', strng);
    else
	strng = sprintf('%s step function.', strng);
    end
    strng = sprintf(['%s\n\nPlease select a new wave form from the menu' ...
		     ' below:\n'], strng);
    disp(strng);
    disp('    1) sine wave');
    disp('    2) step function');
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
        case '1' % sine wave
            gvars.fpre_modFLAG = str2num(reply);
	    %sine_wave_menu;
        case '2' % step function
	    gvars.fpre_modFLAG = str2num(reply);
        case 'z'
	    ; % Return to previous menu
        otherwise
	    disp(' ');
	    disp('****Invalid selection. Please try again.****');
	    fprintf(1,'\nHit any key to continue: ');
	    pause 
	    reply = [];
    end % switch
end % while loop

% end step_function_menu


function facilitation_menu

global gvars

reply = [];
while (isempty(reply))
    clc;
    strng = sprintf('Facilitation is currently');
    if (gvars.isFacilitationActive)
	strng = sprintf('%s active.', strng);
    else
	strng = sprintf('%s inactive.', strng);
    end
    strng = sprintf(['%s\n\nPlease make a selection from the menu' ...
		     ' below:\n'], strng);
    disp(strng);
    disp('    1) activate facilitation');
    disp('    2) inactivate facilitation');
    disp('    z) Return to previous menu');
    reply = input('\nYour selection: ', 's');
    switch reply
        case '1' % activate facilitation
            gvars.isFacilitationActive = 1;
	    facilitation_submenu;
        case '2' % step function
            gvars.isFacilitationActive = 0;
        case 'z'
	    ; % Return to previous menu
        otherwise
	    disp(' ');
	    disp('****Invalid selection. Please try again.****');
	    fprintf(1,'\nHit any key to continue: ');
	    pause 
	    reply = [];
    end % switch
end % while loop

% end facilitation_menu

function facilitation_submenu

  global gvars

  reply = [];
  while (isempty(reply))
    clc;
    disp(['Please select a facilitation parameter to modify {1 +' ...
	  ' Aexp(-t/tau)}: ']);
    strng = sprintf('\n    1) Amplification factor');
    strng = sprintf('%s A = %.2f', strng, gvars.facilitationFactor);
    disp(strng);
    strng = sprintf('    2) Decay rate tau = %.2f ms', ...
		    gvars.facilitationDecayRateMsec);
    disp(strng);
    disp('    z) Return to main menu');
    reply = input('\nYour selection: ', 's');
    switch reply
      case '1'
        xFactor = [];
	while (isempty(xFactor))
          prompt = sprintf('\nPlease enter the amplification factor: ');
	  xFactor = str2num(input(prompt, 's'));
	  if isempty(xFactor)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(xFactor)
	end % while loop
        gvars.facilitationFactor = xFactor;
	reply = [];
      case '2'
        decayRate = [];
	while (isempty(decayRate))
          prompt = sprintf('\nPlease enter the decay rate: ');
	  decayRate = str2num(input(prompt, 's'));
	  if isempty(decayRate)
            disp(' ');
	    disp('****That is not a valid number. Please try again.****');
	  end % isempty(decayRate)
	end % while loop
        gvars.facilitationDecayRateMsec = decayRate;
	reply = [];
      case 'z'
        ; % Return to previous menu
      otherwise
        disp(' ');
        disp('****That is not a valid selection. Please try again.****');
	fprintf(1,'\nHit any key to continue: ');
	pause;
	reply = [];
    end % switch reply
  end % while loop

% end facilitation_submenu


function update_integration_times(nFreqs)

global gvars

nTimes = length(gvars.integTIMES);
if (nTimes < nFreqs)
    gvars.integTIMES((nTimes+1):nFreqs) = gvars.integTIMES(nTimes);
else
    temp(1:nFreqs) = gvars.integTIMES(1:nFreqs);
    gvars.integTIMES = [];
    gvars.integTIMES(1:nFreqs) = temp(1:nFreqs); 
end

% end function update_arrays

function bootstrap_menu

  global gvars

  clc;
  strng = sprintf('The number of bootstrap cycles is %d.', gvars.nBootStrap);
  disp(strng);
  reply = [];
  while (isempty(reply))
    reply = input('\nEnter a new value or hit <RETURN>: ', 's');
    if (isempty(reply))
      reply = gvars.nBootStrap;
    else
      nCycles = str2num(reply);
      if (isempty(nCycles) | nCycles < 1)
        disp(' ');
	disp('****That is not a valid number. Please try again.****');
	reply = [];
      else
        gvars.nBootStrap = round(nCycles);
      end % isempty(nCycles)
    end % if (isempty(reply))
  end % while loop

% end function bootstrap_menu
