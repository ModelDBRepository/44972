function v = quickinterp1(x,y,u)
% QUICKINTERP1  Fast, but dangerous, substitute for INTERP1.
% V = QUICKINTERP1(X,Y,U) is a substitute for INTERP1(X,Y,U) that
% assumes without checking that X is equally spaced and increasing,
% that Y is a row or column vector and that U is a scalar.
% If U < X(1) or U > X(END), then V = NaN.
% V = QUICKINTERP1(Y,U) uses X = 1:length(Y).
m = length(y);
if nargin > 2
   u = 1 + (m-1)*(u-x(1))/(x(m)-x(1));
end
if u >= 1 & u < m
   k = floor(u);
   v = y(k) + (u - k)*(y(k+1)-y(k));
elseif u == m
   v = y(m);
else
   v = NaN;
end
