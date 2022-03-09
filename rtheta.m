function [r,theta] = rtheta(xcor,ycor,a,b)
    r = sqrt((xcor-a).^2+(ycor-b).^2);
    theta = atan2((ycor-b),(xcor-a));
end