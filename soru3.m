A=imread('connectedcomp.png');
I = rgb2gray(A);
figure
imshow(I);
I = treshold(I, 150);
figure
imshow(I);
[x,y]=size(I);
before=I;
counter=1;
o=0;
for i=1:x
    for j=1:y
        if i==8 && j==142
            o=1;
        end
        if i==8 && j==149
            o=1;
        end
        if I(i,j)==1
            x1=i-1;
            x2=i;
            x3=i+1;
            y1=j-1;
            y2=j;
            y3=j+1;
            if x1<1
                x1=1;
            end
            if x3>x
                x3=x;
            end
            if y1<1
                y1=1; 
            end
            if y3>y
                y3=y;
            end
            a=I(x1,y1);
            b=I(x1,y2);
            c=I(x1,y3);
            d=I(x2,y1);
            e=I(x2,y2);
            f=I(x2,y3);
            g=I(x3,y1);
            h=I(x3,y2);
            k=I(x3,y3);
            %beginning of a shape
            if (a<=1) && (b<=1) && (c<=1) && (d<=1) && (e<=1) && (f<=1) && (g<=1) && (h<=1) && (k<=1)
                counter=counter+1;
                I(x2,y2)=counter;
            else
                %connection of different labels
                max=1;
                if a>max
                    max=a;
                end
                if b>max
                    max=b;
                end
                if c>max
                    max=c;
                end
                if d>max
                    max=d;
                end
                if e>max
                    max=e;
                end
                if f>max
                    max=f;
                end
                if g>max
                    max=g;
                end
                if h>max
                    max=h;
                end
                if (a>1 && a~=max) || (b>1 && b~=max) || (c>1 && c~=max) || (d>1 && d~=max) || (e>1 && e~=max) || (f>1 && f~=max) || (g>1 && g~=max) || (h>1 && h~=max) || (k>1 && k~=max)
                    I(i,j)=max;
                    [I,counter]=connect(I,i,j,max,a,b,c,d,e,f,g,h,k);
                else
                    %not special case, the point has same value with its neighbors 
                    if a>1 || b>1 || c>1 || d>1
                        %eliminate 0's
                        max=I(x1,y1);
                        if I(x1,y2)>max
                            max=I(x1,y2);
                        end
                        if I(x1,y3)>max
                            max=I(x1,y3);
                        end
                        if I(x2,y1)>max
                            max=I(x2,y1);
                        end
                        u1=max;
                        I(x2,y2)=u1;
                    end
                end    
            end         
        end
    end
end

array=zeros(counter,1);
for i=1:counter
    array(i,1)=i;
end
temp=zeros(counter,1);
for p=1:counter
    for i=1:x
        for j=1:y
            boolean=1;
            if I(i,j)==array(p,1)
                temp(p,1)=1;
            end
        end
    end
end

u=0;
for a=1:counter
    if temp(a)==1
        u=u+1;
        num=0;
        for i=1:x
            for j=1:y
                if I(i,j)==a
                    num=num+1;
                end
            end
        end
        fprintf('%i thcomponent includes %i pixels \n', u, num);
    end
end
fprintf('This image has %i connected components\n', u);

error = 0;
for i=1:x
    for j=1:y
        x1=i-1;
            x2=i;
            x3=i+1;
            y1=j-1;
            y2=j;
            y3=j+1;
            if x1<1
                x1=1;
            end
            if x3>x
                x3=x;
            end
            if y1<1
                y1=1; 
            end
            if y3>y
                y3=y;
            end
            a=I(x1,y1);
            b=I(x1,y2);
            c=I(x1,y3);
            d=I(x2,y1);
            e=I(x2,y2);
            f=I(x2,y3);
            g=I(x3,y1);
            h=I(x3,y2);
            k=I(x3,y3);
            if e==1 || (e~=0 && ((a~=0 && e~=a) || (b~=0 && e~=b) || (c~=0 && e~=c) || (d~=0 && e~=d) || (f~=0 && e~=f) || (g~=0 && e~=g) || (h~=0 && e~=h) || (k~=0 && e~=k)))
                error=1;
            end
    end
end

