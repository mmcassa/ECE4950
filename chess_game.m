close all
clear all
clc

%% Initialize 
cam = webcam('HP USB Webcam');

% Scans in QR code
ins_list = qr_scan();

% instruction index
ins_num = 1;

% Color and Shape of a type of piece
% Order :   Red: { Circle ; Square ; Triangle } ;
%           Yel: { Circle ; Square ; Triangle } ;
%           Gre: " " ;
%           Blu: " " ];
% P % 10 = 1 - 6 where:
%           1 = Pawn, 2 = Knight, 3 = Rook, 4 = Bishop, 5 = Queen, 6 = King
% P > 10 => White
% P < 10 => Black
types = [  [ 1 , 2 , 4 ] ;
            [ 5 , 3 , 6 ] ;
            [ 11 , 12 , 14 ] ;
            [ 15 , 13 , 16 ] 
         ];
     
pnames = [  [ 'BP' , 'BN' , 'BB' ] ;
            [ 'BQ' , 'BR' , 'BK' ] ;
            [ 'WP' , 'WN' , 'WB' ] ;
            [ 'WQ' , 'WR' , 'WK' ] 
         ];
%% Master Loop
while (ins_num <= length(ins_list))
    
    % Reset Motor to origin
    
    % Update board
    [board,pieces] = imageproc(cam,types,4,3);
    
    % Update move_list / queue
    move_list = create_queue(ins_list,ins_num,board,pieces);
    
    %% Loop through move queue
    for i= 1 : length(move_list)
        
        % Update GUI
        
        % Move Piece
        
        % Update GUI
        
    end
    
    % Increment to next instruction
    ins_num = move_list(i-1,1) + 1;
end

% Reset Motor

