%% Determine moveset of a space based on the type of piece moving
function moves = det_moveset(board,type,pos,mv_type)
    % [ Pmoves,Nmoves,Rmoves,Bmoves,Qmoves,Kmoves ]
    % move type structure :
    %       [   Any Color = 0, Black = 1, White = 2 ;
    %           X movement 
    %           Y movement
    %           Cannot go thru other pieces = 0, Can go thru = 1
    %           Special Conditions (0 = none, 1 = only on capture, 2 =
    %           castling
    %       }
    
    pos_moves = [ [