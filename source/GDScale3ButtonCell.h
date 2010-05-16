
#import <Cocoa/Cocoa.h>
#import "GDDrawingUtils.h"
#import "GDScale3Button.h"
#import "macros.h"

/**
 * @file GDScale3ButtonCell.h
 *
 * Header file for GDScale3ButtonCell.
 */

/**
 * @class GDScale3ButtonCell
 *
 * The GDScale3ButtonCell is a subclass of NSButtonCell used
 * to implement the drawing for GDScale3Button instances.
 */
@interface GDScale3ButtonCell : NSButtonCell <NSCoding> {
	
	/**
	 * An IBDocument instance when this class is being used in Interface Builder.
	 */
	id document;
	
	/**
	 * The slice size width.
	 */
	float sliceSizeWidth;
	
	/**
	 * The slice size height.
	 */
	float sliceSizeHeight;
	
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
	 * Whether or not NSDrawThreePartImage is drawn vertically.
	 */
	Boolean vertical;
	
	/**
	 * Whether or not NSDrawThreePartImage is drawn horizontally.
	 */
	Boolean horizontal;
	
	/**
	 * Indicates that the orientation changed and the cached image slices
	 * need to be resliced.
	 */
	Boolean changedOrientation;
	
	/**
	 * The slice size for left/right or top/bottom.
	 */
	NSSize sliceSize;
	
	/**
	 * A bundle reference to the gdmkit mac ib additions bundle used
	 * when running in interface builder.s
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
	 * THe up image.
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
 * The up image name used to load the down image with [NSImage imageNamed:].
 */
@property (nonatomic,copy) NSString * upImageName;

/**
 * The down image name used to load the down image with [NSImage imageNamed:].
 */
@property (nonatomic,copy) NSString * downImageName;

/**
 * The slice size.
 */
@property (nonatomic,assign) NSSize sliceSize;

/**
 * The slice size width.
 */
@property (nonatomic,assign) float sliceSizeWidth;

/**
 * The slice size height.
 */
@property (nonatomic,assign) float sliceSizeHeight;

/**
 * Whether or not NSDrawThreePartImage is drawn vertically.
 */
@property (nonatomic,assign) Boolean vertical;

/**
 * Whether or not NSDrawThreePartImage is drawn horizontally.
 */
@property (nonatomic,assign) Boolean horizontal;

/**
 * Set the default slice size width. This is used if there is
 * no slice size set.
 */
+ (void) setDefaultSliceSizeWidth:(int) width;

/**
 * Set the default slice size height. This is used if there is
 * no slice size set.
 */
+ (void) setDefaultSliceSizeHeight:(int) height;

/**
 * The default slice size width. This is used if there is no
 * slice size set.
 */
+ (int) defaultSliceSizeWidth;

/**
 * The default slice size height. This is used if there is no
 * slice size set.
 */
+ (int) defaultSliceSizeHeight;

@end
