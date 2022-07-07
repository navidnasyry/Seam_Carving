function [final_image] = seam_carving(I_input,I_energy)

height = size(I_input, 1);
width = size(I_input, 2);
dp = zeros(height,width,1);
% dp_indexes = strings(height,width,1);
dp(1,:) = I_energy(1:);


for i=2 : height
    for j=1 : width
       if (j == 1)
           dp(i,j) = I_energy(i,j) + min(I_energy(i-1, j:j+1));
       elseif (j == width)
           dp(i,j) = I_energy(i,j) + min(I_energy(i-1, j-1:j));
       else
           dp(i,j) = I_energy(i,j) + min(I_energy(i-1, j-1:j+1));
       end
    end    
end

min_seam_ind = find(dp(end,:) == min(dp(end, :)));
[new_energy_map, new_main_image] = remove_seam(dp, min_seam_ind, I_energy, I_input);






end

