function currentClampDataMsecPampArray = ...
    compute_current_clamp_template(Synapse, Iclamp, Misc, iPrimaryLoop)
% Function to compute template for current clamp and to save it to an array
%
% This function is called by the function initialize_parameter_cycle().
%   The updated structure variables Synapse, Iclamp, Misc
%   and the current   index of the primary frequencies' loop are
%   passed into the function.
%
% The function returns a 2-D array that consists of a temporal
%   array (ms) and the corresponding values of the applied current
%   clamp (pA)
%
% by Diek W. Wheeler, Ph.D.

% Last change 08/17/01
% 06/28/02 added pulseEND to current clamp templates - successfully tested for
%          inactivated current clamp, current step, current ramp, and ZAP fixed
%          a bug where the program could not integrate templates that were not
%          a whole number of milliseconds long - had not incorporated saveSTEP
%	   into the lengths of the iclamp templates
% 07/23/02 added subFOLDER as a global variable so current clamp templates
%          can be written to the proper subfolder
% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/21/02 removed iCLAMP from the gvars structure so it is now passed through
%	   the function call in the form of current_clamp
% 05/01/03 began renovation of coding style
%          removed pulseEND since it no longer serves any function
% 09/03/03 continuing coding renovations
% 09/04/03 finished coding renovations
% 10/01/03 really finished coding renovations, removed all
%          references to the global variable gvars

% Create local variables for legibility

inactiveMode = 1;
stepMode = 2;
rampMode = 3;
zapMode = 4;
singleWaveformMode = 5;

riseMsec = Synapse.gsynRiseTimeMsec;
fallMsec = Synapse.gsynFallTimeMsecArray(1);
scaleFactor = Synapse.gsynScaling;

isFullExecutionsWithPlotting = (Misc.executionMode == 1);
 
stepMsec = Misc.saveStepMsec;

startMsec = Misc.activationStartMsec + Iclamp.preActivationLatencyMsec;
lenStart = round(startMsec / stepMsec);  % array length
 
activeMsec = startMsec + Iclamp.activationDurationMsec;
lenActive = round(activeMsec / stepMsec);  % array length

stopMsec = activeMsec + Iclamp.postActivationLatencyMsec;
totalMsec = Misc.activationStartMsec + ...
    Misc.totalIntegrationTimeMsecArray(iPrimaryLoop);
if (totalMsec > stopMsec)
    stopMsec = totalMsec;
end
lenStop = round(stopMsec / stepMsec);
    
currentClampDataMsecPampArray(:, 1) = [0:stepMsec:stopMsec]';
currentClampDataMsecPampArray(:, 2) = 0;
  
if (Iclamp.mode == inactiveMode)  % Inactive current clamp

    yMin = -50;
    yMax = 50;

elseif (Iclamp.mode == stepMode)  % Current clamp step
    
    currentClampDataMsecPampArray((lenStart+1):lenActive, 2) = ...
	Iclamp.stepAmplitudePamp;
    
    yMin = Iclamp.stepAmplitudeStartPamp - 50;
    yMax = Iclamp.stepAmplitudeStopPamp + 50;
    
elseif (Iclamp.mode == rampMode)  % Current clamp ramp

    settleMsec = startMsec + Iclamp.preRampActivationLatencyMsec;
    lenSettle = round(settleMsec / stepMsec);
    
    activeMsec = settleMsec + Iclamp.activationDurationMsec;
    lenActive = round(activeMsec / stepMsec);
    
    rampMsec = stepMsec:stepMsec:(activeMsec-settleMsec);
    rampMsec = rampMsec'; % convert from row to column vector
    
    stopMsec = activeMsec + Iclamp.postActivationLatencyMsec;
    totalMsec = Misc.activationStartMsec + ...
	Misc.totalIntegrationTimeMsecArray(iPrimaryLoop);
    if (totalMsec > stopMsec)
	stopMsec = totalMsec;
    end
    lenStop = round(stopMsec / stepMsec);
    
    startPamp = Iclamp.rampAmplitudeStartPamp;
    stopPamp = Iclamp.rampAmplitudeStopPamp;
    
    deltaPamp = stopPamp - startPamp;
    deltaMsec = Iclamp.activationDurationMsec;
    
    slopePampPerMsec = deltaPamp / deltaMsec;
    
    currentClampDataMsecPampArray((lenStart+1):lenSettle, 2) = startPamp;
    
    rampPamp = startPamp + (slopePampPerMsec * rampMsec);
    
    currentClampDataMsecPampArray((lenSettle+1):lenActive, 2) = rampPamp;
    
    if (startPamp < stopPamp) % upward vs. downward slope
	yMin = startPamp - 50;
	yMax = stopPamp + 50;
    else
	yMin = stopPamp - 50;
	yMax = startPamp + 50;
    end
   
