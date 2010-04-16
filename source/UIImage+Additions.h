
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "GDCoreGraphicsUtilities.h"

@interface UIImage (Additions)

/**
 * Get a UIColor instance from a point in the bitmap.
 */
- (UIColor *) getPixelColorAtPoint:(CGPoint) point;

@end
