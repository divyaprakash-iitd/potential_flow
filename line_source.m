function [phi] = line_source(xcor,ycor,a,b,Vdot,L)

    % Convert to cylindrical coordinates
    [r,~] = rtheta(xcor,ycor,a,b);
    
    phi = Vdot/L/2/pi * log(r); 
end