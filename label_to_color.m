function [ labelled_image_color ] = label_to_color( labelled_image )

for i=1:size(labelled_image,1)
    for j=1:size(labelled_image,2)
       if  labelled_image(i,j)==1
          labelled_image_color(i,j,1)=128/255;%
          labelled_image_color(i,j,2)=0/255;
          labelled_image_color(i,j,3)=0/255;
       elseif  labelled_image(i,j)==2
          labelled_image_color(i,j,1)=128/255;%
          labelled_image_color(i,j,2)=128/255;
          labelled_image_color(i,j,3)=0;
       elseif  labelled_image(i,j)==3
           labelled_image_color(i,j,1)=128/255;%
          labelled_image_color(i,j,2)=128/255;
          labelled_image_color(i,j,3)=128/255;
       elseif  labelled_image(i,j)==4
          labelled_image_color(i,j,1)=64/255;%
          labelled_image_color(i,j,2)=0/255;
          labelled_image_color(i,j,3)=128/255;
       elseif  labelled_image(i,j)==5
          labelled_image_color(i,j,1)=192/255;%
          labelled_image_color(i,j,2)=128/255;
          labelled_image_color(i,j,3)=128/255;
             elseif  labelled_image(i,j)==6
          labelled_image_color(i,j,1)=128/255;%
          labelled_image_color(i,j,2)=64/255;
          labelled_image_color(i,j,3)=128/255;
             elseif  labelled_image(i,j)==7
          labelled_image_color(i,j,1)=64/255;%
          labelled_image_color(i,j,2)=64/255;
          labelled_image_color(i,j,3)=0/255;
       elseif  labelled_image(i,j)==8
          labelled_image_color(i,j,1)=64/255;%
          labelled_image_color(i,j,2)=64/255;
          labelled_image_color(i,j,3)=128/255;
       elseif  labelled_image(i,j)==9
          labelled_image_color(i,j,1)=128/255;
          labelled_image_color(i,j,2)=128/255;
          labelled_image_color(i,j,3)=64/255;
       elseif  labelled_image(i,j)==10
          labelled_image_color(i,j,1)=0/255;%
          labelled_image_color(i,j,2)=0/255;
          labelled_image_color(i,j,3)=192/255;
       end
        
    end
end

end

