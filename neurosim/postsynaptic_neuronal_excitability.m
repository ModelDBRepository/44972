function dydt = postsynaptic_neuronal_excitability(t, y, options, GSYN, iCLAMP)
% B-cell model of a bullfrog sympathetic ganglion with kinetic
% synapse, M-current dynamics based on model by Yamada, Koch, and
% Adams, additional non-voltage-dependent background current,
% repetitive stochastic or steady firing current clamp function, and
% extra current leak injection
% 12/11/97                                     
%
% by Diek W. Wheeler, Ph.D.

% Last change 06/06/02
% 06/12/02 modified currentMAX
% 07/03/02 added gRCleakBAR and E_RCleak so the RC-circuit leak can be more
%          easily controlled by the user
% 08/14/02 added mSCALE to allow user control over activation rate of Na
% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/21/02 removed iCLAMP from the gvars structure so it is now passed through
%	   the function call
% 09/12/03 renamed function
% 12/11/24 added A-type potassium current

global gvars                       % Definitions are located in global_defs.m

completion_message(t);

if (1 == 1)
V = y(1);                                            % Membrane voltage (mV)
else
V = -50.0;
end
m = y(2);                                            % Sodium activation
h = y(3);                                            % Sodium inactivation
n = y(4);                                            % Potassium activation
w = y(5);                                            % m current activation
mA = y(6);                                           % A-current activation
hA = y(7);                                           % A-current inactivation

% Determine which version of MATLAB is being run. Depending on the
%   version number, either the function interp1 or the function
%   quickinterp1 will be used to look up values from the nicotinic
%   synaptic conductance template and the current clamp function.

versionNo = version;
I_clamp = 0;
gsyn_bar_s = 0;

if (versionNo(1) >= 6)
%    gsyn_bar_s = interpl(GSYN(:,1), GSYN(:,2), t);
%    I_clamp = interpl(iCLAMP(:,1), iCLAMP(:,2), t);
    gsyn_bar_s = quickinterp1(GSYN(:,1), GSYN(:,2), t);
    I_clamp = quickinterp1(iCLAMP(:,1), iCLAMP(:,2), t);
else
    gsyn_bar_s = interp1(GSYN(:,1), GSYN(:,2), t, '*linear');
    I_clamp = interp1(iCLAMP(:,1), iCLAMP(:,2), t, '*linear');
end

%I_clamp = 0;
%if (t >= 100.000 & t <= 102.000)
%    I_clamp = 600;
%end

%if (t > 99.97 & t < 102.0)
%    strng = sprintf('I = %.3f V = %.3f at t = %.3f\n', I_clamp, V, t);
%    disp(strng);
%    pawz
%end    

% I_i = (conductance of open channel) x (density of channels) x
%       (probability of channel open) x (electromotive driving force)
% from "Channeling with Bard"

I_Na = gvars.gNaBAR*m^2*h*(V-gvars.E_Na);      % Sodium current (pA)
I_K = gvars.gKBAR*n^2*(V-gvars.E_K);           % Potassium current (pA)
I_leak = gvars.gleakBAR*(V-gvars.E_leak);      % Leak current (pA)
I_m = gvars.gmBAR*w*(V-gvars.E_K);             % M-current (pA)
I_cat = gvars.gcatBAR*(V-gvars.E_cat);         % Cation current (pA)
I_syn = gsyn_bar_s*(V-gvars.E_syn);            % Synaptic current (pA)
I_RC = gvars.gRCleakBAR*(V-gvars.E_RCleak);    % RC-circuit leak current (pA)
I_A = gvars.gABAR*mA^3*hA*(V-gvars.E_A);       % A-current (pA)

if (1 == 1)
I_total = I_clamp-I_Na-I_K-I_leak-I_m-I_cat-I_syn-I_RC-I_A;
else
I_total = 0;
end

C = gvars.C;

if (I_total > gvars.currentMAX)
    gvars.currentMAX = I_total;
end

dydt = [(I_total)/C;...                                   % Cell current (pA)
	gvars.mSCALE*(alpha_m(V)*(1-m) - beta_m(V)*m);... % Na activation
	0.5*alpha_h(V)*(1-h) - 0.5*beta_h(V)*h;...        % Na inactivation
	(n_inf(V) - n) / tau_n(V);...                     % K activation
	(w_inf(V) - w) / tau_w(V);...                     % M-current activ.
	(mA_inf(V) - mA) / tau_mA(V);...                  % A-current activ.
	(hA_inf(V) - hA) / tau_hA(V)];                    % A-current inactiv.
	
	
% -----------------------------------------------------------------------------

