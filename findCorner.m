
% the function which decides the points of interest 
function [x,y] = findCorner(img,R)



[w,h,c] = size(img);

index = 1;
% cartesian coords to identify the point
x = ones(1);
y = ones(1);


for row = 1:w
    for col = 1:h
        if(img(row,col)>R) % i take the point only if R is very big
            x(index) = col;
            y(index) = row;
            index = index +1;
        end
    end
end
    



end