
#import "TViewController.h"

@implementation TViewController
@synthesize customView1;

- (void) showCustomView1 {
	NSWindow * mainWindow = [[gd wins] mainWindow];
	[customView1 showInView:[mainWindow contentView]];
}

@end
