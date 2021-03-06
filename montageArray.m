function montageArray(images,cmap)
% MONTAGEARRAY  Simple wrapper for montage that facilitates function call
% when the input is a MxNxK array
%
%   MONTAGEARRAY(images)  reshapes images from a MxNxK to a MxNx1xK array
%   and then calls MATLAB montage function.
% 
%   MONTAGEARRAY(images,cmap)  plots images using the desired colormap
%   (cmap must be a valid colormap).
%
%   Stavros Tsogkas, <stavros.tsogkas@centralesupelec.fr>
%   Last update: April 2016

sz = size(images);
if ndims(images) == 3
    images = reshape(images, sz(1),sz(2),1,sz(3));
elseif ndims(images) > 4
    error('The input array must be either 3-D or 4-D')
end
assert(size(images,3) == 1 || size(images,3) == 3, ...
    'Images should be either grayscale or truecolor')
if nargin > 1
    montage(images, cmap)
else
    montage(images)
end
