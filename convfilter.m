function [fprojs,samp_space,samp_pos,f] = convfilter(projs,det_space,det_pos)

% Filtering of projection by convolution
%
% [fprojs,samp_space,samp_pos,f] = convfilter(projs,det_space,det_pos)
%
% INPUTS
% projs = projections obtained from calcproj
% det_space = Spacing of detectors along the projection
% det_pos = detector positions in [-L/2,L/2]
%
% OUTPUTS
% fprojs = filtered projections
% samp_space = Spacing of samples in the filtered projection
% samp_pos = sample positions in the filtered projection
% f = filter time-domain samples
%
% Developed by	Srikrishna Bhashyam and Andy Doran
%               Rice University
% 		March 1, 1999
%


num_dets = length(det_pos);
samp_space = det_space;

fl = 400;
rfilter = zeros(1,fl);
rfilter(1:2:fl) = [-1./(([1:2:fl]*pi*samp_space).^2)];
f = [fliplr(rfilter) 1/(4*samp_space^2) rfilter]*samp_space;
%stem(f);
%pause
%plot(abs(fft(f,256)));
%pause
[px,py] = size(projs);

fprojs = zeros(px,py+2*fl);

for i = 1:px
fprojs(i,:) = conv(projs(i,:),f);
end

samp_pos = [det_pos(1)-samp_space*[fl:-1:1] det_pos det_pos(num_dets)+samp_space*[1:fl]];

%subplot(211)
%plot(projs(1,:));
%subplot(212);
%plot(fprojs(1,:));
%pause
