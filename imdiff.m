% image differenciation for the X and Y axe 

function image = imdiff(source,axis)

    [w,h,c] = size(source);
    
    if(c > 1)
        source = rgb2gray(source);
    end
    image = [];
    if(strcmp(axis,'x')) % X axe
        for row = 1:w
            for col = 2:h
                image(row,col-1) = source(row,col) - source(row,col-1);
            end
            image(row,end) = source(row,end);
        end
                
        image(:,end+1) = 0;

    else % Y axe
       for col = 1:h
            for row = 2:w
                image(row-1,col) = source(row,col) - source(row-1,col);
            end
            image(end,col) = source(end,col);
       end
        image(end+1,:) = 0;
        
    end
    % the current image isn't in 8-bit representation, we tranlat it before
    % ending and return it 
    image = uint8(image);

end