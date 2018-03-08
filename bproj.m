function [bpimage] = bproj(fprojs,res,num_angles,samp_space,samp_pos,angles,cx,cy)

% Back-projection
%
% Inputs
%
% fprojs = filtered projections
% samp_space = Spacing of samples in the filtered projection
% samp_pos = sample positions in the filtered projection
% num_angles = Number of projections over 180 degrees
% res = Resolution of resulting reconstructed image
% cx = x coordinate of assumed center of the original image
% cy = y coordinate of assumed center of the original image
%
% Outputs
%
% bpimage = reconstructed image
%
% Developed by	Srikrishna Bhashyam
%               Rice University
% 		April 17, 1999
%

lsamp = length(samp_pos); 
projtemp = [fprojs zeros(num_angles,2)];
projtemp = reshape(projtemp',1,num_angles*(lsamp+2));
postmp = [samp_pos 0];

ind = 0+res/2:res:1;
bpimage = zeros(length(ind),length(ind));
ind_x = 0;
for x = 0+res/2:res:1
ind_x = ind_x + 1;
if (ind_x/10 - round(ind_x/10) == 0)
  ind_x;
end
ind_y = 0;
for y = 0+res/2:res:1
ind_y = ind_y + 1;
% Reconstruct one pixel - START

%for i = 1:num_angles
% Calculate back-projection value for each angle
% 1. Get position of sample needed from projection angle and pixel position

pos = -(x-cx)*sin(angles) + (y-cy)*cos(angles);
pos = round(pos*100000)/100000;

% 2. Interpolate the filtered projection to obtain the sample

xtmp = floor((pos - samp_pos(1))/samp_space) + 1;
x1 = (abs(pos) <= samp_pos(lsamp));
xtmp = xtmp.*x1 + (1-x1)*(lsamp+1);
xtmp2 = xtmp + [0:num_angles-1]*(lsamp + 2); 

samp = projtemp(xtmp2)+((pos-postmp(xtmp)).*(projtemp(xtmp2+1)-projtemp(xtmp2)))/samp_space;

% 3. Add this back-projection value multiplied by the angle spacing

bpimage(ind_x,ind_y) = sum(samp)*pi/num_angles;

%end

%Reconstruct one pixel - END
end
end
