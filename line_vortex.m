function [phi] = line_vortex(xcor,ycor,s,a,b)
    % Convert to cylindrical coordinates
    [r,theta] = rtheta(xcor,ycor,a,b)

    %phi = s/2/pi*theta;
    phi = -s/2/pi*log(r);
end