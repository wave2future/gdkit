
#import <Cocoa/Cocoa.h>
#import "macros.h"

/**
 * @file GDGradientBoxView.h
 *
 * Header file for GDGradientBoxView.
 */

/**
 * The GDGradientBoxView is an NSView subclass that draws
 * a gradient.
 */
@interface GDGradientBoxView : NSView {
	
	/**
	 * Whether or not this class is being decoded from an
	 * initWithCoder: initialization.
	 */
	Boolean decoding;
	
	/**
	 * A flag to keep track of whether or not the angle was
	 * ever set, otherwise the gradient is drawn with an 0 angle.
	 */
	Boolean hasUpdatedAngle;
	
	/**
	 * Whether or not the gradient should be recreated because
	 * one of the colors was updated.
	 */
	Boolean recreateGradient;
	
	/**
	 * The gradient.
	 */
	NSGradient * gradient;
	
	/**
	 * First color.
	 */
	NSColor * color1;
	
	/**
	 * Second color.
	 */
	NSColor * color2;
	
	/**
	 * The angle to draw the gradient at (default is 90).
	 */
	int angle;
}

/**
 * The angle to draw the gradient at (default is 90).
 */
@property (nonatomic,assign) int angle;

/**
 * The gradient.
 */
@property (nonatomic,copy) NSGradient * gradient;

/**
 * First color.
 */
@property (nonatomic,copy) NSColor * color1;

/**
 * Second color.
 */
@property (nonatomic,copy) NSColor * color2;

@end
