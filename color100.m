% Convert standard-format (e.g., 24-bit true color) image file to a
% list (in row-major order) of E100 pixel colors (3-bits for red,
% 3-bits for green, 2-bits for blue).
%
% Written by John Dydo and Peter Chen.

function color100(filename)
    disp('==== E100 Color Image Converter ====');
    
    image_rgb = imread(filename);

    height = size(image_rgb,1);
    width = size(image_rgb,2);
    info = imfinfo(filename);
    % disp(info);

    if (info.BitDepth ~= 24 || ~strcmp(info.ColorType, 'truecolor') || size(image_rgb,3) ~= 3)
        disp(['ERROR: image format must be 24-bit true color']);
        return
    end

    disp(['Input: ' filename ' width=' int2str(width) ' height=' int2str(height)]);

    % Define E100 colormap.
    % The colormap is set up so that the index number (in range 0:255) of
    % each colormap entry equals the E100 RGB color value for entry's RGB
    % intensities.
    %
    % E100 supports 3 bits for red, 3 bits for green, and 2 bits for blue.
    % Each 2-bit or 3-bit value maps to a 10-bit intensity value by
    % repeating bits: a 3-bit value abc becomes the 10-bit value abcabcabca,
    % and a 2-bit value ab becomes the 10-bit value ababababab.
    % This 10-bit value is then mapped to an intensity value between 0-1.

    for red = 0 : 7
        red_10bit = bitshift(red,7) + bitshift(red,4) + bitshift(red,1) + bitshift(red,-2);
        for green = 0 : 7
	    green_10bit = bitshift(green,7) + bitshift(green,4) + bitshift(green,1) + bitshift(green,-2);
            for blue = 0 : 3
		blue_10bit = bitshift(blue,8) + bitshift(blue,6) + bitshift(blue,4) + bitshift(blue,2) + blue;
                % The "+1" adjustment is needed because the colormap matrix
                % has indices [1:256] (rather than [0:255])
                entry = bitshift(red,5) + bitshift(green,2) + blue + 1;
                colormap(entry, :) = [red_10bit/1023 green_10bit/1023 blue_10bit/1023];
            end
        end
    end

    % rgb2ind maps each pixel in the image to the index number of the
    % closest color in the colormap.  Since the index for each colormap
    % entry equals the E100 RGB value for that entry, the resulting matrix
    % has the E100 color values for the image.  rgb2ind maps the image to
    % colormap indices [0:63] instead of [1:64] (otherwise I'd have to
    % subtract 1 from the index values).
    % Change 'nodither' to 'dither' if you want Matlab to dither the image.

    image_e100 = rgb2ind(image_rgb, colormap, 'nodither');

    imshow(image_e100, colormap);

    % Output the E100 color values for the image to a binary data file
    % (suitable for the SD card) and to a .e file.  It outputs pixels in
    % the following order: start at the upper left, sweep across a row,
    % then go to the next row, eventually reaching the lower right corner
    % of the image.

    disp(['Writing binary and assembly files for this image.  This may take a few minutes...']);

    binfile = [filename  '.bin' ];
    binfid = fopen(binfile, 'w', 'l');    % 'l' specifies little endian byte order

    efile = [filename  '.e' ];
    efid = fopen(efile, 'w');

    for y = 1 : height
        for x = 1 : width
            fwrite(binfid, image_e100(y,x) , 'uint16');
            fprintf(efid, '\t.data %d\n', image_e100(y,x));
        end
    end

    fclose(binfid);
    fclose(efid);

    disp(['Output: ' binfile ' and ' efile]);
end
