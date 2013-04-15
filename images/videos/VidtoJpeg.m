outputFolder = 'TWoodsFrontFrames';
mov = VideoReader('TWoodsFront.avi');
numberOfFrames = size(mov, 2);
for frame = 1 : numberOfFrames
    thisFrame = mov(frame).cdata;
    outputBaseFileName = sprintf('Frame%4.4d.jpg', frame);
    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    imwrite(thisFrame, outputFullFileName, 'jpg');
end

outputFolder = 'TWoodsBehindFrames';
mov = VideoReader('TWoodsBehind.avi');
numberOfFrames = size(mov, 2);
for frame = 1 : numberOfFrames
    thisFrame = mov(frame).cdata;
    outputBaseFileName = sprintf('Frame%4.4d.jpg', frame);
    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    imwrite(thisFrame, outputFullFileName, 'jpg');
end
