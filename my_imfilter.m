function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

final_im = zeros(size(image, 1), size(image, 2));

f_size = [int32((size(filter, 1) - 1) / 2), int32((size(filter, 2) - 1) / 2)];
image = padarray(image, [f_size f_size], 'replicate', 'both');
im_size = [size(image, 1), size(image, 2)];

% iterate through locations in matrix
for i= f_size(1) + 1:im_size(1) - f_size(1)
  for j= f_size(2) + 1:im_size(2) - f_size(2)
    % COPY 1
    c = 1;
    % cut out matrix from image equivalent to filter size
    im_chunk = image(i - f_size(1):i + f_size(1), j - f_size(2):j + f_size(2), c);
    % get current pixel value
    filtered = im_chunk .* filter;
    pix_val = sum(sum(filtered));
    % set location in final image to pixel value
    final_im(i, j, c) = pix_val;

    % COPY 2
    c = 2;
    % cut out matrix from image equivalent to filter size
    im_chunk = image(i - f_size(1):i + f_size(1), j - f_size(2):j + f_size(2), c);
    % get current pixel value
    filtered = im_chunk .* filter;
    pix_val = sum(sum(filtered));
    % set location in final image to pixel value
    final_im(i, j, c) = pix_val;

    % COPY 3
    c = 3;
    % cut out matrix from image equivalent to filter size
    im_chunk = image(i - f_size(1):i + f_size(1), j - f_size(2):j + f_size(2), c);
    % get current pixel value
    filtered = im_chunk .* filter;
    pix_val = sum(sum(filtered));
    % set location in final image to pixel value
    final_im(i, j, c) = pix_val;
  endfor
endfor

% set idx1/idx2
if f_size(1) == 0
  idx1 = 1;
else
  idx1 = f_size(1);
end
if f_size(2) == 0
  idx2 = 1;
else
  idx2 = f_size(2);
end
% store final image to output variable
output = final_im
% output = final_im(idx1:im_size(1)-idx1, idx2:im_size(2)-idx2) %, 1:size(final_im, 3));
