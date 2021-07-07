function img = sobelkenar(A)
    B=rgb2gray(A);
    C=double(B);
    m1=[-1 -2 -1; 0 0 0; 1 2 1];
    m2=transpose(m1);
    Gx=masking(C,m1);
    Gy=masking(C,m2);
    [f,t]=size(C);
    B=zeros(f,t);
    for i=1:f
        for j=1:t
            a=Gx(i,j);
            b=Gy(i,j);
            B(i,j)=sqrt(a.^2+b.^2);
        end
    end
    S=treshold(uint8(B),150);
    img=S;
end

