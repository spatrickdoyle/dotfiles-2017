#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

using namespace cv;

int main() {
	char* imageName = "/home/sean/.config/i3/lockscreen.png";
	int pixelSize = 9;

	Mat image;
	image = imread(imageName,1);

	Mat modded_image, final_image;
	resize(image,modded_image,Size(image.size().width/pixelSize,image.size().height/pixelSize),0,0,INTER_NEAREST);
	resize(modded_image,final_image,Size(image.size().width,image.size().height),0,0,INTER_NEAREST);

	imwrite("/home/sean/.config/i3/lockscreen.png",final_image);

	return 0;
}