elseif (Iclamp.mode == zapMode)  % ZAP function

    zapMinHz = Iclamp.zapFrequencyMinimumHz;
    zapMaxHz = Iclamp.zapFrequencyMaximumHz;
    zapPamp = Iclamp.zapAmplitudePamp;
    phiRadian = Iclamp.zapPhaseRadian;
    
    nZap = lenActive - lenStart;
    
    zapStepHz = (zapMaxHz - zapMinHz) / nZap;
    zapHz = [zapMinHz:zapStepHz:zapMaxHz]';

    tMsec = 0:stepMsec:(activeMsec-startMsec);
    tSec = tMsec / 1000;
    clear tMsec;
    
    for iZap = 1:nZap
	currentClampDataMsecPampArray((lenStart+iZap), 2) = ...
	    zapPamp * sin(2*pi*zapHz(iZap)*tSec(iZap) - phiRadian);
    end
    
    clear tSec;
    
    isHighToLow = 2;
    
    if (Iclamp.zapMode == isHighToLow) % Reverse direction of ZAP activity
	
	currentClampDataMsecPampArray((lenStart+1):lenActive, 2) = ...
	    currentClampDataMsecPampArray(lenActive:-1:(lenStart+1), 2);
	
    end

    yMin = -zapPamp - 50;
    yMax = zapPamp + 50;
    
else  % (Iclamp.mode == singleWaveformMode) single current waveform

    tMsec = 0:stepMsec:(activeMsec-startMsec);
    nMsec = length(tMsec);
    
    amp = Iclamp.waveformAmplitudePamp;
    
    for i = 1:nMsec
	currentClampDataMsecPampArray((lenStart+i), 2) = ...
	    amp * (-exp(-tMsec(i)/riseMsec) + exp(-tMsec(i)/fallMsec)) / ...
	                                                           scaleFactor;
    end
    
    clear tMsec;
    
    if (amp < 0)
	yMin = amp -50;
	yMax = 50;
    else
	yMin = -50;
	yMax = amp+50;
    end
    

end % if Iclamp.mode

if (Misc.executionMode == isFullExecutionsWithPlotting)
    if (Iclamp.mode ~= inactiveMode)  % check if the current clamp
	                              % has been activated
	figure(2);
	clf;
	plot(currentClampDataMsecPampArray(:, 1), ...
	     currentClampDataMsecPampArray(:, 2));
	xlabel('Time (ms)');
	ylabel('Injected Current (pA)');
	xMin = min(currentClampDataMsecPampArray(:, 1));
	xMax = max(currentClampDataMsecPampArray(:, 1));
	axis([xMin xMax yMin yMax]);
	hold on;
    end
    figure(1);
end

if (Iclamp.mode ~= inactiveMode)
    lenArray = length(currentClampDataMsecPampArray(:, 1));
    currentClampDataFileName = sprintf('%s/iclamp_template.bin', ...
				 Misc.dataDirectoryName);
    currentClampDataFileId = fopen(currentClampDataFileName, 'w', 'ieee-be');
    fwrite(currentClampDataFileId, ...
	   full(currentClampDataMsecPampArray(1:lenArray, 1:2)), ...
	   'single');
    status = fclose(currentClampDataFileId);
end

% end compute_current_clamp_template()