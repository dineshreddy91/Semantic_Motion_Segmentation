function [ labelled_image_final ] = color_to_label(labelled_image_color)
for i=1:size(labelled_image_color,1)
    for j=1:size(labelled_image_color,2)
       if  labelled_image_color(i,j,1)==128 && labelled_image_color(i,j,2)==0 && labelled_image_color(i,j,3)==0
          labelled_image_final(i,j)=1;%building
       elseif labelled_image_color(i,j,1)==128 && labelled_image_color(i,j,2)==128 && labelled_image_color(i,j,3)==0
          labelled_image_final(i,j)=2;%vegetation
       elseif   labelled_image_color(i,j,1)==128 && labelled_image_color(i,j,2)==128 && labelled_image_color(i,j,3)==128
          labelled_image_final(i,j)=3;%sky
       elseif   labelled_image_color(i,j,1)==64 && labelled_image_color(i,j,2)==0 && labelled_image_color(i,j,3)==128
          labelled_image_final(i,j)=4;%car
       elseif   labelled_image_color(i,j,1)==192 && labelled_image_color(i,j,2)==128 && labelled_image_color(i,j,3)==128
          labelled_image_final(i,j)=5;%poles
       elseif   labelled_image_color(i,j,1)==128 && labelled_image_color(i,j,2)==64 && labelled_image_color(i,j,3)==128
          labelled_image_final(i,j)=6;%road
       elseif   labelled_image_color(i,j,1)==64 && labelled_image_color(i,j,2)==64 && labelled_image_color(i,j,3)==0
          labelled_image_final(i,j)=7;%pedistrian
       elseif   labelled_image_color(i,j,1)==64 && labelled_image_color(i,j,2)==64 && labelled_image_color(i,j,3)==128
          labelled_image_final(i,j)=8;%fence
       elseif   labelled_image_color(i,j,1)==128 && labelled_image_color(i,j,2)==128 && labelled_image_color(i,j,3)==64
          labelled_image_final(i,j)=9;%signage
       elseif   labelled_image_color(i,j,1)==0 && labelled_image_color(i,j,2)==0 && labelled_image_color(i,j,3)==192
          labelled_image_final(i,j)=10;%pavement
       elseif   labelled_image_color(i,j,1)==0 && labelled_image_color(i,j,2)==128 && labelled_image_color(i,j,3)==128
          labelled_image_final(i,j)=4;%car
       elseif   labelled_image_color(i,j,1)==0 && labelled_image_color(i,j,2)==64 && labelled_image_color(i,j,3)==64
          labelled_image_final(i,j)=5;%poles
       elseif   labelled_image_color(i,j,1)==60 && labelled_image_color(i,j,2)==180 && labelled_image_color(i,j,3)==0
          labelled_image_final(i,j)=8;%fence
       end
        
    end
end

end

