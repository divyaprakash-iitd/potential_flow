clear; clc; close all;

% Description: Plots the potential flows in a domain

% Create a grid
N       = 40;
xlim    = [-1 1];
ylim    = [-1 1];
X       = linspace(xlim(1),xlim(2),N);
Y       = linspace(ylim(1),ylim(2),N);
h       = X(2)-X(1);
[x,y]   = meshgrid(X,Y);

% Strength
s = 1;

%% Line Source
a = -0.5; % x-coordinate
b = 0.5; % y-coordinate
[~,phi] = line_source(x,y,a,b,s);
[u1,v1] = velocity_field(phi,h,'potential');

%% Uniform Flow
alpha = 0;
[psi,~] = uniform_flow(x,y,s,alpha);
[u2,v2] = velocity_field(psi,h,'stream');

%% Line vortex
a = 0.5; % x-coordinate
b = 0.5; % y-coordinate
[psi,~] = line_vortex(x,y,a,b,s);
[u3,v3] = velocity_field(psi,h,'stream');

%% Doublet
a = 0; % x-coordinate
b = -0.5; % y-coordinate
r = 0.5;
[psi,~] = doublet(x,y,a,b,s,r);
[u4,v4] = velocity_field(psi,h,'stream');

%% Superposition
u = u1+u2+u3+u4;
v = v1+v2+v3+v4;

umag = sqrt(u.^2+v.^2);
un = u./umag;
vn = v./umag;

quiver(x,y,un,vn,0.75,'r')
axis equal

