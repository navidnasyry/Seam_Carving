function [new_energy_map, new_main_image] = remove_seam(dp, min_seam_ind, I_energy, I_input, look_ahead)

    height = size(I_input, 1);
    width = size(I_input, 2);
    
    new_energy_map = zeros(height,width-1,1);
    new_main_image = zeros(height,width-1,3);
    
    for i=height : -1 : 1
        new_energy_map(i) = I_energy(i, horzcat(1:min_seam_ind-1, min_seam_ind+1:width))
        new_main_image(i) = I_input(i, horzcat(1:min_seam_ind-1, min_seam_ind+1:width), :)
        
        if (i ~= 1)
            next_pix = find(I_energy(i-1, min_seam_ind-look_ahead : min_seam_ind+look_ahead) == min(I_energy(i-1, min_seam_ind-look_ahead : min_seam_ind+look_ahead)));
            min_seam_ind = min_seam_ind - look_ahead - 1 + next_pix; % find nex cell in seam  
        end        
    end
    

end

