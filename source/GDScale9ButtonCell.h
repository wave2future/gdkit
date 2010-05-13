
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDPrintUtils.h"
#import "GDDrawingUtils.h"

@interface GDScale9ButtonCell : NSButtonCell {
	float cornerSizeWidth;
	float cornerSizeHeight;
	Boolean decoding;
	Boolean reslice;
	Boolean upImageNameChanged;
	Boolean downImageNameChanged;
	NSSize cornerSize;
	NSString * upImageName;
	NSString * downImageName;
	NSArray * upSlices;
	NSArray * downSlices;
	NSArray * sourceSlices;
	NSImage * upImage;
	NSImage * downImage;
}

@property (nonatomic,retain) NSImage * upImage;
@property (nonatomic,retain) NSImage * downImage;
@property (nonatomic,copy) NSString * upImageName;
@property (nonatomic,copy) NSString * downImageName;
@property (nonatomic,assign) NSSize cornerSize;
@property (nonatomic,assign) float cornerSizeWidth;
@property (nonatomic,assign) float cornerSizeHeight;

@end
