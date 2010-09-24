
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDDrawingUtils.h"

/**
 * @file GDScale3View.
 *
 * Header file for GDScale3View.
 */

/**
 * The GDScale3View is an NSView subclass that uses
 * NSDrawThreePartImage to draw an image.
 */
@interface GDScale3View : NSView <NSCoding> {
	/**
	 * An IBDocument instance when this class is being used in Interface Builder.
	 */
	id document;
	
	/**
	 * The slice size width.
	 */
	float sliceWidth;
	
	/**
	 * The slice size width.
	 */
	float sliceHeight;
	
	/**
	 * A class reference to the IBDocument when this class is being used in Interface Builder.
	 */
	Class IBDocument;
	
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
	 * Whether or not this class is being decoded from an
	 * initWithCoder: initialization.
	 */
	Boolean decoding;
	
	/**
	 * Whether or not NSDrawThreePartImage is drawn vertically.
	 */
	Boolean vertical;
	
	/**
	 * Whether or not NSDrawThreePartImage is drawn horizontally.
	 */
	Boolean horizontal;
	
	/**
	 * Whether or not the cached slice images need to be resliced.
	 */
	Boolean reslice;
	
	/**
	 * Whether or not interface builder is available.
	 */
	Boolean isInInterfaceBuilder;
	
	/**
	 * Indicates that the image name changed and a reslice needs
	 * to happen.
	 */
	Boolean imageNameChanged;
	
	/**
	 * Indicates that the orientation changed and the cached image slices
	 * need to be resliced.
	 */
	Boolean changedOrienation;
	
	/**
	 * The slice size for left/right or top/bottom.
	 */
	NSSize sliceSize;
	
	/**
	 * Cached slices.
	 */
	NSArray * slices;
	
	/**
	 * The source image used with NSDrawThreePartImage.
	 */
	NSImage * sourceImage;
	
	/**
	 * THe last sliced image that was sliced.
	 */
	NSImage * lastSlicedImage;
	
	/**
	 * The source image name used to load an image with [NSImage imageNamed:].
	 */
	NSString * sourceImageName;
}

/**
 * The source image used with NSDrawThreePartImage.
 */
@property (nonatomic,retain) IBOutlet NSImage * sourceImage;

/**
 * The source image name used to load an image with [NSImage imageNamed:].
 */
@property (nonatomic,copy) NSString * sourceImageName;

/**
 * Whether or not NSDrawThreePartImage is drawn vertically.
 */
@property (nonatomic,assign) Boolean vertical;

/**
 * Whether or not NSDrawThreePartImage is drawn horizontally.
 */
@property (nonatomic,assign) Boolean horizontal;

/**
 * The slice size for left/right or top/bottom.
 */
@property (nonatomic,assign) NSSize sliceSize;

/**
 * The slice size width.
 */
@property (nonatomic,assign) float sliceWidth;

/**
 * The slice size height.
 */
@property (nonatomic,assign) float sliceHeight;

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
