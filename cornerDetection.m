
im1 = imread('im2.jpg');
im1 = rgb2gray(im1);
[w,h,~] = size(im1);

if (w ~= h )
    
    mx = min(w,h);
    im1 = im1(1:mx,1:mx);
    
    
end
im1 = double(im1); % the det doen't work otherwise ( Matlab )
% im1 = rescale(checkerboard);
%% calculating x and y derivative of image


imgX = imdiff(im1,'x');

imgY = imdiff(im1,'y');

imXY = imgX .* imgY;

sqImx = imgX .* imgX;
sqImy = imgY .* imgY;




%% gaussian kernel

kernel = ...
    [
        1 4 7 4 1;
        4 16 26 16 4;
        7 26 41 26 7;
        4 16 26 16 4;
        1 4 7 4 1];
    
kernel = (1/273)*kernel;
    
% convolution with the gaussian mean filter matrix
NsqImx = conv2(sqImx,kernel);
NsqImy = conv2(sqImy,kernel);
NimXY  = conv2(imXY,kernel);


%% calculating R for each point


wnd = 4;

corners = [];

% calcolare per ogni punto R tipo nello script maxIsolation
% e il risultato passarlo a max isolation


corners = RcornerEval(NsqImx,NsqImy,NimXY);



%% maximum isolation

corners = maxIsolation(corners,wnd);


%% corner estimation


im1 = uint8(im1);


corners = rescale(corners);

% treshold for the corner detection
R = 0.55; 

[x,y] = findCorner(corners,R);



imshow(im1)
hold on
scatter(x,y,100,'filled', ...
       'MarkerFaceAlpha',3/8,'MarkerFaceColor',[ 1 0 0]) % red dot points
hold on
plot(detectHarrisFeatures(im1)) % green points


