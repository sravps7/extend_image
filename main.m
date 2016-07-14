function m = main(image,window_size,no_of_layers)
% The function extends the texture in the image using the specified window_size


image_constructed=image;


[height,width,dim]=size(image_constructed);
reference_image=double(ones(height,width));

%Writing code for adding only one layer in one direction

for j= 1 : no_of_layers 

	image_constructed=padarray(image_constructed,[1 0],0,'post');
	reference_image=padarray(reference_image,[1 0],0,'post');
	

	for i = 1 : width
		center_x=0;
		center_y=0;
		minimum_distance = 100000.0 ; 
		patch_constructed = patch(i,height+j,window_size,image_constructed); % this patch is the one centered at the 'to be constructed' pixel
		patch_reference = patch(i,height+j, window_size,reference_image); % this patch contains ones where there are known values
		for row = 1 : height
	
			for col = 1 : width
				image_patch=patch(col,row,window_size,image);
				% disp( [ row col size(image_patch)  size(image) ] )
				% disp([i row col size(image_patch) size(patch_reference)])
				patch_actual = double(image_patch).*double(patch_reference); % this calculates only the required values
				current_distance = distance(patch_actual,patch_constructed,window_size+1);

				if (current_distance<=minimum_distance)

					center_x=row;
					center_y=col;
					minimum_distance=current_distance;

				end	

			end
	
		end

		image_constructed(height+j,i) = image( center_x , center_y );
		reference_image(height+j,i) =1;
		disp([i j])
	end

end
m=image_constructed;