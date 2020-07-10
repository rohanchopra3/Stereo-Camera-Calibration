function [feature] = get_tiny_image(I, output_size)
    
    [o_h , o_w] = size(I);
    new_image = zeros(output_size(1),output_size(2));
    
    scale_h = ceil(o_h/output_size(1));
    scale_w = ceil(o_w/output_size(2));
    
    for i =1:output_size(1)
       for j = 1:output_size(2)
            new_image(i,j)= I(scale_h*i,scale_w*j);
       end
    end
    feature = new_image;
end