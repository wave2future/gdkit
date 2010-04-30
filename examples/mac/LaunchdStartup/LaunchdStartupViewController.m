
#import "LaunchdStartupViewController.h"

@implementation LaunchdStartupViewController

- (void) onInstall:(id) sender {
	[[NSWorkspace sharedWorkspace] installStartupLaunchdItem:@"Startup.plist"];
}

- (void) onUninstall:(id) sender {
	[[NSWorkspace sharedWorkspace] uninstallStartupLaunchdItem:@"Startup.plist"];
}

@end
