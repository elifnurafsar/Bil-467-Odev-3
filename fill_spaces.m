function mx = fill_spaces(I)
    [x,y]=size(I);
    res=zeros(x,y);

    for i=1:x
        for j=1:y
            if i>1 && j>1
                a1=I(i-1,j-1);
            else
                a1=2;
            end
            if i>1
                a2=I(i-1,j);
            else
                a2=2;
            end
            if i>1 && j<y
               a3=I(i-1,j+1);
            else
                a3=2;
            end
            if j>1
                b1=I(i,j-1);
            else
                b1=2;
            end
            b2=I(i,j);
            if j<y
                b3=I(i,j+1);
            else
                b3=2;
            end
            if i<x && j>1
               c1=I(i+1,j-1);
            else
                c1=2;
            end
            if i<x
                c2=I(i+1,j);
            else
                c2=2;
            end
            if i<x && j<y
                c3=I(i+1,j+1);
            else 
                c3=2;
            end
           
            %mask_alt
            if(c1==1) && (c2==1) && (c3==1) && (b2==0)
                res(i,j)=1;
            end
            %mask_ust
            if(a1==1) && (a2==1) && (a3==1) && (b2==0)
                res(i,j)=1;
            end
        end
    end
    
    for j=1:y
        for i=1:x
            if i>1 && j>1
                a1=I(i-1,j-1);
            else
                a1=2;
            end
            if i>1
                a2=I(i-1,j);
            else
                a2=2;
            end
            if i>1 && j<y
               a3=I(i-1,j+1);
            else
                a3=2;
            end
            if j>1
                b1=I(i,j-1);
            else
                b1=2;
            end
            b2=I(i,j);
            if j<y
                b3=I(i,j+1);
            else
                b3=2;
            end
            if i<x && j>1
               c1=I(i+1,j-1);
            else
                c1=2;
            end
            if i<x
                c2=I(i+1,j);
            else
                c2=2;
            end
            if i<x && j<y
                c3=I(i+1,j+1);
            else 
                c3=2;
            end
            %mask_sol
            if(a1==1) && (b1==1) && (c1==1) && (b2==0)
                res(i,j)=1;
            end
            %mask_sag
            if(a3==1) && (b3==1) && (c3==1) && (b2==0)
               res(i,j)=1;
            end
        end
    end
    
    for j=1:y
        bool=0;
        for i=1:x
            if I(i,j)==1
                bool=1;
            end
        end
        if bool==0
            res(:,j)=0;
        end
    end
    for i=1:x
        bool=0;
        for j=1:y 
            if I(i,j)==1
                bool=1;
            end
        end
        if bool==0
            res(i,:)=0;
        end
    end
    mx=res;
end