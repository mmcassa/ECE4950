function [type,pname] = det_type(x,y)
    pname = 'AA';
    if y == 2
        type = 11;
        pname = 'WP';
        return
    elseif y == 7
        type = 1;
        pname = 'BP';
        return
    elseif y == 1
        type = 10;
        pname(1) = 'W';
    else
        type = 0;
        pname(1) = 'B';
    end
    
    if x == 1 || x == 8
        type = type + 3;
        pname(2) = 'R';
    elseif x == 2 || x == 7
        type = type + 2;
        pname(2) = 'N';
    elseif x == 3 || x == 6
        type = type + 4;
        pname(2) = 'B';
    elseif x == 4
        type = type + 5;
        pname(2) = 'Q';
    else
        type = type + 6;
        pname(2) = 'K';
    end