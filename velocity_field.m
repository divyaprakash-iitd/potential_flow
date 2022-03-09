function [u,v] = velocity_field(F,h,type)
    [px,py] = gradient(F,h);
    if strcmp(type,"stream")
        u = py;
        v = -px;
    elseif strcmp(type,"potential")
        u = px;
        v = py;
    else
        fprintf('Unknown function type!')
    end
end