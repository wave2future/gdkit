#import <Cocoa/Cocoa.h>

#define kGDMaxDisplays 32

/**
 * GDDisplay represents a single display attached
 * to the computer.
 */
@interface GDQuartzDisplay : NSObject {
	CGDirectDisplayID displayId;
}

/**
 * Returns an array of CGQuartzDisplay instances which
 * are all of the active displays attached.
 * This is displays that can be drawn to.
 */
+ (NSMutableArray *) activeDisplays;

/**
 * Returns an array of CGQuartzDisplay instances which
 * are all of the online displays (active, mirrored, or sleeping).
 */
+ (NSMutableArray *) onlineDisplays;

/**
 * Returns the display that is considered the "Main Display",
 * this is the display id associated with CGMainDisplayID.
 */
+ (GDQuartzDisplay *) mainDisplay;

/**
 * Initializes a GDQuartzDisplay from a point - it
 * uses this point to find the display that contains that point.
 */
- (id) initWithPoint:(NSPoint) point;

/**
 * Initializes a GDQuartzDisplay from a rect - it
 * uses this rect to find the display that contains that rect.
 */
- (id) initWithRect:(NSRect) rect;

/**
 * Initialize a GDQuartzDisplay from a CGDirectDisplayID.
 */
- (id) initWithDirectDisplayID:(CGDirectDisplayID) ddid;

/**
 * Check if this display is the main display.
 */
- (Boolean) isMainDisplay;

/**
 * Check whether or not an NSSize is considered fullscreen
 * in this display's size.
- (Boolean) isSizeWindowedFullscreen:(NSSize) size; */

/**
 * Whether or not this display is active.
 * (drawable)
 */
- (Boolean) isActive;

/**
 * Whether or not this display is always in a mirrored set.
 */
- (Boolean) isAlwaysInMirrorSet;

/**
 * Whether or not this display is sleeping.
 */
- (Boolean) isSleeping;

/**
 * Whether or not this display is in a mirrored set.
 */
- (Boolean) isInMirrorSet;

/**
 * Whether or not this display is online.
 * (active, mirrored, or sleeping).
 */
- (Boolean) isOnline;

/**
 * Whether or not this display is running stereo
 * graphics mode.
 */
- (Boolean) isStereo;

/**
 * Whether or not this display is the primary display
 * in a mirror set.
 */
- (Boolean) isPrimaryDisplayInMirrorSet;

/**
 * The display that this display is mirroring (check against
 * isInMirrorSet).
 */
- (GDQuartzDisplay *) mirrorsDisplay;

/**
 * Get the primary display from a mirror set.
 */
- (GDQuartzDisplay *) primaryDisplay;

/**
 * Get the display rotation.
 */
- (double) rotation;

/**
 * Get's the display size in millimeters.
 */
- (NSSize) millimeterSize;

/**
 * Get's the display size in pixels.
 */
- (NSSize) pixelSize;

/**
 * Whether or not this display uses OpenGL acceleration.
 */
- (Boolean) usesOpenGLAcceleration;

@end
