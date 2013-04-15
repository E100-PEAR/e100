imageNames = dir(fullfile('TWoodsFrontFrames','*.jpeg'));
imageNames = {imageNames.name}';
cd('TWoodsFrontFrames');
for i = 1:length(imageNames)
    disp imageNames{i};
    color100(imageNames{i});
end