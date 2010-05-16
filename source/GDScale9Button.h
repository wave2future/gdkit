
#import <Cocoa/Cocoa.h>
#import "GDScale9ButtonCell.h"

/**
 * @file GDScale9Button.h
 *
 * Header file for GDScale9Button
 */

/**
 * @class GDScale9Button
 *
 * The GDScale9Button uses source image, and optional down image
 * to draw the button bezel with NSDrawNinePartImage.
 */
@interface GDScale9Button : NSButton {
}

/**
 * Set the corner size for top left, top right, bottom left, and bottom right
 * rectangles.
 */
- (void) setCornerSize:(NSSize) _size;

/**
 * Set the image for the normal up state.
 */
- (void) setUpImage:(NSImage *) _image;

/**
 * Set the image for the down state.
 */
- (void) setDownImage:(NSImage *) _image;

/**
 * Set the down image name used to load an image with [NSImage imageNamed:].
 */
- (void) setDownImageName:(NSString *) _downImageName;

/**
 * Set the up image name used to load an image with [NSImage imageNamed:].
 */
- (void) setUpImageName:(NSString *) _upImageName;

/**
 * Set the corner size width.
 */
- (void) setCornerSizeWidth:(float) _width;

/**
 * Set the corner size height.
 */
- (void) setCornerSizeHeight:(float) _height;

/**
 * The corner size width.
 */
- (float) cornerSizeWidth;

/**
 * The corner size height.
 */
- (float) cornerSizeHeight;

/**
 * The corner size.
 */
- (NSSize) cornerSize;

/**
 * The up image.
 */
- (NSImage *) upImage;

/**
 * The down image.
 */
- (NSImage *) downImage;

/**
 * The up image name.
 */
- (NSString *) upImageName;

/**
 * The down image name.
 */
- (NSString *) downImageName;

@end
