function [phi] = uniform_flow(xcor,ycor,V,alpha)

    phi = V*(xcor.*cos(alpha)+ycor.*sin(alpha));
      
end