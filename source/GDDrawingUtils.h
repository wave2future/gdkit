
#import <Foundation/Foundation.h>
#import "GDPrintUtils.h"

#if TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
	#import <Cocoa/Cocoa.h>
#endif

#if TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

NSArray * sliceImageForDrawNine(NSImage * sourceImage, NSSize cornerRectSize);

NSArray * sliceImageForDrawThree(NSImage * sourceImage, NSSize sliceSize, Boolean vertical, Boolean flipped);

#endif
