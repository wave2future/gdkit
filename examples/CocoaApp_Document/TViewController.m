
#import "TViewController.h"

@implementation TViewController
@synthesize customView;

- (void) showCustomView {
	NSView * contentView = [[[gd wins] mainWindow] contentView];
	[customView showInView:contentView];
}

- (void) dealloc {
	GDRelease(customView);
	[super dealloc];
}

@end
