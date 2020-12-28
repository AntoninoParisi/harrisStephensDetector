

% simple rescaling values between [0,1]
function result = rescale(mtx)


[rows,cols,~] = size(mtx);

mx = max(mtx(:));
mn = min(mtx(:));

m = mx-mn;

for row = 1:rows
    for col = 1:cols
        
        result(row,col) = (mtx(row,col)-mn)/m;
        
    end
end


end