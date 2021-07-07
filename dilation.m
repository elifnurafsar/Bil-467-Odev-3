function img = dilation(I)
    [x,y]=size(I);
    E = zeros(x,y);
    for i = 2:x-1
        for j = 2:y-1
            if(I(i,j)==1)
                E(i,j-1)=1;
                E(i,j)=1;
                E(i-1,j)=1;
                E(i+1,j)=1;
                E(i,j+1)=1;
            end
        end
    end
    img = E;
end