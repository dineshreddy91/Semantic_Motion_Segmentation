function []= depth_only(num)
tic;
dir_files= '/home/dineshn/new_code/dataset/';
dataset=num;
K=[718.856 0 607.1928;0 718.856 185.2157; 0 0 1];
baselength=0.54;
Imgs = dir([dir_files 'Left_png/' num2str(dataset) '/*']);
addpath('mexopencv');
addpath('libviso2');
for loop=3:size(Imgs,1)

    [pathstr,name,ext]=fileparts(Imgs(loop).name);
    display([num2str(loop) ' out of ' num2str(size(Imgs,1))]);
    fileName=[dir_files 'Left_png/' num2str(dataset) '/' Imgs(loop).name];
    im_l1=imread(fileName);
    im_r1=imread([dir_files 'Right/' num2str(dataset) '/' Imgs(loop).name]);
    system(['./spsstereo/spsstereo ' dir_files 'Left_png/' num2str(dataset) '/' Imgs(loop).name ' ' dir_files 'Right/' num2str(dataset) '/' Imgs(loop).name]);
    bm=cv.StereoSGBM('MinDisparity',0,'SADWindowSize',5,'P1',50,'P2',800,'UniquenessRatio',0,'PreFilterCap',15,'SpeckleWindowSize',100,'SpeckleRange',32,'FullDP',1);
    d_second=double((bm.compute(im_l1,im_r1))/16);
    d_first=imread(['./' name '_left_disparity.png'])/256;
    system(['rm ./' name '_left_disparity.png ']);
    system(['rm ./' name '_boundary.png ']);
    system(['rm ./' name '_segment.png ']);
    system(['rm ./' name '_label.txt ']);
    system(['rm ./' name '_plane.txt ']);
    %imshow(d_first);
        for p_y=1:size(d_first,2)
            for p_x=1:size(d_first,1)
               d_average=d_first(p_x,p_y);
               pw=d_average;
               Z=K(1,1)*baselength/pw;
               if d_average<3
                  finale_image(p_x,p_y)=0;
               else
                  finale_image(p_x,p_y)=Z*1000;
               end
             end
        end

    finale_image=uint16(finale_image);
    imwrite(finale_image,[dir_files 'Depth_spss/' num2str(dataset) '/' name '.png'])

end

end
