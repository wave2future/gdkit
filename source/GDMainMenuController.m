
#import "GDMainMenuController.h"
#import "GDBaseObject.h"

@implementation GDMainMenuController

- (id) init {
	self=[super init];
	NSApplication * app=[NSApplication sharedApplication];
	mainMenu=[app mainMenu];
	return self;
}

- (void) invalidate {
	NSLog(@"invalidate");
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDMainMenuController\n");
	#endif
	[super dealloc];
}

@end
