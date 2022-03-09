clear; clc; close all;

% Description: Plots the potential flows in a domain

xlim = [-1 1];
ylim = [-1 1];

N = 30;
X = linspace(xlim(1),xlim(2),N);
Y = linspace(ylim(1),ylim(2),N);

[x,y] = meshgrid(X,Y);

% Location of a building block
a = 0.5; % x-coordinate
b = 0.5; % y-coordinate
% Line source
Vdot = 1;
L = 1;
[u1,v1] = line_source(x,y,a,b,Vdot,L);


a = -0.5; % x-coordinate
b = 0.5; % y-coordinate
% Line source
Vdot = 1;
L = 1;
[u2,v2] = line_source(x,y,a,b,Vdot,L);

u = u1+u2;
v = v1+v2;

umag = sqrt(u.^2+v.^2);
un = u./umag;
vn = v./umag;

quiver(x,y,un,vn,0.75)

function [u,v] = line_source(x,y,a,b,Vdot,L)
    % Convert to cylindrical coordinates
    h = diff(x,1,2);
    h = h(1);
    r = sqrt((x-a).^2+(y-b).^2);
    theta = atan2((y-b),(x-a));
    
    phi = Vdot/L/2/pi * log(r);
    
    [u,v] = gradient(phi,h);    
end

