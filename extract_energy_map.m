function energy_map = extract_energy_map(input_image)

    I_gray = rgb2gray(input_image);
    [Gmag,Gdir] = imgradient(I_gray);

    energy_map = Gmag;


end

