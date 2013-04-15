% Dis nigga converts our tiger woods video into bin format.  Sexy.


workingDir = tempname;
mkdir(workingDir);
mkdir(workingDir,'TigerFront');

tigerFrontVideo = VideoReader('TigerWoodsFront.avi');

for ii = 1:tigerFrontVideo.NumberOfFrames
    img = read(shuttleVideo,ii);
    
    % Write out to a JPEG file
    
    imwrite(img,fullfile(workingDir,'TigerFront',sprintf('img%d.jpg',ii)));
end

