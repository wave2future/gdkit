//copyright 2009 aaronsmith

#import "GDMainMenuController.h"

@implementation GDMainMenuController

- (id) init {
	if(!(self = [super init]))return nil;
	NSApplication * app = [NSApplication sharedApplication];
	mainMenu = [app mainMenu];
	return self;
}

- (void) invalidate {
	#ifdef GDKIT_METHOD_CALLS
	NSLog(@"invalidate");
	#endif
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDMainMenuController\n");
	#endif
	[super dealloc];
}

@end
