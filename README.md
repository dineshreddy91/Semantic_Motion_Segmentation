# Semantic_Motion_Segmentation

This Repo contains the Motion segmentation algorithm with semantic constraints as proposed in http://robotics.iiit.ac.in/uploads/Main/Publications/Dinesh_etal_ICVGIP_14.pdf

This repo only contains the opensource libraries used for the publication and the original code couldnt be released because of propetry issues

Download the Repo

git clone https://github.com/dineshreddy91/Semantic_Motion_Segmentation

cd Semantic_Motion_Segmentation

For disparity computation

cd spsstereo

cmake .

make 

cd ..

For flow computation

cd DeepFlow

cmake .

make 

cd ..

For Inference of the graphical Models Using DenseCRF

cd densecrf/examples

cmake .

make

cd ../..

To run the algorithm

Open matlab

main(in MATLAB console)
