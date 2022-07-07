function [new_main_image, new_energy_map] = seam_carving(I_input, I_energy, look_ahead)

height = size(I_input, 1);
width = size(I_input, 2);
dp = zeros(height, width);
dp(1,:) = I_energy(1, :);


for i=2 : height
    for j=1 : width
       if (j <= look_ahead)
           dp(i,j) = I_energy(i,j) + min(I_energy(i-1, 1:j+look_ahead));
       elseif (j >= width-look_ahead)
           dp(i,j) = I_energy(i,j) + min(I_energy(i-1, j-look_ahead:width));
       else
           dp(i,j) = I_energy(i,j) + min(I_energy(i-1, j-look_ahead:j+look_ahead));
       end
    end    
end

min_seam_ind = find(dp(end,:) == min(dp(end, :)), 1)
[new_energy_map, new_main_image] = remove_seam(dp, min_seam_ind, I_energy, I_input, look_ahead);






end

