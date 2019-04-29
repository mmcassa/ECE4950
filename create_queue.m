%% Takes in an instruction list and outputs move list
function move_list = create_queue(ins_list,ins_num,board,pieces)

    % List of moves 
    % [ ins#, physical start, physical stop ]
    move_list = {};
    move_cnt = 1;
    % Array of moved pieces
    moved = zeros(8,8);
    
    % Instruction structure
    % [ piece, move_type, start, stop ]
    piece = 0;
    mv_type = -1; % 1 = m, 2 = x, 3 = s
    start_pos = [];
    stop_pos = [];
    phy_start = [];
    phy_stop = [];
    
    % has rook moved
    rook_m = 0;
    % Castling start & stop conditions
    % castling(:,:,x) = [ King start ; Rook start ; King stop ; Rook stop ] 
    castling = [ [ 5, 1 ] ; [ 8, 1 ] ; [ 7, 1 ] ; [ 6, 1 ] ] ;
    castling(:,:,2) = [ [ 5, 1 ] ; [ 1, 1 ] ; [ 3, 1 ] ; [ 4, 1 ] ] ;
    castling(:,:,3) = [ [ 5, 8 ] ; [ 8, 8 ] ; [ 7, 8 ] ; [ 6, 8 ] ] ;
    castling(:,:,4) = [ [ 5, 8 ] ; [ 1, 8 ] ; [ 3, 8 ] ; [ 4, 8 ] ] ;
    
    % Drop Zone Selection 
    % 1 = front, 2 = right, 3 = top, 4 = left
    %drop = [ [ 9, 1 ] ; [ 9, 2 ] ];
    drop = [4,0];
    
    % sx & sy
    sx = abs(board(2,1,1) - board(1,1,1));
    sy = abs(board(1,2,2) - board(1,1,2));
    
    for i = ins_num : length(ins_list)
        
        % Parse instruction
        ins = char(ins_list(i));
        [piece, mv_type] = det_ins(ins);
        start_pos = [double(ins(3))-'a'+1,double(ins(4))-'0'];
        stop_pos = [double(ins(5))-'a'+1,double(ins(6))-'0'];
        
        
        
        if mv_type == 3 
            if pieces(stop_pos(1),stop_pos(2),1) == 0
                mv_type = 1;
            else
                mv_type = 2;
            end
        end
        % Check if reset necessary, return if reset
        if mv_type == 1
            if moved(start_pos(1),start_pos(2)) ~= 0
                return
            else                
                rook_m = moved(stop_pos(1),stop_pos(2));
                moved(stop_pos(1),stop_pos(2)) = 1;
            end
            % Check if castling
            if piece == 6
                for j = 1 : 4 
                    if (start_pos(1) == castling(1,1,j)) && (start_pos(2) == castling(1,2,j)) && (stop_pos(1) == castling(2,1,j)) && (stop_pos(2) == castling(2,2,j))
                        if (moved(castling(1,1,j),castling(1,2,j)) ~= 0) || (rook_m ~= 0)
                            return
                        else
                            moved(castling(4,1,j),castling(4,2,j)) = 1;
                            moved(castling(3,1,j),castling(3,2,j)) = 1;
                        end
                        stop_pos(1) = castling(3,1,j);
                        stop_pos(2) = castling(3,2,j);
                        pieces(stop_pos(1),stop_pos(2),1) = piece;
                        pieces(start_pos(1),start_pos(2),1) = 0;
                        phy_start = squeeze(pieces(start_pos(1),start_pos(2),2:end));
                        phy_stop = squeeze(board(stop_pos));
                        % Move King
                        move_list{move_cnt} = {i,phy_start,phy_stop};
                        move_cnt = move_cnt +1;
                        start_pos = castling(2,:,j);
                        stop_pos = castling(4,:,j);
                    end
                end
            end
           
        elseif mv_type == 2 % kill
            if (moved(start_pos(1),start_pos(2)) ~= 0) || (moved(stop_pos(1),stop_pos(2)) ~= 0)
                return
            else
                pieces(start_pos(1),start_pos(2),1) = 0;
                moved(stop_pos(1),stop_pos(2)) = 1;
            end
            % Move captured to drop zone
            %t_pos = start_pos;
            %start_pos = stop_pos;
            %if start_pos(1) < 5 
            %    phy_stop = drop;
            %else
            %    phy_stop = drop(2);
            %end
            phy_stop = drop;
            %phy_start = squeeze(pieces(start_pos(1),start_pos(2),2:end));
            phy_start = squeeze(pieces(stop_pos(1),stop_pos(2),2:end));
            move_list{move_cnt} = {i,phy_start,phy_stop};
            move_cnt = move_cnt +1;
            
            % Move piece to new pos
            %stop_pos = start_pos;
            %start_pos = t_pos;  
           
            % end kill          
        end
        % Add move to list
        pieces(start_pos(1),start_pos(2),1) = 0;
        pieces(stop_pos(1),stop_pos(2),1) = piece;
        phy_start = squeeze(pieces(start_pos(1),start_pos(2),2:end));
        phy_stop = squeeze(board(stop_pos));
        move_list{move_cnt} = {i,phy_start,phy_stop};
        move_cnt = move_cnt +1;
    end

    