clc;   
close all;  
clear;  

image_name = "Diana";
im_format = ".png";
input_image = im2double(imread("./Samples/" + image_name + im_format));
[rows, columns, numColorChannels] = size(input_image)
imshow(input_image);
numBandsVertically = 6;
numBandsHorizontally = 6;


topRows = round(linspace(1, rows+1, numBandsVertically + 1))
leftColumns = round(linspace(1, columns+1, numBandsHorizontally + 1))
% Draw lines over image
for k = 1 : length(topRows)
	yline(topRows(k), 'Color', 'y', 'LineWidth', 2);
end
for k = 1 : length(leftColumns)
	xline(leftColumns(k), 'Color', 'y', 'LineWidth', 2);
end
% Extract into subimages and display on a new figure.
hFig2 = figure();
plotCounter = 1;
for row = 1 : length(topRows) - 1
	row1 = topRows(row);
	row2 = topRows(row + 1) - 1;
	for col = 1 : length(leftColumns) - 1
		col1 = leftColumns(col);
		col2 = leftColumns(col + 1) - 1;
		subImage = input_image(row1 : row2, col1 : col2, :);
		imshow(subImage);
        imwrite(subImage, "./helper/" + image_name + "/seg_" + row + "_" + col+ im_format);
		plotCounter = plotCounter + 1;
	end
end
