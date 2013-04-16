imageNames = dir(fullfile('TWoodsBehindFrames','*.jpeg'));
imageNames = {imageNames.name}';
cd('TWoodsBehindFrames');

for i = 1:length(imageNames)
    img = imageNames{i};
    color100(img);
end
