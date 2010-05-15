
#import <Cocoa/Cocoa.h>
#import "GDDrawingUtils.h"
#import "macros.h"

@interface GDScale3ButtonCell : NSButtonCell {
	id document;
	float sliceSizeWidth;
	float cornerSizeHeight;
	Class IBDocument;
	Boolean isInInterfaceBuilder;
	Boolean decoding;
	Boolean reslice;
	Boolean resliceUp;
	Boolean resliceDown;
	Boolean upImageNameChanged;
	Boolean downImageNameChanged;
	Boolean vertical;
	Boolean changedOrientation;
	NSSize sliceSize;
	NSBundle * gdKitIBBundle;
	NSFileManager * fileManager;
	NSString * upImageName;
	NSString * downImageName;
	NSArray * upSlices;
	NSArray * downSlices;
	NSArray * sourceSlices;
	NSImage * upImage;
	NSImage * downImage;
	NSImage * lastUpSlicedImage;
	NSImage * lastDownSlicedImage;
}

@property (nonatomic,retain) NSImage * upImage;
@property (nonatomic,retain) NSImage * downImage;
@property (nonatomic,copy) NSString * upImageName;
@property (nonatomic,copy) NSString * downImageName;
@property (nonatomic,assign) NSSize sliceSize;
@property (nonatomic,assign) float sliceSizeWidth;
@property (nonatomic,assign) float sliceSizeHeight;
@property (nonatomic,assign) Boolean vertical;

+ (void) setDefaultSliceSizeWidth:(int) width;
+ (void) setDefaultSliceSizeHeight:(int) height;
+ (int) defaultSliceSizeWidth;
+ (int) defaultSliceSizeHeight;

@end
