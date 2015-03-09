function [ output_args ] = potentials_from_video( num )
dir_files= '/home/dineshn/new_code/dataset/';
dataset=num;
Imgs = dir([dir_files 'Left/' num2str(dataset) '/*']);


%% flow

for loop=3:size(Imgs,1)-1

    [pathstr,name,ext]=fileparts(Imgs(loop).name);
    flow_fileName_f=[dir_files 'flow/' num2str(dataset) '/' name '.flo'];
    flow_f=readFlowFile(flow_fileName_f);
end

end

