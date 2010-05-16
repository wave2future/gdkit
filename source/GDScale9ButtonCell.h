
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDPrintUtils.h"
#import "GDDrawingUtils.h"

/**
 * @file GDScale9ButtonCell.h
 *
 * Header file for GDScale9ButtonCell.
 */

/**
 * @class GDScale9ButtonCell
 *
 * The GDScale9ButtonCell is a subclass of NSButtonCell used
 * to implement the drawing for GDScale9Button instances.
 */
@interface GDScale9ButtonCell : NSButtonCell {
	
	/**
	 * An IBDocument instance when this class is being used in Interface Builder.
	 */
	id document;
	
	/**
	 * The corner size width.
	 */
	float cornerSizeWidth;
	
	/**
	 * The corner size height.
	 */
	float cornerSizeHeight;
	
	/**
	 * A class reference to the IBDocument when this class is being used in Interface Builder.
	 */
	Class IBDocument;
	
	/**
	 * Whether or not interface builder is available.
	 */
	Boolean isInInterfaceBuilder;
	
	/**
	 * Whether or not this class is being decoded from an
	 * initWithCoder: initialization.
	 */
	Boolean decoding;
	
	/**
	 * Whether or not the cached slice images need to be resliced.
	 */
	Boolean reslice;
	
	/**
	 * Whether or not the cached up slices need to be resliced.
	 */
	Boolean resliceUp;
	
	/**
	 * Whether or not the cached down slices need to be resliced.
	 */
	Boolean resliceDown;
	
	/**
	 * Inidicates that the up image name changed, and should initiate
	 * a reslice.
	 */
	Boolean upImageNameChanged;
	
	/**
	 * Indicates that the down image name changed, and should initiate
	 * a reslice.
	 */
	Boolean downImageNameChanged;
	
	/**
	 * The corner size for the top left, top right, bottom left, and top right
	 * rectangles.
	 */
	NSSize cornerSize;
	
	/**
	 * A bundle reference to the gdmkit mac ib additions bundle used
	 * when running in interface builder.
	 */
	NSBundle * gdKitIBBundle;
	
	/**
	 * Default file manager reference.
	 */
	NSFileManager * fileManager;
	
	/**
	 * The up image name used to load the up image with [NSImage imageNamed:].
	 */
	NSString * upImageName;
	
	/**
	 * The down image name used to load the down image with [NSImage imageNamed:].
	 */
	NSString * downImageName;
	
	/**
	 * Cached slices from the up image.
	 */
	NSArray * upSlices;
	
	/**
	 * Cached slices from the down image.
	 */
	NSArray * downSlices;
	
	/**
	 * The source slices to draw.
	 */
	NSArray * sourceSlices;
	
	/**
	 * The up image.
	 */
	NSImage * upImage;
	
	/**
	 * The down image.
	 */
	NSImage * downImage;
	
	/**
	 * The last image that was sliced for the up state.
	 */
	NSImage * lastUpSlicedImage;
	
	/**
	 * The last image that was sliced for the down state.
	 */
	NSImage * lastDownSlicedImage;
}

/**
 * The up image.
 */
@property (nonatomic,retain) NSImage * upImage;

/**
 * The down image.
 */
@property (nonatomic,retain) NSImage * downImage;

/**
 * The up image name used to load the up image with [NSImage imageNamed:].
 */
@property (nonatomic,copy) NSString * upImageName;

/**
 * The down image name used to load the down image with [NSImage imageNamed:].
 */
@property (nonatomic,copy) NSString * downImageName;

/**
 * The corner size for the top left, top right, bottom left, and top right
 * rectangles.
 */
@property (nonatomic,assign) NSSize cornerSize;

/**
 * The corner size width.
 */
@property (nonatomic,assign) float cornerSizeWidth;

/**
 * The corner size height.
 */
@property (nonatomic,assign) float cornerSizeHeight;

/**
 * Set the default corner size width. This is used if there is
 * no corner size set.
 */
+ (void) setDefaultCornerWidth:(int) width;

/**
 * Set the default corner size height. This is used if there is
 * no corner size set.
 */
+ (void) setDefaultCornerHeight:(int) height;

/**
 * The default corner size width. This is used if there is no
 * corner size set.
 */
+ (int) defaultCornerWidth;

/**
 * The default corner size height. This is used if there is no
 * corner size set.
 */
+ (int) defaultCornerHeight;

@end
