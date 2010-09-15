
#import "MyAppAppDelegate.h"

@implementation MyAppAppDelegate
@synthesize window;

- (void) applicationDidFinishLaunching:(NSNotification *) aNotification {
	
}

- (IBAction) crash:(id) sender {
	abort();
}

@end
