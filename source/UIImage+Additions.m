
#import "UIImage+Additions.h"

@implementation UIImage (Additions)

- (UIColor *) getPixelColorAtPoint:(CGPoint) point {
	UIColor * color = nil;
	CGImageRef inImage = [self CGImage];
	//create off screen bitmap context to draw the image into.
	//format ARGB is 4 bytes for each pixel: Alpa, Red, Green, Blue
	CGContextRef cgctx = CGCreateARGBBitmapContextFromImage(inImage);
	if(cgctx == NULL) return nil;
	size_t w = CGImageGetWidth(inImage);
	size_t h = CGImageGetHeight(inImage);
	CGRect rect = {{0,0},{w,h}};
	//draw the image to the bitmap context. Once we draw, the memory 
	//allocated for the context for rendering will then contain the 
	//raw image data in the specified color space.
	CGContextDrawImage(cgctx, rect, inImage); 
	//now we can get a pointer to the image data associated with the bitmap context.
	unsigned char * data = CGBitmapContextGetData(cgctx);
	if(data != NULL) {
		//offset locates the pixel in the data from x,y. 
		//4 for 4 bytes of data per pixel, w is width of one row of data.
		int offset = 4*((w*round(point.y))+round(point.x));
		int alpha =  data[offset];
		int red = data[offset+1];
		int green = data[offset+2];
		int blue = data[offset+3];
		color=[UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
	}
	CGContextRelease(cgctx); 
	if(data) free(data);
	return color;
}

@end
