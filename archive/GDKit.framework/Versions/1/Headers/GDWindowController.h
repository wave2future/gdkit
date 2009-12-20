
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit.h>

@interface GDWindowController : GDBaseObject {
	NSWindow * mainWindow;
}

@property (assign,nonatomic) IBOutlet NSWindow * mainWindow;

@end
