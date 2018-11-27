% 1D Fourier Transform script - By Ashkan Pakzad on 27 November 2018
%% Generate x grid
xmin = -15;
xmax = 15;
x = xmin:0.1:xmax;

%% Compute function
y = cos(x);
%% Compute Fourier Transform 
kvals = -10:0.01:10;
S = zeros(length(kvals), 1);
i = 0;
for k = kvals(1:end)
    i=i+1;
    S(i) = trapz(x,y.*exp(-1i*2*pi*k*x));
end
%% Plot Function and FT
figure('units','normalized','outerposition',[0 0 1 1])
h1 = subplot(2,1,1);
plot(x,y);
hold on
ax = gca;
title('Function to FT')
ax.XLim = [-inf inf];
ax.YLim = [-inf inf];

h2 = subplot(2,1,2);
plot(kvals,real(S),'Linestyle','-','Color','b')
hold on
plot(kvals,imag(S),'Linestyle','-','Color','r')
ax = gca;
ax.XLim = [-inf inf];
ax.YLim = [-inf inf];
title('FT of Function')
legend('Real','Imag','Location','best')



