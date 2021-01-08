%%LinearContrastStretching b)
function [cont_img] = myLinearContrastStretching(I)
    [rows, columns, channels]= size(I);
    cont_img = zeros(size(I));
    for i = 1:channels;
        max_I = max(max(I(:,:,i)));
        min_I = min(min(I(:,:,i)));
        t = double(255/(max_I - min_I));
        k = double(ones(rows, columns));
        cont_img(:,:,i) = (I(:,:,i) - k *  min_I ).* (t  )  ;
    end
end
