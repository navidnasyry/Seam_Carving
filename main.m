clc;
clear;
close all;

image_name = "tower.jpg";
input_image = im2double(imread("Samples/" + image_name));
f_name = image_name.split(".");
important_images = dir("./help/"+f_name(1)+"/");
each_level_seam_carving_look_ahead = 1; 

final_energy_map = extract_energy_map(input_image);

[final_main_image, final_energy_image] = resize_seam_carving(input_image, final_energy_map, 0.5, each_level_seam_carving_look_ahead);

imshow(final_main_image, []);
imwrite(final_main_image, "./output/"+"/"+"output_"+image_name);







