function [Synapse, Misc] = compute_synaptic_events(Synapse, Misc, ...
						   iPrimaryLoop)
% This function computes in advance the timings of all of the
%   synaptic events for an entire run.  The event times during
%   stochastic firing are calculated based on the assumption that
%   the probability of an event occurring within the next T seconds
%   is Prob(fire) = 1 - exp(-T*F), where F is the mean firing rate.
%
% This function is called by the function initialize_parameter_cycle().
%   The values being passed during the function call are the
%   structure variables Synapse and Misc, and the current index of
%   the primary frequencies loop.
%
% The function returns the updated structure variables Synapse and Misc
%
% by Diek W. Wheeler, Ph.D.

% Comments added 05/19/02 DWW
% 08/19/02 replaced all global variables with 'gvars.' structure
% 09/16/02 modified code to account for condition when there are no
%          pulses generated for the template for one of the synapses
% 11/22/02 added window of summation template mode, when it is
%          active only two conductance pulse are generated, it
%          works only in the steady rhythmic firing mode
% 03/05/03 added second window of summation template mode, when it is
%          active only two conductance pulses are generated, a
%          single primary pulse at pulseSTART and a single
%          secondary pulse at pulseSTART+pulseDELAY
% 04/05/03 removed the count label on the secondary data files
% 04/24/03 added step function to possible waveforms of f_osc
%          began renovation of coding style
% 04/25/03 finished renovation of coding style
% 04/27/03 renamed function from calc_pulse()
% 05/15/03 started to add facilitaton and individual secondary synapses
%          Synapse.frequencyHz, Synapse.gsynThresholdNsiemen, and
%          Misc.avgInterEventIntervalMsec are no longer arrays and
%          are now the same for both primary and secondary synapses
% 05/16/03 finished adding facilitation and multiple secondaries
% 09/03/03 finished further coding renovations
% 11/14/03 removed all references to the global variable gvars

% Create local variableasfor legibility

isDebug = Misc.isDebug;

sineWave = 1;
stepFunction = 2;
summedSineWaves = 3;
	    
% Set local variables to number of synapses for file labeling and
%   to number of synapses for calulation of firing patterns

nFile = Synapse.number;
nSyn = Synapse.number;

% Initialize the text datafile for the primary firing times (ms).

fileName = sprintf('%s/primary%s.dat', Misc.dataDirectoryName, ...
		   Misc.dataSuffix);
timingDataFileId(1) = fopen(fileName, 'w');

% Initialize the text datafiles for the secondary firing times (ms).
    
for iFile = 2:nFile
    fileName = sprintf('%s/secondary%d%s.dat', Misc.dataDirectoryName, ...
		       (iFile-1), Misc.dataSuffix);
    timingDataFileId(iFile) = fopen(fileName, 'w');
end

% Initialize the text datafile for the primary interevent interval times (ms).

fileName = sprintf('%s/primary_isi%s.dat', Misc.dataDirectoryName, ...
	       Misc.dataSuffix);
isiDataFileId(1) = fopen(fileName, 'w');

% Initialize the text datafiles for the secondary interevent
%   interval times (ms).

for iFile = 2:nFile
    fileName = sprintf('%s/secondary_isi%d%s.dat', Misc.dataDirectoryName, ...
		       (iFile-1), Misc.dataSuffix);
    isiDataFileId(iFile) = fopen(fileName, 'w');
end

% Determine how many random numbers need to be generated for a
%   stochastic firing sequence.
%
% The number is based on the length of the numerical integration time
%   for the current primary firing frequency divided by the temporal
%   grain size of the data that will be saved to file.  This quotient
%   is incremented by one to account for the starting values in the
%   data arrays.

totalTime = Misc.totalIntegrationTimeMsecArray(iPrimaryLoop);
stepSize = Misc.saveStepMsec;
nRanNum = (totalTime / stepSize) + 1;

% Cycle through all of the synapses and compute the full firing
%   pattern for each one depending on their assigned firing modes.

for iSyn = 1:nSyn

    firingMode = Synapse.firingModeArray(iSyn);
    rhythmicFiring = -1;
    randomFiring = +1;
    noFiring = 0;
    
% For steady rhythmic firing, first the interevent delay is computed
%   by rounding the average delay time to the nearest whole number of
%   timestep grain sizes.  The total number of events to be generated
%   is computed by finding the number of whole inter-event intervals
%   that will evenly divide into the total numerical integration time
%   for the current primary firing frequency.  This value is
%   incremented by one to account for the initial synaptic event
%   that occurs as soon as the equilibrium settling time is finished.

    tStartMsec = Misc.activationStartMsec;

    if (firingMode == rhythmicFiring)

