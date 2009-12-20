
#import "TMainMenuController.h"

@implementation TMainMenuController

- (void) logAMenuItem {
	NSMenuItem * item = [mainMenu itemAtIndex:0];
	NSLog(@"%@",item);
}

@end
