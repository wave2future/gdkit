
#import <Cocoa/Cocoa.h>
#import "macros.h"

@interface GDGradientBoxView : NSView {
	Boolean decoding;
	Boolean hasUpdatedAngle;
	Boolean recreateGradient;
	NSGradient * gradient;
	NSColor * color1;
	NSColor * color2;
	int angle;
}

@property (nonatomic,assign) int angle;
@property (nonatomic,copy) NSGradient * gradient;
@property (nonatomic,copy) NSColor * color1;
@property (nonatomic,copy) NSColor * color2;

@end
