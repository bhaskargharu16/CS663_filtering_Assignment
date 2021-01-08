
function [out,mask] = myBilateralFiltering(inp,sigma_spacial,sigma_intensity,w)

  [m,n] = size(inp);
  % w = m;
  [X,Y] = meshgrid(-w:w,-w:w);
  G = exp(-(X.^2+Y.^2)/(2*sigma_spacial^2));
    
  % ff = waitbar(0,"bilateral filter");
  
  no = 0;
  mask = G;  
  out = zeros(m,n);
  for i = 1:m
     for j = 1:n


           l = max(i-w,1);
           r = min(i+w,m);
           t = max(j-w,1);
           b = min(j+w,n);
           I = inp(l:r,t:b);


           H = exp(-(I-inp(i,j)).^2/(2*sigma_intensity^2));


           F = H.*G((l:r)-i+w+1,(t:b)-j+w+1);
           out(i,j) = sum(F(:).*I(:))/sum(F(:));
           no = no+1;
          % waitbar(no/total);
     end

  end
end
