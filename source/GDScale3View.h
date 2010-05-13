
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDDrawingUtils.h"

@interface GDScale3View : NSView {
	float sliceWidth;
	float sliceHeight;
	Boolean decoding;
	Boolean vertical;
	Boolean reslice;
	Boolean isInInterfaceBuilder;
	Boolean imageNameChanged;
	NSSize sliceSize;
	NSArray * slices;
	NSImage * sourceImage;
	NSString * sourceImageName;
}

@property (nonatomic,retain) IBOutlet NSImage * sourceImage;
@property (nonatomic,copy) NSString * sourceImageName;
@property (nonatomic,assign) Boolean vertical;
@property (nonatomic,assign) NSSize sliceSize;
@property (nonatomic,assign) float sliceWidth;
@property (nonatomic,assign) float sliceHeight;

@end
