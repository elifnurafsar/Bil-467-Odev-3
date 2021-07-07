function [img, cnt] = connect(I,i,~,counter,a,b,c,d,e,f,g,h,k)
    [~,w]=size(I);
    o=0;
    for m=1:i
        for n=1:w
             if m==8 && n==142
                o=1;
            end
            if m==8 && n==149
                o=1;
            end
            x1=m-1;
            x2=m;
            x3=m+1;
            y1=n-1;
            y2=n;
            y3=n+1;
            if x1<1
                x1=1;
            end
            if x3>i
                x3=i;
            end
            if y1<1
                y1=1; 
            end
            if y3>w
                y3=w;
            end
            if I(x1,y1)~=1 && ( (I(x1,y1)~=0 && I(x1,y1)==a) || (I(x1,y1)~=0 && I(x1,y1)==b) || (I(x1,y1)~=0 && I(x1,y1)==c) || (I(x1,y1)~=0 && I(x1,y1)==d) || (I(x1,y1)~=0 && I(x1,y1)==e) || (I(x1,y1)~=0 && I(x1,y1)==f) || (I(x1,y1)~=0 && I(x1,y1)==g) || (I(x1,y1)~=0 && I(x1,y1)==h) || (I(x1,y1)~=0 && I(x1,y1)==k) )
                I(x1,y1)=counter;
            end
            if I(x1,y2)~=1 && ( (I(x1,y2)~=0 && I(x1,y2)==a) || (I(x1,y2)~=0 && I(x1,y2)==b) || (I(x1,y2)~=0 && I(x1,y2)==c) || (I(x1,y2)~=0 && I(x1,y2)==d) || (I(x1,y2)~=0 && I(x1,y2)==e) || (I(x1,y2)~=0 && I(x1,y2)==f) || (I(x1,y2)~=0 && I(x1,y2)==g) || (I(x1,y2)~=0 && I(x1,y2)==h) || (I(x1,y2)~=0 && I(x1,y2)==k) )
                I(x1,y2)=counter;
            end
            if I(x1,y3)~=1 && ( (I(x1,y3)~=0 && I(x1,y3)==a) || (I(x1,y3)~=0 && I(x1,y3)==b) || (I(x1,y3)~=0 && I(x1,y3)==c) || (I(x1,y3)~=0 && I(x1,y3)==d) || (I(x1,y3)~=0 && I(x1,y3)==e) || (I(x1,y3)~=0 && I(x1,y3)==f) || (I(x1,y3)~=0 && I(x1,y3)==g) || (I(x1,y3)~=0 && I(x1,y3)==h) || (I(x1,y3)~=0 && I(x1,y3)==k) )
                I(x1,y3)=counter;
            end
            if I(x2,y1)~=1 && ( (I(x2,y1)~=0 && I(x2,y1)==a) || (I(x2,y1)~=0 && I(x2,y1)==b) || (I(x2,y1)~=0 && I(x2,y1)==c) || (I(x2,y1)~=0 && I(x2,y1)==d) || (I(x2,y1)~=0 && I(x2,y1)==e) || (I(x2,y1)~=0 && I(x2,y1)==f) || (I(x2,y1)~=0 && I(x2,y1)==g) || (I(x2,y1)~=0 && I(x2,y1)==h) || (I(x2,y1)~=0 && I(x2,y1)==k) )
                I(x2,y1)=counter;
            end
            if I(x2,y2)~=1 && ( (I(x2,y2)~=0 && I(x2,y2)==a) || (I(x2,y2)~=0 && I(x2,y2)==b) || (I(x2,y2)~=0 && I(x2,y2)==c) || (I(x2,y2)~=0 && I(x2,y2)==d) || (I(x2,y2)~=0 && I(x2,y2)==e) || (I(x2,y2)~=0 && I(x2,y2)==f) || (I(x2,y2)~=0 && I(x2,y2)==g) || (I(x2,y2)~=0 && I(x2,y2)==h) || (I(x2,y2)~=0 && I(x2,y2)==k) )
                I(x2,y2)=counter;
            end
            if I(x2,y3)~=1 && ( (I(x2,y3)~=0 && I(x2,y3)==a) || (I(x2,y3)~=0 && I(x2,y3)==b) || (I(x2,y3)~=0 && I(x2,y3)==c) || (I(x2,y3)~=0 && I(x2,y3)==d) || (I(x2,y3)~=0 && I(x2,y3)==e) || (I(x2,y3)~=0 && I(x2,y3)==f) || (I(x2,y3)~=0 && I(x2,y3)==g) || (I(x2,y3)~=0 && I(x2,y3)==h) || (I(x2,y3)~=0 && I(x2,y3)==k) )
                I(x2,y3)=counter;
            end
            if I(x3,y1)~=1 && ( (I(x3,y1)~=0 && I(x3,y1)==a) || (I(x3,y1)~=0 && I(x3,y1)==b) || (I(x3,y1)~=0 && I(x3,y1)==c) || (I(x3,y1)~=0 && I(x3,y1)==d) || (I(x3,y1)~=0 && I(x3,y1)==e) || (I(x3,y1)~=0 && I(x3,y1)==f) || (I(x3,y1)~=0 && I(x3,y1)==g) || (I(x3,y1)~=0 && I(x3,y1)==h) || (I(x3,y1)~=0 && I(x3,y1)==k) )
            	I(x3,y1)=counter;
            end
            if I(x3,y2)~=1 && ( (I(x3,y2)~=0 && I(x3,y2)==a) || (I(x3,y2)~=0 && I(x3,y2)==b) || (I(x3,y2)~=0 && I(x3,y2)==c) || (I(x3,y2)~=0 && I(x3,y2)==d) || (I(x3,y2)~=0 && I(x3,y2)==e) || (I(x3,y2)~=0 && I(x3,y2)==f) || (I(x3,y2)~=0 && I(x3,y2)==g) || (I(x3,y2)~=0 && I(x3,y2)==h) || (I(x3,y2)~=0 && I(x3,y2)==k) )
            	I(x3,y2)=counter;
            end
            if I(x3,y3)~=1 && ( (I(x3,y3)~=0 && I(x3,y3)==a) || (I(x3,y3)~=0 && I(x3,y3)==b) || (I(x3,y3)~=0 && I(x3,y3)==c) || (I(x3,y3)~=0 && I(x3,y3)==d) || (I(x3,y3)~=0 && I(x3,y3)==e) || (I(x3,y3)~=0 && I(x3,y3)==f) || (I(x3,y3)~=0 && I(x3,y3)==g) || (I(x3,y3)~=0 && I(x3,y3)==h) || (I(x3,y3)~=0 && I(x3,y3)==k) )
                I(x3,y3)=counter;
            end
        end
    end
    img=I;
    cnt=counter;
end