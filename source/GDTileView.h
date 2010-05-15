
#import <Cocoa/Cocoa.h>
#import "macros.h"

@interface GDTileView : NSView {
	id document;
	Boolean decoding;
	Boolean imageNameChanged;
	Boolean isInInterfaceBuilder;
	Class IBDocument;
	NSFileManager * fileManager;
	NSBundle * gdKitIBBundle;
	NSImage * tileImage;
	NSString * tileImageName;
}

@property (nonatomic,retain) IBOutlet NSImage * tileImage;
@property (nonatomic,copy) NSString * tileImageName;

@end
