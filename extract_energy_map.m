function total_energy_map = extract_energy_map(input_image, help_path, k)
    
    height = size(input_image, 1);
    width = size(input_image, 2);
    total_energy_map = zeros(height, width);

    gradient_energy_map =  energy_gradient(input_image);
    
    %imshow(gradient_energy_map, []);
    %pause(4);
    
    manual_energy_map = energy_screan_shots(k, input_image, help_path, gradient_energy_map);
    
    %imshow(manual_energy_map, []);
    %pause(4);
    
    total_energy_map = gradient_energy_map + manual_energy_map;
    
    imshow(total_energy_map, []);
    pause(4);


end

