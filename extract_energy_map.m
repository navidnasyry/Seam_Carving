function total_energy_map = extract_energy_map(input_image, help_path, k, smap, dmap)
    
    height = size(input_image, 1);
    width = size(input_image, 2);
    total_energy_map = zeros(height, width);

    gradient_energy_map =  energy_gradient(input_image);
    
    %imshow(gradient_energy_map, []);
    %pause(4);
    base_energy = 0.5*gradient_energy_map + 0.1*smap + 0.8*dmap;

    
    total_energy_map = 0.7*base_energy + 0.3*energy_screan_shots(k, input_image, help_path, base_energy);
    
    %imshow(manual_energy_map, []);
    %pause(4);
    
    
    imshow(total_energy_map, []);
    pause(15);


end

