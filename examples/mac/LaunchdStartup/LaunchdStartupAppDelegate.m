
#import "LaunchdStartupAppDelegate.h"

@implementation LaunchdStartupAppDelegate

@synthesize window;

- (void) applicationDidFinishLaunching:(NSNotification *) aNotification {
	LaunchdStartupViewController * vc = [[LaunchdStartupViewController alloc] initWithNibName:@"LaunchdView" bundle:nil];
	[[window contentView] addSubview:[vc view]];
}

@end
