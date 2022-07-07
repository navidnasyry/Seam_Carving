function [final_main_image, final_energy_image] = resize_seam_carving(input_image, energy_image ,percent)

    % percent between 0 to 1
    width = size(I_input, 2);
    final_main_image = input_image;
    final_energy_image = energy_image;
    
    for i=1 : round(percent * width)
        [final_main_image, final_energy_image] = seam_carving(final_main_image, final_energy_image);
        
    end    
end

