A=imread('cornerfull1.png');
I = rgb2gray(A);
I = treshold(I, 150);
figure
imshow(I);
mask_sol_alt=[0 1 0; 0 1 1; 0 0 0];
mask_sol_ust=[0 0 0; 0 1 1; 0 1 0];
mask_sag_ust=[0 0 0; 1 1 0; 0 1 0];
mask_sag_alt=[0 1 0; 1 1 0; 0 0 0];
[x,y]=size(I);
res1=zeros(x,y);
for j=2:y-1
    for i=2:x-1
        %we do not search corners in picture's edge pixels
        %left-down
        a=1;
        boolean_sol_alt = 1;
        boolean_sol_ust = 1;
        boolean_sag_ust = 1;
        boolean_sag_alt = 1;
        for m=i-1:i+1
            b=1;
            for n=j-1:j+1
                boo1=(a==1 && b==1) || (a==1 && b==3) || (a==3 && b==3);
                if not(boo1)
                    if mask_sol_alt(a,b) ~= I(m,n)
                       boolean_sol_alt = 0;
                    end
                end
                boo2=(a==1 && b==3) || (a==3 && b==1) || (a==3 && b==3);
                if not(boo2)
                    if mask_sol_ust(a,b) ~= I(m,n)
                       boolean_sol_ust = 0;
                    end
                end
                boo3=(a==1 && b==1) || (a==3 && b==1) || (a==1 && b==3);
                if not(boo3)
                    if mask_sag_alt(a,b) ~= I(m,n)
                       boolean_sag_alt = 0;
                    end
                end
                boo=(a==1 && b==1) || (a==3 && b==1) || (a==3 && b==3);
                if not(boo)
                    if mask_sag_ust(a,b) ~= I(m,n)
                       boolean_sag_ust = 0;
                    end
                end
                b=b+1;
            end
            a=a+1;
        end
        if boolean_sol_alt == 1 || boolean_sol_ust == 1 || boolean_sag_ust == 1 || boolean_sag_alt == 1
            res1(i,j)=1;
        end
    end
end
%dilation for more thick lines
%for i=1:3
%    res1=dilation(res1);
%end
figure
imshow(res1);
