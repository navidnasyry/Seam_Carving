function [new_main_image, new_energy_map] = remove_seam(dp, min_seam_ind, I_energy, I_input, look_ahead)

    height = size(I_input, 1);
    width = size(I_input, 2);
    
    new_energy_map = zeros(height,width-1,1);
    new_main_image = zeros(height,width-1,3);
    
    for i=height : -1 : 1
        I_input(i, min_seam_ind, :) = [1, 0, 0];
        I_energy(i, min_seam_ind, :) = 0;
        
        new_energy_map(i, :) = I_energy(i, horzcat(1:min_seam_ind-1, min_seam_ind+1:width));
        new_main_image(i, :, :) = I_input(i, horzcat(1:min_seam_ind-1, min_seam_ind+1:width), :);
        
        if (i ~= 1)
            next_pix = find(dp(i-1, max([min_seam_ind - look_ahead, 1]) : min([min_seam_ind + look_ahead, width])) == min(dp(i-1, max([min_seam_ind - look_ahead, 1]) : min([min_seam_ind + look_ahead, width]))),1);
            min_seam_ind = max([min_seam_ind - look_ahead, 1]) - 1 + next_pix; % find next cell in seam  
        end        
    end
    
    imshow(I_input, []);
    %pause(0.2);
    %imshow(I_energy, []);
    %(0.2);

end

