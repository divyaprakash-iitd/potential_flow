function [psi,phi] = line_vortex(xcor,ycor,a,b,s)
    % Convert to cylindrical coordinates
    [r,theta] = rtheta(xcor,ycor,a,b);

    phi = s/2/pi*theta;
    psi = -s/2/pi*log(r);
end