#include<iostream>
#include<stdio.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include<stdio.h>
#include<cstdlib>
#include<iostream>
#include<string.h>
#include<fstream>
#include<sstream>
#include<dirent.h>
#include <iomanip>
#include <locale>
#include <sstream>
#include <string>
using namespace std;
using namespace cv;
using namespace std;
int width = 1242;
int height = 375;
float fl = 718.856 ;
float baselength=0.54;
int main(int argc,char**argv)
{
	Mat imgdisp= imread(argv[3],CV_LOAD_IMAGE_ANYDEPTH);
	Mat imgrgb = imread(argv[1],CV_LOAD_IMAGE_COLOR);
	Mat imgleft = imread(argv[1],CV_LOAD_IMAGE_COLOR);
	Mat imgright = imread(argv[2],CV_LOAD_IMAGE_COLOR);
	Mat depthmap(imgleft.rows,imgleft.cols,CV_32FC1)
	for(int i = 0 ; i < imgleft.rows;i++)
	{
		for(int j = 0 ; j < imgleft.cols; j++)
		{
			depthmap.at<float>(i,j) = fl* baselength/imgdisp.at<double>(i,j);
		}
	}
	pcl::PointCloud<pcl::PointXYZRGBA> cloud;
    cloud.width = width;
    cloud.height = height;
    cloud.is_dense = false;
    int cloud_size,count=0,red,blue,green;
   /* for(int i=0;i<1242*375;i++)
    {
		if(img.at<uchar>(i/width,i%width)!=0)
		count++;
	}
    */
	cloud_size = 1242*375;
	cloud.points.resize(cloud_size);
	for(int i=0;i<1242*375;i++)
    {
		//if(img.at<uchar>(i/width,i%width)!=0 && count<=cloud_size)
		//{
			cloud.points[i].z = img.at<uint16_t>(i/width,i%width)/1000;
			uint16_t z = cloud.points[i].z;
			//printf("%d\n",z);
			cloud.points[i].x = (((i%width - 607.19)*z)/718.86);
			cloud.points[i].y = (((i/width - 185.22)*z)/718.86);
			//cloud.points[i].x = i%width;
			//cloud.points[i].y = i/width;
			Vec3b intensity = imgrgb.at<Vec3b>(i/width, i%width);
			if(img.at<uchar>(i/width,i%width)!=0)
			{
				blue = intensity.val[0];
				green = intensity.val[1];
				red = intensity.val[2];
		    }
		    else
		    {
				blue =0;
				red = 0;
				green=0;
			}
			uint8_t r = red,b = blue,	g = green;
			int32_t rgb = (r << 16) | (g << 8) | b;
			cloud.points[i].rgb =  *(float*)(&rgb);
		//}
		//count++;
	}
	 String pcdfile = "cloud_readimage.pcd";
	 pcl::io::savePCDFileASCII (pcdfile, cloud);
     waitKey(0);                            

}
