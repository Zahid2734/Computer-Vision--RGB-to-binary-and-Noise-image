# Computer-Vision--RGB-to-binary-and-Noise-image
The objective of this problem is to introduce basic image processing operations in MATLAB. Load the
accompanying \board.tif" image in MATLAB.

(a) (5 points) Extract the rectangular block of the image between (200; 90) and (300; 180) corresponding
to the crystal in the image. Display this block in a separate gure.
Solve (b) and (c) in the following three dierent ways: (i) using nested for loops and accessing each pixel
individually, (ii) using MATLAB matrix operations, (iii) using built-in image processing functions rgb2gray
and im2bw. Use the MATLAB proler to compare the running times.

(b) (10 points) Convert the image from RGB to grayscale. For each pixel, take the average of the R, G,
and B values as the grayscale value.

(c) (10 points) Convert the grayscale image to a binary image using the mean grayscale value as the
threshold. Display both the grayscale and binary images in the same window.

(d) (25 points) Smooth the grayscale image created above using a 77 averaging lter. This means that
for each pixel at location (i; j), place a 7  7 window centered at (i; j) and replace the value of the pixel
with the average of the values of the pixels in the window. Decide how you will handle pixels close to the
image boundary. Solve this problem in the following two dierent ways: (i) using for loops, (ii) using the
MATLAB function conv2. Display the smoothed images.
