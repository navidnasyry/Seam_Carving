clc;
clear;
close all;

image_name = "Diana";
format = ".png";
input_image = im2double(imread("./Samples/" + image_name + format));
smap_image = im2double(imread("./Samples/" + image_name+ "_SMap" + format));
dmap_image = im2double(imread("./Samples/" + image_name+ "_DMap" + format));

%find path of image screan shots for detect important part of image
f_name = image_name.split(".");
helpers_path = "./helper/"+f_name(1)+"/";

%read look ahead parameter
each_level_seam_carving_look_ahead = 1; 

%The ratio of increasing the importance of the parts of the images that are input
ratio = 2;

%percent of resize
resize_percent = 0.5;

%find energy map 
final_energy_map = extract_energy_map(input_image, helpers_path, ratio, smap_image, dmap_image);

%write input energy map
imwrite(final_energy_map, "./output/"+"/"+"energy_"+image_name + format);

%seam carving with final energy map
[final_main_image, final_energy_image] = resize_seam_carving(input_image, final_energy_map, resize_percent, each_level_seam_carving_look_ahead);

%show final resized image
imshow(final_main_image, []);

%save result image
imwrite(final_main_image, "./output/" + "/" + int2str(resize_percent*10) + "output_" + image_name + format);







