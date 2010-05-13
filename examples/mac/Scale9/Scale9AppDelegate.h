
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit.h>

@interface Scale9AppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow * window;
	GDScale9Button * button;
}

@property (assign) IBOutlet NSWindow * window;
@property (nonatomic,retain) IBOutlet GDScale9Button * button;

@end
