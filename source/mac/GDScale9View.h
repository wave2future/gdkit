
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDPrintUtils.h"
#import "GDDrawingUtils.h"

/**
 * @file GDScale9View.h
 *
 * Header file for GDScale9View.
 */

/**
 * The GDScale9View is an NSView subclass that uses
 * NSDrawNinePartImage to draw an image.
 */
@interface GDScale9View : NSView {
	
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
	 * Whether or not this class is being decoded from an
	 * initWithCoder: initialization.
	 */
	Boolean decoding;
	
	/**
	 * Indicates that the image name changed and a reslice needs
	 * to happen.
	 */
	Boolean imageNameChanged;
	
	/**
	 * Whether or not the cached slice images need to be resliced.
	 */
	Boolean reslice;
	
	/**
	 * Whether or not interface builder is available.
	 */
	Boolean isInInterfaceBuilder;
	
	/**
	 * Default file manager reference.
	 */
	NSFileManager * fileManager;
	
	/**
	 * A bundle reference to the gdmkit mac ib additions bundle used
	 * when running in interface builder.
	 */
	NSBundle * gdKitIBBundle;
	
	/**
	 * The corner size for the top left, top right, bottom left, and top right
	 * rectangles.
	 */
	NSSize cornerSize;
	
	/**
	 * The source image name used to load an image with [NSImage imageNamed:].
	 */
	NSString * sourceImageName;
	
	/**
	 * Cached slices for drawing with NSDrawNinePartImage.
	 */
	NSArray * slices;
	
	/**
	 * The source image that's sliced up for NSDrawNinePartImage.
	 */
	NSImage * sourceImage;
	
	/**
	 * The last sliced image.
	 */
	NSImage * lastSlicedImage;
}

/**
 * The source image that's sliced up for NSDrawNinePartImage.
 */
@property (nonatomic,retain) IBOutlet NSImage * sourceImage;

/**
 * The source image name used to load an image with [NSImage imageNamed:].
 */
@property (nonatomic,copy) NSString * sourceImageName;

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
