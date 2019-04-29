function [p,m] = det_ins(ins) 
    % Determine Piece
    if ins(1) == 'P'
        p = 1;
    elseif ins(1) == 'N'
        p = 2;
    elseif ins(1) == 'R'
        p = 3;
    elseif ins(1) == 'B'
        p = 4;
    elseif ins(1) == 'Q'
        p = 5;
    else
        p = 6;
    end
    
    % Determine Move type
    if ins(2) == 'm'
        m = 1;  % move
    elseif ins(2) == 'x'
        m = 2;  % kill/capture
    else
        m = 3;  % check
    end