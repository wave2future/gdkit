
#import "TExternalNibTest.h"

@implementation TExternalNibTest

- (IBAction) testPopSound:(id) sender {
	[[gd sounds] pop];
}

- (IBAction) switchToWindow:(id) sender {
	[self setDisposesNibsOnEscapeKey:false andDisposesNibsOnWindowClose:true];
	[self show];
}

- (IBAction) switchToSheet:(id) sender {
	[self setDisposesNibsOnEscapeKey:true andDisposesNibsOnWindowClose:true];
	[self showAsSheetForWindow:[[gd wins] mainWindow]];
}

@end
