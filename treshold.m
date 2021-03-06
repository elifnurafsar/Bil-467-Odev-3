function img = treshold(I, num)
    [x,y]=size(I);
    E = ones(x,y);
    for c = 1:x
        for e = 1:y
            if I(c,e) > num
                E(c,e) = 0;
            end
        end
    end
    img = E;
end