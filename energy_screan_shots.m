function [output_energy] = energy_screan_shots(k, input_image, images_path, base_energy)

    height = size(input_image, 1);
    width = size(input_image, 2);
    im_dir = dir(images_path);
    output_energy = base_energy;
    for i=3 : size(im_dir, 1)
        pic = im2double(imread(im_dir(i).folder + "\" + im_dir(i).name));
        pic_h = size(pic, 1);
        pic_w = size(pic, 2);
        %max_psnr = 0;
        min_diff = inf;
         for y=1 : height - pic_h
            for x=1 : width - pic_w
                search_pic = input_image(y : y+pic_h-1 , x : x+pic_w-1  , :);
                %new_psnr = psnr(search_pic , pic);
                new_diff = sum(sum(abs(rgb2gray(pic) - rgb2gray(search_pic))));
                if (new_diff < min_diff)
                    %max_psnr = new_psnr;
                    min_diff = new_diff;
                    target_y = y;
                    target_x = x;
                end
                
            end
         end
         output_energy(target_y : target_y+pic_h-1, target_x : target_x+pic_w-1) = output_energy(target_y : target_y+pic_h-1, target_x : target_x+pic_w-1) + k * base_energy(target_y : target_y+pic_h-1, target_x : target_x+pic_w-1);
         %output_energy(target_y : target_y+pic_h-1, target_x : target_x+pic_w-1) = output_energy(target_y : target_y+pic_h-1, target_x : target_x+pic_w-1) + mean(mean(output_energy));

    end   
    
    
end

