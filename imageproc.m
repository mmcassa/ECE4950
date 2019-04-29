% rgb => 0 = red, 1 = yellow, 2 = green, 3 = blue, 4 = all
% shape => 0 = circle, 1 = square, 2 = triangle, 3 = all
function [spaces,pieces,piece_tbl,pnames] = imageproc(cam,piece_tbl,rgb,shape)
    %% Instatiate Variables and Constants
    back_file='b.jpg';
    snap = snapshot(cam);
    fore = figure('visible', 'off');
    imshow(snap);
    saveas(fore,'f.jpg');
    comp_file='f.jpg';
    locx(1) = -1;
    locy(1) = -1;
    
    % Spaces = Center of each square
    spaces = zeros(8,8,2);
    % Pieces = [ type ; x ; y ] 
    pieces= zeros(8,8,3);
%     for i=1:8
%         for j=1:8
%             pieces(i,j,1) = -1; 
%         end
%     end
    %pnames = [  [ 'BP' , 'BN' , 'BB' ] ;
    %        [ 'BQ' , 'BR' , 'BK' ] ;
    %        [ 'WP' , 'WN' , 'WB' ] ;
    %        [ 'WQ' , 'WR' , 'WK' ] 
    %     ];
    % Board limits = [x y; x y; x y; x y]
    
    corners = [ 212 33; %   topleft
              815 30; %   topright
              222 617; %   bottomleft
              801 621 %   bottomright
              ];
    for i = 1: 4 
        corners(i,1) = corners(i,1) - 2;
        corners(i,2) = corners(i,2) + 12;
    end
    % Space width & height
    x_dist = mean([corners(2,1)-corners(1,1);corners(4,1)-corners(3,1)])./8.2;
    y_dist = mean([corners(3,2)-corners(1,2);corners(4,2)-corners(2,2)])./8.2;
    
    bc_off = 5;
    b_dif_x = mean([corners(2,1)-corners(1,1)-bc_off*2;corners(4,1)-corners(3,1)-bc_off*2])./8;
    b_dif_y = mean([corners(3,2)-corners(1,2)-bc_off*2;corners(4,2)-corners(2,2)-bc_off*2])./8;
    % length of board sides in pixels
    top = sqrt((corners(2,1)-corners(1,1)).^2+(corners(2,2)-corners(1,2)).^2);
    left= sqrt((corners(3,1)-corners(1,1)).^2+(corners(3,2)-corners(1,2)).^2);
    bottom = sqrt((corners(3,1)-corners(4,1)).^2+(corners(3,2)-corners(4,2)).^2);
    right = sqrt((corners(4,1)-corners(2,1)).^2+(corners(4,2)-corners(2,2)).^2);
    % Conversion value for mm to pixels
%     mm2pix = mean([top bottom left right])/290;
%     % motor_offset 
%     motorX = -mm2pix.*39.116;
%     motorY = -mm2pix.*74.93;
%     motor_offset = [motorX motorY];

    % Area Ranges = [%circle;%square;%triangle]
    rArea = [   970 1500;
                450 970;
                40 450];
    % HSV Ranges
    hsvR=[  0,18,0;         % Red (low)
            17,60,.167;     % Yellow 
            65,135,.333;    % Green
            140,180,.667;   % Blue
            210,255,0];     % Red (high)
    d = 1;
    %% Read Images
    backImg = imread(back_file);
    foreImg = imread(comp_file);
    % Convert to hsv
    backHsv = rgb2hsv(backImg);
    foreHsv = rgb2hsv(foreImg);
    x = size(backHsv);
    %% Isolate Colors
    % Enhance shades
    for r = 1:x(1)
        for c = 1:x(2)
            % If color saturation is greater than the threshold, enhance it
            if (foreHsv(r,c,2) > 0 && foreHsv(r,c,1) >= hsvR(2,1) && foreHsv(r,c,1) <= hsvR(2,2)) || foreHsv(r,c,2) > .2
                if r > max([corners(1,2) corners(2,2)]) && r < min([corners(3,2) corners(4,2)]) && c > max([corners(1,1) corners(3,1)]) && c < min([corners(2,1) corners(4,1)])
                    foreHsv(r,c,3) = .75; % Set mid level brightness
                    foreHsv(r,c,2) = 1; % fully saturate
                    for i = 1:5
                        if foreHsv(r,c,1) >= (hsvR(i,1)/255) && foreHsv(r,c,1) <= (hsvR(i,2)/255)
                            foreHsv(r,c,1) = hsvR(i,3); % Set stable color
                        end
                    end
                else 
                    foreHsv(r,c,2) = 0;
                    foreHsv(r,c,3) = 1;
                end
            else
                % If not color, unsaturate and over brighten
                foreHsv(r,c,2) = 0;
                foreHsv(r,c,3) = 1;
            end
            % Set the background entirely to white for good comparison
            backHsv(r,c,2) = 0;
            backHsv(r,c,3) = 1;
        end
    end
    % Revert to RGB
    backCon = hsv2rgb(backHsv);
    foreCon = hsv2rgb(foreHsv);

    if rgb ~= 4
        b = rgb+1;
        y = rgb+1;
    else
        b = 1;
        y = 4;
    end
    %% Plot Figure with Edge x's and square o's
