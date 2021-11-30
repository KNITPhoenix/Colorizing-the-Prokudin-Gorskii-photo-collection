function [off_x_g,off_y_g,off_x_r,off_y_r,result]=im_align2(image_RGB,num)
a=20;
for i=2:3
  thres=-inf;
  idx=-a;
  idj=-a;
  for j=-a:a
    for k=-a:a
      image_RGB1=image_RGB(50:291,50:343,i-1);
      image_RGB2=image_RGB(50:291,50:343,i);
      dimen=size(image_RGB2);
      image_RGB2=[image_RGB2(mod(j,dimen(1))+1:dimen(1),:);image_RGB2(1:mod(j,dimen(1)),:)];
      image_RGB2=[image_RGB2(:,mod(k,dimen(2))+1:dimen(2)),image_RGB2(:,1:mod(k,dimen(2)))];
      mean1=mean(image_RGB1);
      mean2=mean(image_RGB2);
      image_RGB1=image_RGB1-mean1;
      image_RGB2=image_RGB2-mean2;
      Numerator=dot(image_RGB1,image_RGB2);
      Denom=sqrt(dot(image_RGB1.^2,image_RGB2.^2));
      frac=Numerator/Denom;
      if frac>thres
        thres=frac;
        idx=j;
        idj=k;
      end
    end
  end
  image_RGB2=image_RGB(:,:,i);
  dim=size(image_RGB2);
  image_RGB2=[image_RGB2(mod(idx,dim(1))+1:dim(1),:);image_RGB2(1:mod(idx,dim(1)),:)];
  image_RGB2=[image_RGB2(:,mod(idj,dim(2))+1:dim(2)),image_RGB2(:,1:mod(idj,dim(2)))];
  image_RGB(:,:,i)=image_RGB2;

  if i==2
    off_x_g=idx;
    off_y_g=idj;
  elseif i==3
    off_x_r=idx;
    off_y_r=idj;
  end
end

result=image_RGB;
end