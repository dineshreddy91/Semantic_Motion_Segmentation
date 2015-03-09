function compute_flow(num)

dir_files= '/home/dineshn/new_code/dataset/';
dataset=num;
Imgs = dir([dir_files 'Left/' num2str(dataset) '/*']);


%% flow

for loop=3:size(Imgs,1)-1

    [pathstr,name,ext]=fileparts(Imgs(loop).name);

    flow_fileName_f=[dir_files 'flow/' num2str(dataset) '/' name '.flo'];
    executable_f = ['./DeepFlow/deepflow ' [dir_files 'Left/' num2str(dataset) '/' Imgs(loop).name] ' ' [dir_files 'Left/' num2str(dataset) '/' Imgs(loop+1).name] ' ' flow_fileName_f ' -kitti'];
    if exist(flow_fileName_f, 'file') == 2
  %   disp(   [flow_fileName_f ' available']);
    else
     disp(   [flow_fileName_f ' not available']);
     system(executable_f);
    end
% flow_f=readFlowFile(flow_fileName_f);
% SIFTloc=[];
% for j=1:size(image_i,1)
%     for i=1:size(image_i,2)
%        SIFTloc=[SIFTloc [j;i]];
% 
% %    if XYZcam_i(j,i,3)>0.001 && rem(j,5)==0 && rem(i,5)==0 && XYZcam_i(j,i,3)<26 
% %    end
%    end
% end
% [points_3d_stationary_1,points_3d_stationary_2,points_stationary_2,points_1] = tracked_points_with_3d_points_odo( SIFTloc,XYZcam_i,XYZcam_j,flow_f,data.K);
end

end