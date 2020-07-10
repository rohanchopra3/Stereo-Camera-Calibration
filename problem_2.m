import compute_corrs.*


left = imread('viewL.png');
right = imread('viewR.png');

groundtruth = load('disparity.mat');


% For SSD
disp =  compute_corrs(left,right,"SSD");
a1 = double(disp);
a2 = double(groundtruth.L);
err = immse(a1, a2);
error = a2-a1;
fprintf('\n SSD \n' )
fprintf('Max error is %.0f%  \n', max(max(error)))
fprintf('Min error is %.0f%  \n', min(min(error)))
fprintf('Mean error is %.0f%  \n', mean2(error))
fprintf('std error is %.0f%  \n', std2(error))
fprintf('The error is %.0f%  \n', sqrt(err)) 

figure(1);
imshow(disp, []);
colormap(jet);
axis image;
colorbar;


% For CC
disp =  compute_corrs(left,right,"CC");
a1 = double(disp);
a2 = double(groundtruth.L);
err = immse(a1, a2);
error = a2-a1;
fprintf('\n CC \n' )
fprintf('Max error is %.0f%  \n', max(max(error)))
fprintf('Min error is %.0f%  \n', min(min(error)))
fprintf('Mean error is %.0f%  \n', mean2(error))
fprintf('std error is %.0f%  \n', std2(error))
fprintf('The error is %.0f%  \n', sqrt(err)) 


figure(2);
imshow(disp, []);
colormap(jet);
axis image;
colorbar;


% For NCC
disp =  compute_corrs(left,right,"NCC");
a1 = double(disp);
a2 = double(groundtruth.L);
err = immse(a1, a2);
error = a2-a1;
fprintf('\n NCC \n' )
fprintf('Max error is %.0f%  \n', max(max(error)))
fprintf('Min error is %.0f%  \n', min(min(error)))
fprintf('Mean error is %.0f%  \n', mean2(error))
fprintf('std error is %.0f%  \n', std2(error))
fprintf('The error is %.0f%  \n', sqrt(err)) 

figure(3);
imshow(disp, []);
colormap(jet);
axis image;
colorbar;