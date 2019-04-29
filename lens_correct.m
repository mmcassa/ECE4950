function [distx, disty] = lens_correct(x,y)
    x = x - 4.5;
    distx = x.^2.*.0035122 + .92592.*x - .0818;
    disty = -y.^2.*.006819 + 1.0205.*y + .1646;
    disty = abs(disty-y) +disty;
    difx = abs(distx-x);
    distx = distx + 4.5-difx;
    