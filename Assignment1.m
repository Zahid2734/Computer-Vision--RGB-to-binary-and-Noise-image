%% a Loading Images and Crop a section
tic;
I = imread('board.tif');
I2 = imcrop(I,[200 90 300 180]);
figure(),subplot(1,2,1),imshow(I),title('Original Image')
subplot(1,2,2),imshow(I2),title('Cropped Image')
a1=toc;
%% b)i. Converting the image from RGB to grayscale Using Nested Loops
tic;
input=imread('board.tif');
[x,y,~] = size(input);

for i = 1:x
   for j = 1:y
      output(i,j) = (input(i,j,1) + input(i,j,2) + input(i,j,3))/3;
   end
end
figure(), imshow(output), title('Gray Scale  image using Loop');
b1=toc;



tic;
rgb=imread('board.tif');
gray = (rgb(:,:,1) + rgb(:,:,2) + rgb(:,:,3))/3;
figure(),imshow(gray),title('Gray Scale  image using matrix function');
b2=toc;

%% b)iii. Converting the image from RGB to grayscale Using rgb2gray function
tic;
I = imread('board.tif');
I3 = rgb2gray(I);
figure(),imshow(I3),title('Gray Scale  image using rgb2gray');
b3=toc;

%% c)i. Converting the grayscale image to a binary image using Nested Loops
tic;
my_image = I3;
Mean_gray = mean(I3,'all');
image_thresholded = zeros(size(my_image));
for ii=1:size(my_image,1)
    for jj=1:size(my_image,2)
        pixel=my_image(ii,jj);
          if pixel<Mean_gray
              new_pixel=0;
          elseif pixel>Mean_gray
              new_pixel=1;
          else
              new_pixel = pixel;
          end
          image_thresholded(ii,jj)=new_pixel;
     end
end
figure(),subplot(1,2,1),imshow(my_image),title('original grayscale image')
subplot(1,2,2),imshow(image_thresholded,[]),title('Binary  image using Loop')
c1=toc;

%% c)ii. Converting the grayscale image to a binary image using Matrix
tic;
my_image = I3;
Mean_gray = mean(I3,'all');
image_thresholded(my_image>Mean_gray) = 1;
image_thresholded(my_image<Mean_gray) = 0;

figure(),imshow(image_thresholded,[]),title('Binary  image using Matrix')
c2=toc;

%% c iii. Converting the grayscale image to a binary image using im2bw Function
tic;
I4 = im2bw(I3, graythresh(I3));
figure(),imshow(I4),title('Binary  image using im2bw')
c3=toc;

%% d)i. Smoothing the grayscale image using Loop
a= I3;
[x,y]=size(a)
window=7;
b=a;
[x,y]=size(a);
for i = ceil(window/2):(x-floor(window/2))
    for j = ceil(window/2):(y-floor(window/2))
        b(i,j)= mean2(a(i-floor(window/2):i+floor(window/2),j-floor(window/2):j+floor(window/2)));
    end
end

figure(),imshow(I5),title('smoothing image')

%% d)ii. Smoothing the grayscale image using conv2 function

B = ones(7,7)/7^2; 
C = conv2(I3,B,'same'); 
figure(),imshow(I5),title('smoothing image using conv2 function')

%% extra Credit

cat = imread('cat.jpg');
cat_gray = rgb2gray(cat);
figure()
imshow(cat_gray)
title('Original image')

compression=[3,10,20,40]
error=zeros(1,4)
A=cat_gray;
for i =1:4
    [U1,S1,V1] = svdsketch(double(A),1e-6,'MaxSubspaceDimension',compression(i));
    Anew1 = uint8(U1*S1*V1');
    figure(),imshow(uint8(Anew1))
    error(i)=sum(sum((cat_gray-Anew1).^2));
end

figure(),plot(compression,error),title('Error VS compression')

