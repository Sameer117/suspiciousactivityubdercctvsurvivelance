A1 = uigetfile('*.mp4','Select the Video file');
a=mean2(A1);

delete('Frames\*.jpg');
I = VideoReader(A1);
nFrames = I.numberofFrames;
vidHeight =  I.Height;
vidWidth =  I.Width;
mov(1:nFrames) = ...
    struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
           'colormap', []);
       WantedFrames = 1200;
%        100+randi(50,1);
for k = 1:WantedFrames
    mov(k).cdata = read( I, k);
   mov(k).cdata = imresize(mov(k).cdata,[256,256]);
    imwrite(mov(k).cdata,['Frames\',num2str(k),'.jpg']);
end

for I = 1:WantedFrames
   im=imread(['Frames\',num2str(I),'.jpg']);
%   figure(); imshow(im); title(num2str(I));
%     pause(1);
end