% The data is saved every X msec.  The average time between events
%   is recomputed so that it is equal to a whole number of X steps.

	nWholeStepsPerInterval = round(Misc.avgInterEventIntervalMsec / ...
				       Misc.saveStepMsec);
	Misc.avgInterEventIntervalMsec = Misc.saveStepMsec * ...
	    nWholeStepsPerInterval;
	
	tStepMsec = Misc.avgInterEventIntervalMsec;
	tStopMsec = tStartMsec + (1.5 * tStepMsec); % the factor of 1.5 avoids
						 % missing the endpoint due
                                                 % to addition errors
						 % (default value)

	if (isDebug)
	    
	    Synapse.nEventArray(iSyn) = 2; % only 2 synaptic events
	    nEvents = Synapse.nEventArray(iSyn);

	    Synapse.eventTimeMsecArray(1:nEvents, iSyn) = ...
		[tStartMsec:tStepMsec:tStopMsec]';
	    
	else % ~isDebug
	    
	    templateMode = Misc.twoEventTemplateMode;
	    twoPrimaryEvents = 1;
	    onePrimaryOneSecondaryEvents = 2;
	    notActive = 0;
	    
	    if (templateMode == twoPrimaryEvents)
		
%		Synapse.nEventArray(iSyn) = 2;
if (1==1)
                if (iSyn == 1)
		    Synapse.nEventArray(iSyn) = 2;
		    pp = 14.9;
		    sstep = 10.3;
		    Synapse.eventTimeMsecArray(1:2, 1) = ...
			[tStartMsec+pp:sstep:tStartMsec+(1.5*sstep)+pp]';
		elseif (iSyn == 2)
		    Synapse.nEventArray(iSyn) = 1;
		    Synapse.eventTimeMsecArray(1, 2) = ...
			[tStartMsec]';
		else
		    Synapse.nEventArrray(iSyn) = 0;
		end
else
                if (iSyn == 1)
		    Synapse.nEventArray(iSyn) = 2;
		    Synapse.eventTimeMsecArray(1:2, 1) = ...
			[tStartMsec:15.0:tStopMsec]';
		elseif (iSyn == 2)
		    Synapse.nEventArray(iSyn) = 1;
		    Synapse.eventTimeMsecArray(1, 2) = ...
			[tStartMsec+15.0+10.1]';
		else
		    Synapse.nEventArrray(iSyn) = 0;
		end
end
		nEvents = Synapse.nEventArray(iSyn);

%		    [tStartMsec:tStepMsec:tStopMsec]';
%	        Synapse.eventTimeMsecArray(1, 2) = ...
%		    [tStartMsec+tStepMsec+30.0]';
%	        Synapse.eventTimeMsecArray(1:nEvents, iSyn) = ...
%		    [tStartMsec:tStepMsec:tStopMsec+5.0]';
%		    [tStartMsec:tStepMsec:tStopMsec]';
				
	    elseif (templateMode == onePrimaryOneSecondaryEvents)
		
		Synapse.nEventArray(iSyn) = 1;
		nEvents = Synapse.nEventArray(iSyn);
		
		if (iSyn == 1) % The primary event is triggered as soon
                               % as the initial settling time has ended.

		    Synapse.eventTimeMsecArray(1, iSyn) = tStartMsec;
				
		else % The secondary event is triggered after the
                     % primary at a delay equal to the interevent interval

		    Synapse.eventTimeMsecArray(1, iSyn) = tStopMsec;
		    
		end % if iSyn
				
	    else % templateMode == notActive

		totalTime = Misc.totalIntegrationTimeMsecArray(iPrimaryLoop);
		Synapse.nEventArray(iSyn) = floor(totalTime / tStepMsec) + 1;
		nEvents = Synapse.nEventArray(iSyn);
		
		tStopMsec = tStartMsec + totalTime;

		Synapse.eventTimeMsecArray(1:nEvents, iSyn) = ...
		    [tStartMsec:tStepMsec:tStopMsec]';
		
	    end % if templateMode
	    
	end % if isDebug

	interEventIntervals(1:nEvents, iSyn) = tStepMsec;

