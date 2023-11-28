function [apCount, apTimeMsec, apIsiMsec] = ...
                          count_action_potentials(vDataMvolt, tDataMsec, nData)
% This function counts the number of action potentials in a voltage
%   trace.  An action potential is counted whenever the membrane
%   voltage crosses from a negative to a positive voltage.
%
% This function is called by the function neurosim().  The values
%   being passed during the function call are an array of voltage
%   data and its corresponding temporal array, and the number of
%   data points.
%
% The function returns the number of action potentials, an array of
%   the timings of the action potentials, and an array the intervals
%   between action potentials.
%
% by Diek W. Wheeler, Ph.D.

% 11/21/03 added timings array to the list of returned values

isAp = 0;
apCount = 0;
apTimeMsec = -1;
apIsiMsec = -1;
for i = 1:nData % Step through the voltage data
    if (vDataMvolt(i) > 0)              % Check if voltage is positive
	if ~isAp                        % Check if voltage has just become pos.
	    isAp = 1;                   % Set flag to indicate positive domain
	    apCount = apCount + 1;      % Update count of action potentials
	    apTimeMsec(apCount) = tDataMsec(i);
	    if (apCount > 1)
		apIsiMsec(apCount-1) = apTimeMsec(apCount) - ...
		                                         apTimeMsec(apCount-1);
	    end
	end
    else                                % Otherwise voltage is negative
	isAp = 0;                       % Reset positive voltage indicator
    end
end % i loop

% end function count_action_potentials(voltageDataMvolt, nData)