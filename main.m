filesfolder=fullfile('/home/cse468-568-student/Desktop/lab3/','*.jpg');    %folder containing images
files=dir(filesfolder);

for i=1:length(files)
    fullname = fullfile(files(i).folder, files(i).name);    %containing full path of the images

    %simply aligning RGB planes on top of each other
    k=imread(fullname);
    %imshow(k)
    [n,m]=size(k);
	j=floor(n/3);
	im1=k(1:j+1,:);     %blue
	%imshow(im1)
	im2=k(j:2*j,:);     %green
	%imshow(im2);
	im3=k(2*j:n-1,:);   %red
	%imshow(im3);

	image_RGB = cat(3,im3,im2,im1);
	imwrite(image_RGB,strcat('image',int2str(i),'-color.jpg'));
	%imshow(image_RGB)
	%pause(2)

	%aligning images using SSD
	[off_x_g,off_y_g,off_x_r,off_y_r,result]=im_align1(im3,im2,im1);
	fprintf(strcat('B and G channel offset after SSD of image ',int2str(i),':','[',int2str(off_x_g),',',int2str(off_y_g),']'));
	fprintf('\n');
	fprintf(strcat('B and R channel offset after SSD of image ',int2str(i),':','[',int2str(off_x_r),',',int2str(off_y_r),']'));
	fprintf('\n');
	imwrite(result,strcat('image',int2str(i),'-ssd.jpg'));

	%aligning images using NCC
	[off_x_g,off_y_g,off_x_r,off_y_r,result]=im_align2(image_RGB,i);
	fprintf(strcat('B and G channel offset after NCC of image ',int2str(i),':','[',int2str(off_x_g),',',int2str(off_y_g),']'));
	fprintf('\n');
	fprintf(strcat('B and R channel offset after NCC of image ',int2str(i),':','[',int2str(off_x_r),',',int2str(off_y_r),']'));
	fprintf('\n');
	imwrite(result,strcat('image',int2str(i),'-ncc.jpg'));
end