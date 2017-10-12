% Inclass11

% You can find a multilayered .tif file with some data on stem cells here:
% https://www.dropbox.com/s/83vjkkj3np4ehu3/011917-wntDose-esi017-RI_f0016.tif?dl=0

% 1. Find out (without reading  the entire file) -  (a) the size of the image in
% x and y, (b) the number of z-slices, (c) the number of time points, and (d) the number of
% channels.

img1 = '011917-wntDose-esi017-RI_f0016.tif';
reader = bfGetReader(img1);
%a
[reader.getSizeX, reader.getSizeY]
%b 
reader.getSizeZ
%c
reader.getSizeT
%d 
reader.getSizeC


% 2. Write code which reads in all the channels from the 30th time point
% and displays them as a multicolor image.
chan = 1
time = 30
zplane = 1
iplane = reader.getIndex(zplane-1,chan-1,time-1)+1;
img1 = bfGetPlane(reader,iplane);
figure; imshow(img1,[600,1100])

chan = 2; 
iplane = reader.getIndex(zplane-1,chan-1,time-1)+1;
img2 = bfGetPlane(reader,iplane);
figure; imshow(img2,[50,1000])

img2show = cat(3,imadjust(img1),imadjust(img2),zeros(size(img1)));
figure; imshow(img2show)



% 3. Use the images from part (2). In one of the channels, the membrane is
% prominently marked. Determine the best threshold and make a binary
% mask which marks the membranes and displays this mask. 
immsk = img1 >850;
imshow(immsk)

% 4. Run and display both an erosion and a dilation on your mask from part
% (3) with a structuring element which is a disk of radius 3. Explain the
% results.
figure;
imshow(imerode(immsk,strel('disk',3)));
figure;
imshow(imdilate(immsk,strel('disk',3)));
