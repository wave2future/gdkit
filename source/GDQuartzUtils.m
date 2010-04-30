
#include "GDQuartzUtils.h"

CGContextRef CGCreateARGBBitmapContextFromImage(CGImageRef inImage) {
	CGContextRef context = nil;
	CGColorSpaceRef colorSpace;
	void * bitmapData;
	int bitmapByteCount;
	int bitmapBytesPerRow;
	size_t pixelsWide = CGImageGetWidth(inImage);
	size_t pixelsHigh = CGImageGetHeight(inImage);
	bitmapBytesPerRow = (pixelsWide * 4);
	bitmapByteCount = (bitmapBytesPerRow * pixelsHigh);
	colorSpace = CGColorSpaceCreateDeviceRGB();
	if(colorSpace == nil) {
		fprintf(stderr, "Error allocating color space\n");
		return nil;
	}
	bitmapData = malloc(bitmapByteCount);
	if(bitmapData == nil)
	{
		CGColorSpaceRelease(colorSpace);
		return nil;
	}
	context = CGBitmapContextCreate(bitmapData,pixelsWide,pixelsHigh,8,bitmapBytesPerRow,colorSpace,kCGImageAlphaPremultipliedFirst);
	if(context == nil) {
		free(bitmapData);
		fprintf(stderr,"Context not created!");
	}
	CGColorSpaceRelease(colorSpace);
	return context;
}
