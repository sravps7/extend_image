function d = distance(image1,image2,window_size)
% Returns the perceptual distance between image1 and image2
%




gaussian_kernel = zeros(window_size,window_size);
x0=ceil(window_size/2);
y0=ceil(window_size/2);

%for col = 1 : window_size
%  for row = 1 : window_size
%    gaussian_kernel(row, col) = exp(-((col-x0)^2+(row-y0)^2)/((window_size)));
%  end
%end

vector=1:1:window_size;
gauss=normpdf(vector,ceil(window_size/2),ceil(window_size/4));
gauss_2d=sqrt(gauss'*gauss);


difference_image= 1/(window_size)^2*(         ( double(image1) - double(image2) ).^2    ).*gauss_2d;
d = sum(difference_image(:));
