function [x] = RMSD(input,output)
    [r,c]=size(input);
    N=r*c;
    x=sum((double(input)-double(output)).^2,'all');
    x=sqrt(x/N);
    return
end
