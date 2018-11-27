% Boxcar/Rect function - By Ashkan Pakzad on 27 November 2018
function y = Boxcar(centre, width,x)
% Input centre value, with width and the defined x-grid.

y = zeros(size(x));
y(x < centre+width/2 & x > centre-width/2)=1;