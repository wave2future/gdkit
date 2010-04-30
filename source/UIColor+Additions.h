
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * @file UIColor+Additions.h
 *
 * Header file for UIColor+Additions.
 */

/**
 * @class UIColor
 *
 * Category additions to UIColor.
 */

/**
 * Category additions to UIColor.
 */
@interface UIColor (Additions)

/**
 * Red component.
 */
@property (nonatomic,readonly) CGFloat red;

/**
 * Green component.
 */
@property (nonatomic,readonly) CGFloat green;

/**
 * Blue component.
 */
@property (nonatomic,readonly) CGFloat blue;

/**
 * Alpha component.
 */
@property (nonatomic,readonly) CGFloat alpha;

/**
 * White component for monochrome color space.
 */
@property (nonatomic,readonly) CGFloat white;

/**
 * Whether or not this color object can provide r,g,b compnents.
 */
- (BOOL) canProvideRGBComponents;

/**
 * The color space model.
 */
- (CGColorSpaceModel) colorSpaceModel;

/**
 * Returns a string representation of the color space model.
 */
- (NSString *) colorSpaceString;

@end
