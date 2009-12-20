
#import "GDApplicationDelegate.h"
#import "GDApplicationController.h"

@implementation GDApplicationDelegate

- (void) applicationDidFinishLaunching:(NSNotification *) notification {
	[gd initApplication];
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDApplicationDelegate\n");
	#endif
	[super dealloc];
}

@end
