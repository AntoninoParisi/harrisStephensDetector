

% finding the local maximum, hiding the other values

function image = maxIsolation(img,window)


[rows,cols,depth] = size(img);
w = window/2;
middle = window*window*0.5;

% is required to improve the sliding window
for row = 1+w:rows-w-1
    for col = 1+w:cols-w-1
        
        tmp = img(row-w:row+w,col-w:col+w);
        
        
            if (tmp(middle) ~= max(tmp(:))) % is the maximum of the local window
                image(row,col)=0; % it isn't
            else
                image(row,col) = img(row,col);  % yes, i take it
            end
      
    end
end



end