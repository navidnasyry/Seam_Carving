clc;
clear;
close all;


input_image = im2double(imread("Samples/1.jpg"));
important_images = dir("./help/1/");



energy_image = extract_energy_map(input_image);

imshow(energy_image, []);

final_image = seam_carving(input_image, energy_image);









