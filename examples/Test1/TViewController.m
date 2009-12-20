
#import "TViewController.h"

@implementation TViewController
@synthesize customView1;

- (void) showCustomView1 {
	[customView1 showInView:[[gd window] contentView]];
}

@end
