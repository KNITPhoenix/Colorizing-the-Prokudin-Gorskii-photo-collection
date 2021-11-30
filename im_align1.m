function [off_x_g,off_y_g,off_x_r,off_y_r,result]=im_align1(im3,im2,im1)
	
	[n,m]=size(im1);
	off=25;

	im1_changed=im1(off:n-off,off:m-off);    %trimming the borders
	[ox,oy]=size(im1_changed);
	sg=255*ox*oy;
	sr=255*ox*oy;

	for i=-15:15
		for j=-15:15
			im3_changed=im3(off+i:n-off+i,off+j:m-off+j);
			im2_changed=im2(off+i:n-off+i,off+j:m-off+j);
			temp_r=sum(sum((im1_changed-im3_changed).^2));
			temp_g=sum(sum((im1_changed-im2_changed).^2));

			if temp_r <= sr
				sr=temp_r;
				off_x_r=i;
				off_y_r=j;
			endif

			if temp_g <= sg
				sg=temp_g;
				off_x_g=i;
				off_y_g=j;
			endif
		endfor
	endfor
	im2_changed=im2(off+off_x_g:n-off+off_x_g,off+off_y_g:m-off+off_y_g);
	im3_changed=im3(off+off_x_r:n-off+off_x_r,off+off_y_r:m-off+off_y_r);
	result=cat(3,im3_changed,im2_changed,im1_changed);

endfunction