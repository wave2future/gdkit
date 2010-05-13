
#import <Cocoa/Cocoa.h>
#import "macros.h"

@interface GDTileView : NSView {
	Boolean decoding;
	Boolean hasTileImageNameChanged;
	NSImage * tileImage;
	NSString * tileImageName;
}

@property (nonatomic,retain) IBOutlet NSImage * tileImage;
@property (nonatomic,copy) NSString * tileImageName;

@end