%      close all;
%      plotted =figure();
%      imshow(foreImg);
%      hold on  
%      plot(corners(1,1),corners(1,2),'x','MarkerEdgeColor','black');
%     plot(corners(2,1),corners(2,2),'x','MarkerEdgeColor','black');
%     plot(corners(3,1),corners(3,2),'x','MarkerEdgeColor','black');
%     plot(corners(4,1),corners(4,2),'x','MarkerEdgeColor','black');
    
    for i=0 : 7
        for j = 0: 7
            spaces(8-i,j+1,1) = corners(1,1)+b_dif_x*i+b_dif_x/2+bc_off;
            spaces(8-i,j+1,2) = corners(1,2)+b_dif_y*j+b_dif_y/2+bc_off;
            [spaces(8-i,j+1,1),spaces(8-i,j+1,2)] = lens_correct(spaces(8-i,j+1,1),spaces(8-i,j+1,2));
            %plot(spaces(8-i,j+1,1),spaces(8-i,j+1,2),'o','MarkerEdgeColor','black');
        end
    end
    %% Section ?
    for col = b:y
        % Color String
        if col == 1
            mCol = 'red';
        elseif col == 2
            mCol = 'yellow';
        elseif col == 3
            mCol = 'green';
        elseif col == 4
            mCol = 'blue';
        end
        backCon = hsv2rgb(backHsv);
        foreCon = hsv2rgb(foreHsv);
        x = size(foreCon);
        for r = 1:x(1)
            for c = 1:x(2)
                if (col == 1 && (foreCon(r,c,1) < .6 || foreCon(r,c,2) > .3 || foreCon(r,c,3) > .3)) || (col == 2 && (foreCon(r,c,1) < .7 || foreCon(r,c,2) < .7 || foreCon(r,c,3) > .1)) || (col == 3 && (foreCon(r,c,1) > .35 || foreCon(r,c,2) < .6 || foreCon(r,c,3) > foreCon(r,c,2)+5)) || (col == 4 && (foreCon(r,c,1) > .35 || foreCon(r,c,2) > foreCon(r,c,3) || foreCon(r,c,3) < .7))
                    foreCon(r,c,2) = 1;
                    foreCon(r,c,3) = 1;
                    foreCon(r,c,1) = 1;        
                end

            end
        end
        %% Create Difference
        %diffCon = backCon - foreCon;
        imgDiff = im2bw((backCon - foreCon), 0.2);
        %% Erode and Dilate
        if shape ~= 3
            a = shape+1;
            z = shape+1;
        else
            a = 1;
            z = 3;
        end      

        se = strel('disk', 2);
        se2 = strel('disk', 5);
        se3 = strel('disk', 4);
        dilated =  imerode(imgDiff,se3);
        dilated = imerode(dilated,se);
        dilated =  imdilate(dilated,se2);

        %% Shape determination
        props = regionprops(dilated,'Area','BoundingBox','Centroid','MajorAxisLength','MinorAxisLength');
        %figure(plotted);
        for i = 1:numel(props)
            for s = a:z
                if s == 1
                    mSha = 'o';
                elseif s == 2
                    mSha = '-s';
                elseif s == 3
                    mSha = 'x'; 
                end
                if props(i).Area > rArea(s,1) && props(i).Area < rArea(s,2)
                    % Determine location relative to physical board
                    locx(d)=(props(i).Centroid(1)-corners(1,1))./x_dist+.5;%-corners(2)+motor_offset(1);
                    locy(d)=(corners(3,2)-props(i).Centroid(2))./y_dist+.5;%corners(3)-(props(i).Centroid(2))+motor_offset(2);
                    %[locx(d) locy(d)] = lens_correct(locx(d), locy(d));
                    % Determine square that piece is in
                    pos = det_pos([props(i).Centroid(1),props(i).Centroid(2)],spaces,b_dif_x,b_dif_y);
                    % Store piece type and locaiton for return
                    if piece_tbl(col,s) == 0
                        [piece_tbl(col,s),pn_t] = det_type(pos(1),pos(2));
                        pnames(col,(s-1)*2+1) = pn_t(1);
                        pnames(col,s*2) = pn_t(2);
                    end
                    pieces(pos(1),pos(2),:) = [piece_tbl(col,s) , locx(d) , locy(d) ];
                    % Plot the piece
                    plot(props(i).Centroid(1),props(i).Centroid(2),mSha,'MarkerEdgeColor',mCol);
                    %prt_state = strcat(pnames(col,s*2-1),pnames(col,s*2),'-',num2str(pos(1)),',',num2str(pos(2)));
                    %prt_state = strcat(num2str(locx(d)),',',num2str(locy(d)));
                    %text(props(i).Centroid(1)-8,props(i).Centroid(2)+8,num2str(props(i).Area()),'FontSize',5);
                    %text(props(i).Centroid(1)-8,props(i).Centroid(2)+16,num2str(locx(d)),'FontSize',5);
                    %text(props(i).Centroid(1)-8,props(i).Centroid(2)+30,num2str(locy(d)),'FontSize',5);
                    d = d +1;
                end
            end
        end
    end
    
    % fix board coordinates
    for i=0 : 7
    for j = 0: 7
        spaces(8-i,j+1,1) = i+1;%(((corners(1,1)+b_dif_x*i+b_dif_x/2+bc_off)-250.3399)/72.625)+1;
        spaces(8-i,j+1,2) = j+1;%(((corners(1,2)+b_dif_y*j+b_dif_y/2+bc_off)-85.1214)/72.1875)+1;
        end
    end
    hold off
    if locx(1) ~= -1
        l = [locx;locy];
    else
        l = [[-1]];
    end
    





