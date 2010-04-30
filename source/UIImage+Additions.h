
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "GDQuartzUtils.h"

/**
 * @file UIImage+Additions.h
 *
 * Header file for UIImage+Additions.
 */

/**
 * @class UIImage
 *
 * Category additions to UIImage
 */

/**
 * Category additions to UIImage
 */
@interface UIImage (Additions)

/**
 * Get a UIColor instance from a point in the bitmap.
 */
- (UIColor *) getPixelColorAtPoint:(CGPoint) point;

/**
 * Get RGBA component values from a pixel location.
 *
 * @param _storage A float[4].
 * @param point A CGPoint.
 */
- (void) getRGBAComponents:(float *) _storage forPixelAtPoint:(CGPoint) point;

/**
 * Get RGB component values from a pixel location.
 *
 * @param _storage A float[3].
 * @param point A CGPoint.
 */
- (void) getRGBComponents:(float *) _storage forPixelAtPoint:(CGPoint) point;

@end
