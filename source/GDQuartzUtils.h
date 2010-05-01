
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <TargetConditionals.h>

#if TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	#import <ApplicationServices/ApplicationServices.h>
#endif

#if TARGET_OS_IPHONE || TARGET_OS_EMBEDDED || TARGET_IPHONE_SIMULATOR
	#import <CoreGraphics/CoreGraphics.h>
#endif

/**
 * @file GDQuartzUtils.h
 *
 * Header file for quartz utils.
 */

/**
 * Create an ARGBBitmapContext (taken from: [h]ttp://developer.apple.com/mac/library/qa/qa2007/qa1509.html).
 */
CGContextRef CGCreateARGBBitmapContextFromImage(CGImageRef inImage);