% Forward and backward rate equations for gating variables
% All equations from Yamada, Koch, and Adams, "Multiple Channels
% and Calcium Dynamics" in Methods in Neuronal Modeling: From
% Synapses to Networks, eds. C. Koch and I. Segev, MIT Press,
% Cambridge MA (1989)

% dm/dt = (m_inf - m) / tau_m
%       = [alpha_m*(1-m) - beta_m*m] / 2
% m_inf = alpha_m / (alpha_m + beta_m)
% tau_m = 2 / (alpha_m + beta_m)

% dn/dt = (n_inf - n) / tau_n
%       = [alpha_n*(1-n) - beta_n*n] / 2
% n_inf = alpha_n / (alpha_n + beta_n)
% tau_n = 2 / (alpha_n + beta_n)

function am = alpha_m(V)
% Forward rate equation for sodium activation
am = 0.36*(V+33)/(1-exp(-(V+33)/3));

function bm = beta_m(V)
% Backward rate equation for sodium activation
bm = -0.4*(V+42)/(1-exp((V+42)/20));

function ah = alpha_h(V)
% Forward rate equation for sodium inactivation
ah = -0.1*(V+55)/(1-exp((V+55)/6));

function bh = beta_h(V)
% Backward rate equation for sodium inactivation
bh = 4.5/(1+exp(-V/10));

function an = alpha_n(V)
% Forward rate equation for potassium activation

global gvars

if (gvars.dynamicsFLAG == 1) % Yamada setting
    an = 0.0047*(V+12)/(1-exp(-(V+12)/12));
else % Hermann & Boris setting
    an = 0.005*(V+12)/(1-exp(-(V+12)/10));
end % if (gvars.dynamicsFLAG == 1)

function bn = beta_n(V)
% Backward rate equation for potassium activation

global gvars

if (gvars.dynamicsFLAG == 1) % Yamada setting
    bn = exp(-(V+147)/30);
else % Hermann & Boris setting
    bn = exp(-(V+75)/30);
end % if (gvars.dynamicsFLAG == 1)

function tn = tau_n(V)
% Time constant equation for potassium activation
tn = 1/(alpha_n(V) + beta_n(V));

function ni = n_inf(V)
% Steady-state activation equation for potassium
ni = alpha_n(V-20)/(alpha_n(V-20)+beta_n(V-20));

function tw = tau_w(V)
% Forward rate equation for m current activation
tw = 1000/(3.3*(exp((V+35)/40)+exp(-(V+35)/20)));

function wi = w_inf(V)
wi = 1/(1+exp(-(V+35)/10));

function mTau = tau_mA(V)
% Forward rate equation for A-current activation
global gvars

mTau = (6 - 4.7 / (1 + exp(-(V+20) / 15))) / gvars.aActTauScaleFactor;

function mInf = mA_inf(V)
mInf = 1 / (1 + exp(-(V+24.8) / 13.9));

function hTau = tau_hA(V)
% Backward rate equation for A-current activation
hTau = 28 - 9.4 / (1 + exp(-(V-2) / 16));

function hInf = hA_inf(V)
hInf = 1 / (1 + exp((V+78.7) / 9.2));


function completion_message(t)

global gvars

span = gvars.tspanStop - gvars.tspanStart;
if (t > 0.1*(gvars.tspanStart + span) & gvars.tspanFlag == 1)
    fprintf(1, '...10%%');
    gvars.tspanFlag = 2;
elseif (t > 0.2*(gvars.tspanStart + span) & gvars.tspanFlag == 2)
    fprintf(1, '...20%%');
    gvars.tspanFlag = 3;
elseif (t > 0.3*(gvars.tspanStart + span) & gvars.tspanFlag == 3)
    fprintf(1, '...30%%');
    gvars.tspanFlag = 4;
elseif (t > 0.4*(gvars.tspanStart + span) & gvars.tspanFlag == 4)
    fprintf(1, '...40%%');
    gvars.tspanFlag = 5;
elseif (t > 0.5*(gvars.tspanStart + span) & gvars.tspanFlag == 5)
    fprintf(1, '...50%%');
    gvars.tspanFlag = 6;
elseif (t > 0.6*(gvars.tspanStart + span) & gvars.tspanFlag == 6)
    fprintf(1, '...60%%');
    gvars.tspanFlag = 7;
elseif (t > 0.7*(gvars.tspanStart + span) & gvars.tspanFlag == 7)
    fprintf(1, '...70%%');
    gvars.tspanFlag = 8;
elseif (t > 0.8*(gvars.tspanStart + span) & gvars.tspanFlag == 8)
    fprintf(1, '...80%%');
    gvars.tspanFlag = 9;
elseif (t > 0.9*(gvars.tspanStart + span) & gvars.tspanFlag == 9)
    fprintf(1, '...90%%');
    gvars.tspanFlag = 10;
end

% end completion_message
