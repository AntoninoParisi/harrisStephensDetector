% function which calculates the R value for each point
function result = RcornerEval(NsqImx,NsqImy,NimXY)



[rows,cols,~] = size(NimXY);



result = NimXY; % initializing the result matrix, all the elements will be replaced by a R value of that point



for row = 1:rows
    for col = 1:cols
        % C matrix
        C = [ NsqImx(row,col) NimXY(row,col);
           NimXY(row,col) NsqImy(row,col);
        ];
        % calculating the r value for the current point
        result(row,col) = det(C) - 0.04*(trace(C)^2);
    end
end

end