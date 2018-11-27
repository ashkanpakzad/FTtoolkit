% 2D Fourier Transform script - By Ashkan Pakzad on 27 November 2018
%% Generate axes
% range of x axis
minx = -4;
maxx = 4;
% range of y axis
miny = -4;
maxy = 4;
% Generate axes
xvals = minx:0.1:maxx;
yvals = miny:0.1:maxy;
% Generate matrix grid of x and y.
[Xgrid,Ygrid]=meshgrid(xvals,yvals); 
% The overlay of these two grids gives the x and y coordinates of that point.
%% Compute function
Z = sinc(Xgrid) .* sinc(Ygrid); % Compute each point of the two grids.
%% Compute Fourier Transform 
kxvals = -5:0.1:5; % k space axis range for x & y
kyvals = -5:0.1:5;
%[kXgrid,kYgrid]=meshgrid(kxvals,kyvals);
S = zeros(length(kxvals), length(kyvals)); % Generate k space axes
i = 0;
j = 0;
for kx = kxvals(1:end)
    i=i+1;
    j=0;
    for ky = kyvals(1:end)
        j=j+1;
        exp_func = (exp(-1i*2*pi*(Xgrid*kx+Ygrid*ky)));
        S(i,j) = trapz(yvals,trapz(xvals,Z.*exp_func,2));
    end
end
%% Plot Function and FT
figure('units','normalized','outerposition',[0 0 1 1])
h1 = subplot(1,2,1);
imagesc(xvals,yvals,Z)
hold on
ax = gca;
title('Function to FT')
xlabel('')
ax.XLim = [-inf inf];
ax.YLim = [-inf inf];

h2 = subplot(1,2,2);
imagesc(kxvals,kyvals,real(S))
ax = gca;
ax.XLim = [-inf inf];
ax.YLim = [-inf inf];
title('FT of Function')


