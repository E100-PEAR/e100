outputFolder = 'c:/users/whatever';  % Change this!
% Read in the movie.
mov = aviread(TWoodsFront.avi);
% Determine how many frames there are.
numberOfFrames = size(mov, 2);
for frame = 1 : numberOfFrames
    % Extract the frame from the movie structure.
    thisFrame = mov(frame).cdata;
    % Create a filename.
    outputBaseFileName = sprintf('Frame%4.4d.jpg', frame);
    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    % Write it out to disk.
    imwrite(thisFrame, outputFullFileName, 'jpg');
end

