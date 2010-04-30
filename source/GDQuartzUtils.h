
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <TargetConditionals.h>

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
	#import <ApplicationServices/ApplicationServices.h>
#endif

#if (TARGET_OS_IPHONE || TARGET_OS_EMBEDDED && !TARGET_OS_MAC)
	#import <CoreGraphics/CoreGraphics.h>
#endif

/**
 * @function CGCreateARGBBitmapContextFromImage
 * 
 * Create an ARGBBitmapContext (taken from: [h]ttp://developer.apple.com/mac/library/qa/qa2007/qa1509.html).
 */
CGContextRef CGCreateARGBBitmapContextFromImage(CGImageRef inImage);
