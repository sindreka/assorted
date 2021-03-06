function [ I ] = quadrature2D(p1,p2,p3,Nq,g)

    
    A = 1/2*abs(det([p1',p2',p3';1,1,1]));


if Nq ==1
    
    I = A*feval(g,1/3*(p1(1)+p2(1)+p3(1)),1/3*(p1(2)+p2(2)+p3(2))); 
    
    
elseif Nq==3
    
    
    I = A/3*(feval(g,1/2*(p1(1)+p2(1)),1/2*(p1(2)+p2(2)))+...
        feval(g,1/2*(p1(1)+p3(1)),1/2*(p1(2)+p3(2)))+...
        feval(g,1/2*(p3(1)+p2(1)),1/2*(p3(2)+p2(2))));
    
elseif Nq == 4
    
    I1 = -9/16*feval(g,1/3*(p1(1)+p2(1)+p3(1)),1/3*(p1(2)+p2(2)+p3(2)));
    I2 = 25/48*feval(g,3/5*p1(1)+1/5*(p2(1)+p3(1)),3/5*p1(2)+1/5*(p2(2)+p3(2)));
    I3 = 25/48*feval(g,3/5*p2(1)+1/5*(p1(1)+p3(1)),3/5*p2(2)+1/5*(p1(2)+p3(2)));
    I4 = 25/48*feval(g,3/5*p3(1)+1/5*(p2(1)+p1(1)),3/5*p3(2)+1/5*(p2(2)+p1(2)));
    I = A*(I1+I2+I3+I4);
    
else
    disp('Something went wrong!')
end

end

