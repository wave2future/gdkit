
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit.h>

@interface CrashReporterAppDelegate : NSObject <NSApplicationDelegate,GDCrashReporterDelegate> {
	NSWindow *window;
	GDCrashReporter * crashReporter;
}

@property (assign) IBOutlet NSWindow *window;

- (void) crash:(id) sender;

@end
