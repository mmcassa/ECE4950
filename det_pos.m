%% Determine the i,j (A6, B4, E2, ... etc) of a given chess piece
%   loc = x & y of piece
%   board = the board itself (8x8 array of [x;y] square centers)
%   sx = the width of a square
%   sy = the height of a square
function pos = det_pos(loc,board,sx,sy) 
    for i= 1 : 8
        for j = 1 : 8
            if (abs(board(i,j,1)-loc(1)) <= sx/2 && abs(board(i,j,2)-loc(2)) <= sy/2)
                pos = [i,j];
                return
            end
        end
    end
    pos = [i,j];
    