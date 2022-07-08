function output_energy = energy_gradient(input_image)

    I_gray = rgb2gray(input_image);
    [Gmag,Gdir] = imgradient(I_gray);
    output_energy = Gmag;
    
end

