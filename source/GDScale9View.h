
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDPrintUtils.h"
#import "GDDrawingUtils.h"

@interface GDScale9View : NSView {
	id document;
	float cornerSizeWidth;
	float cornerSizeHeight;
	Class IBDocument;
	Boolean decoding;
	Boolean imageNameChanged;
	Boolean reslice;
	Boolean isInInterfaceBuilder;
	NSFileManager * fileManager;
	NSBundle * gdKitIBBundle;
	NSSize cornerSize;
	NSString * sourceImageName;
	NSArray * slices;
	NSImage * sourceImage;
	NSImage * lastSlicedImage;
}

@property (nonatomic,retain) IBOutlet NSImage * sourceImage;
@property (nonatomic,copy) NSString * sourceImageName;
@property (nonatomic,assign) NSSize cornerSize;
@property (nonatomic,assign) float cornerSizeWidth;
@property (nonatomic,assign) float cornerSizeHeight;

+ (int) defaultCornerWidth;
+ (int) defaultCornerHeight;
+ (void) setDefaultCornerWidth:(int) width;
+ (void) setDefaultCornerHeight:(int) height;

@end
