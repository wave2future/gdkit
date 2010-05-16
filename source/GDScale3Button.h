
#import <Cocoa/Cocoa.h>

/**
 * @file GDScale3Button.h
 *
 * Header file for GDScale3Button.
 */

/**
 * @class GDScale3Button
 *
 * The GDScale3Button uses source image, and optional down image
 * to draw the button bezel with NSDrawThreePartImage.
 */
@interface GDScale3Button : NSButton {
}

/**
 * [internal] Manually triggers key-value observing mechanisms for any property.
 */
- (void) triggerObserverNotificationForProperty:(NSString *) _property;

/**
 * Set the slice sice. When the button is drawn horizontally,
 * the size for the left and right slices use sliceSize.width.
 * When the button is drawn vertically, the size for the top and
 * bottom slices use sliceSize.height.
 *
 * @param _size An NSSize for slice width or height information.
 */
- (void) setSliceSize:(NSSize) _size;

/**
 * Set the source image for the normal up state.
 *
 * @param _image An NSImage to use as the up state.
 */
- (void) setUpImage:(NSImage *) _image;

/**
 * Set the source image for the down state.
 * 
 * @param _image An NSImage to use as the down state.
 */
- (void) setDownImage:(NSImage *) _image;

/**
 * Set the down image name to load using [NSImage imageNamed:].
 * 
 * @param _downImageName The down image name.
 */
- (void) setDownImageName:(NSString *) _downImageName;

/**
 * Set the up image name to load using [NSImage imageNamed:].
 * 
 * @param _upImageName The up image name.
 */
- (void) setUpImageName:(NSString *) _upImageName;

/**
 * Set just the slice sizes' width.
 *
 * @param _width The slice size width.
 */
- (void) setSliceSizeWidth:(float) _width;

/**
 * Set just the slice sizes' height.
 * 
 * @param _height The slice size height.
 */
- (void) setSliceSizeHeight:(float) _height;

/**
 * Set whether or not the NSDrawThreePartImage is
 * drawing vertically.
 *
 * @param _vertical The vertical flag.
 */
- (void) setVertical:(Boolean) _vertical;

/**
 * Set whether or not the NSDrawThreePartImage is
 * drawing horizontally.
 * 
 * @param _horizontal The horizontal flag.
 */
- (void) setHorizontal:(Boolean) _horizontal;

/**
 * The slice size width.
 */
- (float) sliceSizeWidth;

/**
 * The slice size height.
 */
- (float) sliceSizeHeight;

/**
 * Whether or not the NSDrawThreePartImage is drawn vertically.
 */
- (Boolean) vertical;

/**
 * Whether or not the NSDrawThreePartImage is drawn horizontally.
 */
- (Boolean) horizontal;

/**
 * The slice size.
 */
- (NSSize) sliceSize;

/**
 * The up state image.
 */
- (NSImage *) upImage;

/**
 * The down state image.
 */
- (NSImage *) downImage;

/**
 * The up image name used to load the up image with [NSImage imageNamed:].
 */
- (NSString *) upImageName;

/**
 * The down image name used to load the up image with [NSImage imageNamed:].
 */
- (NSString *) downImageName;

@end
