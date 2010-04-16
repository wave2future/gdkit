
#include "GDCoreGraphicsUtilities.h"

CGContextRef CGCreateARGBBitmapContextFromImage(CGImageRef inImage) {
	CGContextRef context = nil;
	CGColorSpaceRef colorSpace;
	void * bitmapData;
	int bitmapByteCount;
	int bitmapBytesPerRow;
	//get image width, height. We'll use the entire image.
	size_t pixelsWide = CGImageGetWidth(inImage);
	size_t pixelsHigh = CGImageGetHeight(inImage);
	//declare the number of bytes per row. Each pixel in the bitmap in this
	//example is represented by 4 bytes; 8 bits each of red, green, blue, and alpha.
	bitmapBytesPerRow = (pixelsWide * 4);
	bitmapByteCount = (bitmapBytesPerRow * pixelsHigh);
	colorSpace = CGColorSpaceCreateDeviceRGB();
	if(colorSpace == nil) {
		fprintf(stderr, "Error allocating color space\n");
		return nil;
	}
	//allocate memory for image data. This is the destination in memory
	//where any drawing to the bitmap context will be rendered.
	bitmapData = malloc(bitmapByteCount);
	if(bitmapData == nil)
	{
		//fprintf(stderr, "Memory not allocated!");
		CGColorSpaceRelease(colorSpace);
		return nil;
	}
	//create the bitmap context. We want pre-multiplied ARGB, 8-bits 
	//per component. Regardless of what the source image format is 
	//(CMYK, Grayscale, and so on) it will be converted over to the format
	//specified here by CGBitmapContextCreate.
	//8 = bits per component
	context = CGBitmapContextCreate(bitmapData,pixelsWide,pixelsHigh,8,bitmapBytesPerRow,colorSpace,kCGImageAlphaPremultipliedFirst);
	if(context == nil) {
		free(bitmapData);
		fprintf(stderr,"Context not created!");
	}
	CGColorSpaceRelease(colorSpace);
	return context;
}
