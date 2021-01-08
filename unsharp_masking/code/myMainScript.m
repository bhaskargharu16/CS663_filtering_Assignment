%% MyMainScript

tic;

myNumOfColors = 256;
myColorScale = [ [0:1/(myNumOfColors-1):1]' , [0:1/(myNumOfColors-1):1]' , [0:1/(myNumOfColors-1):1]' ];

%loading images
path1 = load('../data/lionCrop.mat');
path2 = load('../data/superMoonCrop.mat');
Input1 = path1.imageOrig;
Input2 = path2.imageOrig;

%unsharpmasking
output1 = myUnsharpMasking(Input1, 9, 2.5, 1.1);
output2 = myUnsharpMasking(Input2, 5, 3, 5);

%Results

%Input1
figure;
subplot(1,2,1);
imagesc(mat2gray(myLinearContrastStretching(mat2gray(Input1)))), title('Original Image Lion Crop');
colormap (myColorScale);
colormap gray;
colorbar;
daspect ([1 1 1]);

%output1
subplot(1,2,2);
imagesc(mat2gray(myLinearContrastStretching(mat2gray(output1)))), title('Unsharp Masked Image Lion Crop');
colormap (myColorScale);
colormap gray;
colorbar;
daspect ([1 1 1]);

%Input2
figure;
subplot(1,2,1);
imagesc(mat2gray(myLinearContrastStretching(mat2gray(Input2)))), title('Original Image Moon Crop');
colormap (myColorScale);
colormap gray;
colorbar;
daspect ([1 1 1]);

%output2
subplot(1,2,2);
imagesc(mat2gray(myLinearContrastStretching(mat2gray(output2)))), title('Unsharp Masked Image Moon Crop');
colormap (myColorScale);
colormap gray;
colorbar;
daspect ([1 1 1]);
toc;
