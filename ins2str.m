%% Converts the QR scanner instructions into a user readable instruction
function str = ins2str(ins,color,capture)
    if color == 0 
        color = 2;
    end
    % Constant Strings
    cname = {'White '; 'Black '};
    piecename = {'Pawn ';'Knight ';'Rook ';'Bishop ';'Queen ';'King '};
    start = strcat(char(ins(3)-32),ins(4));
    stop = strcat(char(ins(5)-32),ins(6));
    % Castling moves
    castling = [ [ 5, 1 ] ; [ 8, 1 ] ; [ 7, 1 ] ; [ 6, 1 ] ] ;
    castling(:,:,2) = [ [ 5, 1 ] ; [ 1, 1 ] ; [ 3, 1 ] ; [ 4, 1 ] ] ;
    castling(:,:,3) = [ [ 5, 8 ] ; [ 8, 8 ] ; [ 7, 8 ] ; [ 6, 8 ] ] ;
    castling(:,:,4) = [ [ 5, 8 ] ; [ 1, 8 ] ; [ 3, 8 ] ; [ 4, 8 ] ] ;
    start_pos = [double(start(1))-'A'+1,double(start(2))-'0'];
    stop_pos = [double(stop(1))-'A'+1,double(stop(2))-'0'];
    [p, m] = det_ins(ins);
    str = ' ';
    % Move
    if ins(2) == 'm'
        % Check castling
        if p == 6
            for j = 1 : 4 
                if (start_pos(1) == castling(1,1,j)) && (start_pos(2) == castling(1,2,j)) && (stop_pos(1) == castling(3,1,j)) && (stop_pos(2) == castling(3,2,j))
                    str = strcat(cname(color,:),piecename(6-rem(j,2),:),{'side castling.'});
                    return
                end
            end
        end
        str = strcat({'Move '},cname(color,:),piecename(p,:),{'from '},{start},{' '},{'to '},stop,'.');
        
    % Capture
    elseif ins(2) == 'x'
        str = strcat({'Move '},cname(color,:),piecename(p,:),{'from '},{start},{' '},{'to '},stop,'.',{' Capture!'});
    else
        str = strcat({'Move '},cname(color,:),piecename(p,:),{'from '},{start},{' '},{'to '},stop,'.',{' Check!'});
    end