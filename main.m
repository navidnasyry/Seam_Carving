clc;
clear;
close all;


input_image = im2double(imread("Samples/Diana.png"));
important_images = dir("./help/1/");
each_level_seam_carving_look_ahead = 1;


energy_image = extract_energy_map(input_image);


[final_main_image, final_energy_image] = resize_seam_carving(input_image, energy_image, 0.5, each_level_seam_carving_look_ahead);









