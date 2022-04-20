% Project:
% Task-->to insert a watermark using bitplan slicing.

% read an image
org = imread('a.png');

% read an image to be inserted as watermark
wm = imread('b.jpg');

%converting color to grayscale 
a = rgb2gray(org);
b = rgb2gray(wm);


% Read grayscale image size
[m,n] = size(a);

% converting watermark to m*n
b_resize =  imresize(b, [m,n]);

 
% convert the image class from "uint8" to double
a_d = double(a);
b_d = double(b_resize);

% convert each pixel into binary using matlab command "de2bi"
a_binary = de2bi(a_d);
b_binary = de2bi(b_d);


% using MSB of watermark image as LSB of base image
c1 = a_binary;
c1(:,1) = b_binary(:,8);
r1 = uint8(reshape(bi2de(c1),m,n));

% similarly inserting MSB of watermark image to other plan of base image
c2 = a_binary;
c2(:,2) = b_binary(:,8);
r2 = uint8(reshape(bi2de(c2),m,n));

% 3rd Bit Plane
c3 = a_binary;
c3(:,3) = b_binary(:,8);
r3 = uint8(reshape(bi2de(c3),m,n));

% 4th Bit Plane
c4 = a_binary;
c4(:,4) = b_binary(:,8);
r4 = uint8(reshape(bi2de(c4),m,n));

% 5th Bit Plane
c5 = a_binary;
c5(:,5) = b_binary(:,8);
r5 = uint8(reshape(bi2de(c5),m,n));

% 6th Bit Plane
c6 = a_binary;
c6(:,6) = b_binary(:,8);
r6 = uint8(reshape(bi2de(c6),m,n));

% 7th Bit Plane
c7 = a_binary;
c7(:,7) = b_binary(:,8);
r7 = uint8(reshape(bi2de(c7),m,n));

% 8th Bit Plane
c8 = a_binary;
c8(:,8) = b_binary(:,8);
r8 = uint8(reshape(bi2de(c8),m,n));

% Displaying all the Bit Planes
subplot(241);
imshow(r1);title('LSB Bit Plane');
subplot(242);
imshow(r2);title('2nd Bit Plane');
subplot(243);
imshow(r3);title('3rd Bit Plane');
subplot(244);
imshow(r4);title('4th Bit Plane');
subplot(245);
imshow(r5);title('5th Bit Plane');
subplot(246);
imshow(r6);title('6th Bit Plane');
subplot(247);
imshow(r7);title('7th Bit Plane');
subplot(248);
imshow(r8);title('MSB Bit Plane');