% For random firing, first there is a check to see if the rate of
%    firing is being modulated by oscillations.  If the amplitude of
%    the firing rate oscillations is non-zero, then the new
%    sinusoidally-modulated firing rates are computed one timestep at a
%    time.  Whether the firing rates are modulated or not, the next
%    step determines the firing rate values that are greater than zero
%    and then computes the probabilities of firing based on those rate
%    values.  The probability of firing follows an exponential
%    distribution and is dependent on the instantaneous rate of firing
%    in Hertz and the timestep size in seconds.  Next, the average
%    firing rate values are no longer needed so the variable holding
%    the values is cleared.  The timesteps when presynaptic firings
%    will occur are determined by comparing a random number chosen
%    between zero and one with the probabilities just computed.  The
%    number of presynaptic firings is stored in a new variable for
%    later use.  Up to this point, the instances of presynaptic firing
%    have been kept track of by virtue of which timestep number they
%    have occured at, i.e. their position number.  These position
%    numbers are converted into time values by multiplying the position
%    number by the timestep size and adding in the settling delay time.

    elseif (firingMode == randomFiring)  % random firing
	
	if (Synapse.frequencyModulatorAmplitudeHz == 0)
			
	    % frequency modulator amplitude is zero, so the
            % presynaptic firing frequency is set to a constant
            % value (Hz)

            fPreHz = Synapse.frequencyHz;

	else % modulator amplitude > 0, evaluate frequency modulator equations
	    
	    tMsec = [Misc.integrationSegmentStartMsec:...
			     Misc.saveStepMsec:...
			     Misc.totalIntegrationTimeMsecArray(iPrimaryLoop)];

	    fMeanHz = Synapse.frequencyHz;
	    fAmpHz = Synapse.frequencyModulatorAmplitudeHz;
	    fRateHz = Synapse.frequencyModulatorRateHz;
	    phiRad = Synapse.frequencyModulatorPhaseRadianArray(iSyn);
	    tSec = tMsec / 1000;
		
	    if (Synapse.frequencyModulatorFunction == sineWave)
		fPreHz = fMeanHz + ...
			 (fAmpHz * sin(2*pi*fRateHz*tSec - phiRad));
		
	    elseif (Synapse.frequencyModulatorFunction == stepFunction)
		
		periodMsec = 1000 / fRateHz;
		
		if (1 == 0) % normal code
		    
		    fractionOfPeriod = phiRad / (2*pi);
		    fractionOfPeriodMsec = fractionOfPeriod*periodMsec;
		    nHalfPeriods = floor((tMsec + ...
					  fractionOfPeriodMsec) / ...
					 (periodMsec/2));
		    isOddHalfPeriod = mod(nHalfPeriods, 2);
		    plusOrMinusOne = isOddHalfPeriod*2 - 1;
		    plusOrMinusOne = -plusOrMinusOne;
		    
		else % kludge code
		    
		    fractionOfPeriod = mod(tMsec, periodMsec);
		    isPositiveFraction = fractionOfPeriod <= ...
			0.37*periodMsec;
		    plusOrMinusOne = isPositiveFraction*2 - 1;
		    
		end % (1 == 0)
		
		fPreHz = fMeanHz + (plusOrMinusOne * fAmpHz);
		
	    else % Synapse.frequencyModulatorFunction == summedSineWaves
		
                maxRateHz = sine_sum_maximum(fAmpHz, fRateHz);
		fPreHz = fAmpHz*sin(2*pi*fRateHz*tSec - phiRad) + ...
			 fAmpHz*sin(2*pi*2*fRateHz*tSec - phiRad) + ...
			 (fMeanHz + fAmpHz - maxRateHz);
	    
	    end % if Synapse.frequencyModulatorFunction
		
	    clear tMsec;
	    
	end % if Synapse.frequencyModulatorAmplitudeHz
	
	tStepMsec = Misc.saveStepMsec;
	tStepSec = tStepMsec / 1000;
	
	probabilityOfFiring = 1 - exp(-fPreHz * tStepSec);
	clear fPreHz;
	
	successfulEventPositionArray = find(rand(nRanNum,1) <= ...
					    probabilityOfFiring');
	
	nSuccessfulEvents = length(successfulEventPositionArray);

	interEventIntervals(1,iSyn) = 0; % default == no
                                         % inter-event interval times
	
	if (nSuccessfulEvents > 0) % if at least 1 successful firing
                                   % event then calculate the
                                   % precise times of those events
	    Synapse.eventTimeMsecArray(1:nSuccessfulEvents, iSyn) = ...
		tStartMsec + (tStepMsec * successfulEventPositionArray);
	
	    if (nSuccessfulEvents > 1)
		for i = 2:nSuccessfulEvents % calculate inter-event
				            % interval times (msec)
                    interEventIntervals(i-1, iSyn) = ...
			Synapse.eventTimeMsecArray(i, iSyn) - ...
			Synapse.eventTimeMsecArray(i-1, iSyn);
		end % i loop
	    end	
	end % if (nSuccessfulEvents > 0)
	
	Synapse.nEventArray(iSyn) = nSuccessfulEvents;
	
    else % firingMode == noFiring
		
	Synapse.nEventArray(iSyn) = 0;
	Synapse.eventTimeMsecArray(1, iSyn) = 0;
	interEventIntervals(1, iSyn) = 0;
	
    end % if firingMode
    
    fprintf(timingDataFileId(iSyn), '%.8f\n', ...
	    Synapse.eventTimeMsecArray(:, iSyn));
    fprintf(isiDataFileId(iSyn), '%.8f\n', ...
	    interEventIntervals(:, iSyn));
    
end % iSyn loop

displayString = sprintf('\t%5d primary synaptic events', ...
			Synapse.nEventArray(1));
disp(displayString);

for iFile = 2:nFile
    displayString = sprintf('\t%5d secondary synaptic events (#%d)', ...
			    Synapse.nEventArray(iFile), iFile-1);
    disp(displayString);
end

% Close all data files at end of loop

for iFile = nFile:-1:1
    status = fclose(isiDataFileId(iFile));
    status = fclose(timingDataFileId(iFile));
end

% end compute_synaptic_events()
