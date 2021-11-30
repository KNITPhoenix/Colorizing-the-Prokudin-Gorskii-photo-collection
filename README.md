# Colorizing-the-Prokudin-Gorskii-photo-collection
Implementing some basic image processing algorithms to detect features to frame alignment using MATLAB

Sergei Mikhailovich Prokudin-Gorskii (1863-1944) was a photographer who, between the years 1909-1915,traveled the Russian empire and took thousands of photos of everything he saw. He used an early color technology that involved recording three exposures of every scene onto a glass plate using a red, green, and blue filter. Back then, there was no way to print such photos, and they had to be displayed using a special projector. Prokudin-Gorskii left Russia in 1918, following the Russian revolution. His glass plate negatives survived and were purchased by the Library of Congress in 1948. Today, a digitized version of the Prokudin-Gorskii collection is available on- line at http://www.loc.gov/exhibits/empire/gorskii.html.
The goal of this project is to digitized Prokudin-Gorskii glass plate images and automatically producing a color image with as few visual artifacts as possible. In order to do this, we will need to extract the three color channel images, place them on top of each other, and align them so that they form a single RGB color image. The repository contains six images (img*.jpg) that we run your algorithm on.

Our program should take a glass plate image as input and produce a single color image as output. The program will divide the image into three equal parts and align the second and the third parts (G and R) to the first (B). For each image, we will also print the (x,y) displacement vector that was used to align the parts. Detailed description is below. 

Example image are shown in Figure below:

![alt text](https://github.com/KNITPhoenix/Colorizing-the-Prokudin-Gorskii-photo-collection/blob/main/image1.jpg?raw=true)

Initially, the program seperates the 3 frames of Blue, Green and Red and align all the three roughly one above the other. The result of the simple is given below:

![alt text](https://github.com/KNITPhoenix/Colorizing-the-Prokudin-Gorskii-photo-collection/blob/main/results/image1-color.jpg?raw=true)

Then im_align1.m will use SSD algorithm to align the frames and produce the following result which is much better:

![alt text](https://github.com/KNITPhoenix/Colorizing-the-Prokudin-Gorskii-photo-collection/blob/main/results/image1-ssd.jpg?raw=true)

Finally, im_align2.m uses NCC to align the frames to produce far better result shown below:

![alt text](https://github.com/KNITPhoenix/Colorizing-the-Prokudin-Gorskii-photo-collection/blob/main/results/image1-ncc.jpg?raw=true)
