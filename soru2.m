A=imread('ucak.png');
I = rgb2gray(A);
I = treshold(I, 150);
I=imresize(I,0.5);
[x,y]=size(I);
figure
imshow(I);

A= bwconvhull(I);
figure
imshow(A);

copy=I;
while 1
    a=fill_spaces(I);
    I=I|a;
    if (copy-I)==0
        break
    end
    copy=I;
end
figure
imshow(I);