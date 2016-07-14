function w = patch(x,y,window_size,image)
% The function returns a sizexsize matrix whose values are that of the image and centered at (x,y) value of the image
% 

image1=image;
image1 =padarray(image1, [ceil(window_size/2) ceil(window_size/2)],0);

x_new_center= x + ceil(window_size/2) ;
y_new_center= y + ceil(window_size/2) ;


x1 = x_new_center - ceil(window_size/2);
y1 = y_new_center - ceil(window_size/2);

% Efffectively, (x1,y1) and (x,y) are the same

w=imcrop(image1,[x1 y1 window_size window_size]);