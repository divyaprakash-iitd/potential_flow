function [psi,phi] = uniform_flow(xcor,ycor,V,alpha)

    phi = V*(xcor.*cos(alpha)+ycor.*sin(alpha));
    psi = V*(ycor.*cos(alpha)-xcor.*sin(alpha));
end