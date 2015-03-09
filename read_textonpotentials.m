function [potentials]=read_textonpotentials(file_name)
f=fopen(file_name);
width=fread(f,1,'int32')
height=fread(f,1,'uint32')
classNo=fread(f,1,'uint32')
for i=1:height
    for j=1:width
        p=height-i+1;
        potentials(p,j,:)=fread(f,11,'double');
    end
end
end
