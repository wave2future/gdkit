
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "NSImage+Additions.h"

/**
 * @file GDTileView.h
 *
 * Header file for GDTileView.
 */

/**
 * @class GDTileView
 *
 * The GDTileView is an NSView subclass that draws a tile image
 * repeatedly within it's bounds.
 */
@interface GDTileView : NSView <NSCoding> {
	
	/**
	 * An IBDocument instance when this class is being used in Interface Builder.
	 */
	id document;
	
	/**
	 * Whether or not this class is being decoded from an
	 * initWithCoder: initialization.
	 */
	Boolean decoding;
	
	/**
	 * Indicated that the image name changed and a reslice needs
	 * to happen.
	 */
	Boolean imageNameChanged;
	
	/**
	 * Whether or not interface builder is available.
	 */
	Boolean isInInterfaceBuilder;
	
	/**
	 * A class reference to the IBDocument when this class is being used in Interface Builder.
	 */
	Class IBDocument;
	
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
	 * The image to use as the tile.
	 */
	NSImage * tileImage;
	
	/**
	 * The image name used to load an image with [NSImage imageNamed:].
	 */
	NSString * tileImageName;
}

/**
 * The image to use as the tile.
 */
@property (nonatomic,retain) IBOutlet NSImage * tileImage;

/**
 * The image name used to load an image with [NSImage imageNamed:].
 */
@property (nonatomic,copy) NSString * tileImageName;

@end
