function total_energy_map = extract_energy_map(input_image)
    
    height = size(input_image, 1);
    width = size(input_image, 2);
    total_energy_map = zeros(height, width);

    gradient_energy_map =  energy_gradient(input_image);
    
    
    manual_energy_map = energy_screan_shots(input_image);
    
    
    total_energy_map = manual_energy_map + gradient_energy_map;
    


end

