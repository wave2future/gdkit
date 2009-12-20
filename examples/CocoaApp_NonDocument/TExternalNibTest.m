
#import "TExternalNibTest.h"

@implementation TExternalNibTest

- (IBAction) testPopSound:(id) sender {
	[[gd sounds] pop];
}

- (IBAction) switchToWindow:(id) sender {
	[self show];
}

- (IBAction) switchToSheet:(id) sender {
	[self showAsSheetForWindow:[[gd wins] mainWindow]];
}

@end
