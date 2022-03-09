function [psi,phi] = doublet(xcor,ycor,a,b,s,rho)
    % Convert to cylindrical coordinates
    [r,theta] = rtheta(xcor,ycor,a,b);
    
    K = rho*s/pi;
    phi = K*cos(theta)./r;
    psi = -K*sin(theta)./r;
       
end