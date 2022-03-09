clear; clc; close all;

% Description: Plots the potential flows in a domain

N = 100;
xlim = [-1 1];
ylim = [-1 1];
X = linspace(xlim(1),xlim(2),N);
Y = linspace(ylim(1),ylim(2),N);
h = X(2)-X(1);
[x,y] = meshgrid(X,Y);

% Location of a building block
a = 0.5; % x-coordinate
b = 0.5; % y-coordinate
% Line source
Vdot = 1;
L = 1;
phi1 = line_source(x,y,a,b,Vdot,L);


a = -0.5; % x-coordinate
b = 0.5; % y-coordinate
% Line vortex
s = 0.5;
phi2 = line_vortex(x,y,s,a,b);


% Add doublet
s = 1;
rho = 0.2;
a = 0; b = -0.5;
phi3 = doublet(x,y,rho,s,a,b);

% Add uniform flow
alpha = 0;
V = 0;
phi4 = uniform_flow(x,y,V,alpha);


[u1,v1] = gradient(phi1,h);
%[v2,u2] = gradient(phi2,h);
[u2,v2] = gradient(phi2,h);
[u3,v3] = gradient(phi3,h);
[u4,v4] = gradient(phi4,h);

u = u1+u2+u3+u4;
% v = v1-v2+v3+v4;
v = v1+v2+v3+v4;



%u = u2;
%v = v2;
umag = sqrt(u.^2+v.^2);
un = u./umag;
vn = v./umag;

hold on
colormap(jet)
l = 0:0.01:0.7;
%contourf(x,y,umag,l,'edgecolor','none')
% contourf(x,y,umag,'edgecolor','none')
quiver(x,y,un,vn,0.5,'k')
% quiver(x,y,u,v,'k')
axis equal

th = linspace(0,2*pi,100);
xc = a+rho*cos(th);
yc = b+rho*sin(th);


plot(xc,yc,'LineWidth',5)

