i=imread('C:\Users\大枫神\Desktop\新建文件夹\pic (1).jpg');
r=rgb2gray(i);
i2=im2bw(r,0.22);
i3=im2bw(r,0.78);
imshow(i2);
imshow(i3);