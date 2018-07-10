function [tSpan, y0, options, Misc] = initialize_segment_cycle(Neuron, ...
						  Misc)
% Function to initialize variables required for each new integration-time
%   segment cycle in neurosim()
%
% This function is called by the function neurosim().  The updated
%   structure variables ? and ? and ? are passed into the function.
%
% The function returns a 1-D array of all of the time steps for the
%   entire simulation, a 5-element array holding the segment
%   starting values for V, m, h, n, and w, and a structure variable
%   holding the option settings for the ordinary differential
%   equation (ODE) numerical integrator.
%
% by Diek W. Wheeler, Ph.D.

% Last change 03/11/02
% 06/27/02 removed pulseSTART from list of global variable used in this file
% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/21/02 removed tspan, y0, and options from the gvars structure
% 09/17/02 streamlined the setting of options for the two computer systems
% 09/05/03 started and finished coding renovations
% 11/14/03 removed all references to global variable gvars

% Create local variables for legibility

startMsec = Misc.integrationSegmentStartMsec;
stepMsec = Misc.saveStepMsec;
stopMsec = Misc.integrationSegmentStopMsec;
halfStepMsec = stepMsec / 2;

computerType = computer;
isPc = (computerType(1:5) == 'PCWIN');
isFullExecutionWithPlotting = (Misc.executionMode == 1);

% Calculate the number of points to be saved in the current
%   integration segment cycle
Misc.nPoints = round((stopMsec - startMsec) / stepMsec) + 1;
  
% Variables set to resting values established by default parameter settings 

tSpan = [startMsec:stepMsec:(stopMsec+halfStepMsec)];
  
y0 = Neuron.initialValuesArray;

if (isFullExecutionWithPlotting)
    outputFunction = 'neuroplot'; % generates a plot during ODE computations
else % computerType == 'LINUX'
    outputFunction = ''; % no plot is generated during ODE computations
end

options = odeset('RelTol', 1e-3, 'AbsTol', ...
		 [1e-4 1e-6 1e-5 1e-5 1e-5 1e-5 1e-5], ...
		 'MaxStep', 15.0, 'MaxOrder', 3, ...
		 'OutputFcn', outputFunction);

% end initialize_segment_cycle()
