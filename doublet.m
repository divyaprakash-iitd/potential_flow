function [phi] = doublet(xcor,ycor,rho,s,a,b)
    % Convert to cylindrical coordinates
    [r,theta] = rtheta(xcor,ycor,a,b);
    
    K = rho*s/pi;
    phi = K*cos(theta)./r;
       
end