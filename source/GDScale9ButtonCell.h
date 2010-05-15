
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDPrintUtils.h"
#import "GDDrawingUtils.h"

@interface GDScale9ButtonCell : NSButtonCell {
	id document;
	float cornerSizeWidth;
	float cornerSizeHeight;
	Class IBDocument;
	Boolean isInInterfaceBuilder;
	Boolean decoding;
	Boolean reslice;
	Boolean resliceUp;
	Boolean resliceDown;
	Boolean upImageNameChanged;
	Boolean downImageNameChanged;
	NSSize cornerSize;
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
@property (nonatomic,assign) NSSize cornerSize;
@property (nonatomic,assign) float cornerSizeWidth;
@property (nonatomic,assign) float cornerSizeHeight;

+ (void) setDefaultCornerWidth:(int) width;
+ (void) setDefaultCornerHeight:(int) height;
+ (int) defaultCornerWidth;
+ (int) defaultCornerHeight;

@end
