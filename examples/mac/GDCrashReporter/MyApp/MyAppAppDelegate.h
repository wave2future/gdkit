
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit.h>

@interface MyAppAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow * window;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction) crash:(id) sender;

@end
