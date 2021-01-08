%9*9 patches
%~25*25 window

%spatial,main
%barbara: 0.8, 9: 5.0->3.0
%grass: 1,15: 12->7.4
%honeycomb: 1,15: 12.7->7.4
function [im_filtered] = myPatchBasedFiltering(im_noise,spatial_sd,main_sd)
    [r,c]=size(im_noise);
    im_padded=(-100)*ones(r+8,c+8);
    im_padded(5:5+r-1,5:5+c-1)=im_noise;
    im_filtered=zeros(r,c);
    counter=0;
    
    for i=5:r+4
        for j=5:c+4
%             if rem(counter,1000)==0 
%                 disp((counter/(r*c))*100);
%             end
            up=max(j-12,min(9,j));
            down=min(j+12,max(r,j));
            left=max(i-12,min(9,i));
            right=min(i+12,max(c,i));
            
            
            window=im_padded(left:right,up:down);
%             disp(size(window));
            
            big_window=im_padded(left-4:right+4,up-4:down+4);
%             disp(size(big_window));
            
            patch_col_matrix=im2col(big_window,[9,9]);
            current_col_patch=im_padded(i-4:i+4,j-4:j+4);
            
            spatial_filter=fspecial('gaussian',9, spatial_sd);
            sum_spatial=sum(spatial_filter(current_col_patch~=-100),'all');
            spatial_filter=spatial_filter(:);
            
            current_col_patch=current_col_patch(:);
            
            squared_distances=patch_col_matrix-repmat(current_col_patch,1,size(patch_col_matrix,2));
            squared_distances=squared_distances.^2;
%             disp(size(squared_distances));
            
            squared_distances=squared_distances.*repmat(spatial_filter,1,size(squared_distances,2));
            squared_distances=squared_distances(current_col_patch~=-100,:);
%             disp(size(squared_distances));
            
            squared_distances=sum(squared_distances,1);
            squared_distances=squared_distances/sum_spatial;
            
            squared_distances=(-1)*squared_distances/(main_sd^2);
            squared_distances=exp(1).^(squared_distances);
            
            squared_distances=squared_distances/sum(squared_distances);
            squared_distances=transpose(squared_distances);
            
            squared_distances=squared_distances.*window(:);
            
            im_filtered(i-4,j-4)=sum(squared_distances);
            counter=counter+1;
        end
    end   
    return;
end

