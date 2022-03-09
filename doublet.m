function [x,y,u,v] = doublet(xlim,ylim,rho,s,a,b)
    N = 50;
    X = linspace(xlim(1),xlim(2),N);
    Y = linspace(ylim(1),ylim(2),N);
    
    [x,y] = meshgrid(X,Y);

    % Convert to cylindrical coordinates
    h = X(2)-X(1);
    r = sqrt((x-a).^2+(y-b).^2);
    theta = atan2((y-b),(x-a));
    
    K = rho*s/pi;
    phi = K*cos(theta)./r;
    
    [u,v] = gradient(phi,h);    
end