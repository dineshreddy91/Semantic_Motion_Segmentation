function []=write_textonpotentials(file_name,potentials,width,height,classNo)
f=fopen(file_name,'w');
fwrite(f,width,'uint32');
fwrite(f,height,'uint32');
fwrite(f,classNo,'uint32');
for i=1:height
    for j=1:width
        p=height-i+1;
        for k=1:classNo
        pp=double(potentials(p,j,k));
        fwrite(f,pp,'double');
        end
    end
end
end
