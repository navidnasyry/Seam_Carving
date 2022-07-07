function [final_main_image, final_energy_image] = resize_seam_carving(input_image, energy_image ,percent, look_ahead)

    % percent between 0 to 1
    width = size(input_image, 2);
    final_main_image = input_image;
    final_energy_image = energy_image;
    end_ind = round(percent * width);
    
    for i=1 : end_ind
            i
        [final_main_image, final_energy_image] = seam_carving(final_main_image, final_energy_image, look_ahead);
    end    
end

