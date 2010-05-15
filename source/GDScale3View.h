
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDDrawingUtils.h"

@interface GDScale3View : NSView {
	id document;
	float sliceWidth;
	float sliceHeight;
	Class IBDocument;
	NSBundle * gdKitIBBundle;
	NSFileManager * fileManager;
	Boolean decoding;
	Boolean vertical;
	Boolean reslice;
	Boolean isInInterfaceBuilder;
	Boolean imageNameChanged;
	Boolean changedOrienation;
	NSSize sliceSize;
	NSArray * slices;
	NSImage * sourceImage;
	NSImage * lastSlicedImage;
	NSString * sourceImageName;
}

@property (nonatomic,retain) IBOutlet NSImage * sourceImage;
@property (nonatomic,copy) NSString * sourceImageName;
@property (nonatomic,assign) Boolean vertical;
@property (nonatomic,assign) NSSize sliceSize;
@property (nonatomic,assign) float sliceWidth;
@property (nonatomic,assign) float sliceHeight;

+ (void) setDefaultSliceSizeWidth:(int) width;
+ (void) setDefaultSliceSizeHeight:(int) height;
+ (int) defaultSliceSizeWidth;
+ (int) defaultSliceSizeHeight;

@end
