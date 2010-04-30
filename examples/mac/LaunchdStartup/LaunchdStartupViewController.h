
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit-Mac.h>

@interface LaunchdStartupViewController : NSViewController {
	IBOutlet NSButton * install;
	IBOutlet NSButton * uninstall;
}

- (IBAction) onInstall:(id) sender;
- (IBAction) onUninstall:(id) sender;

@end
