
#import "GDWindowController.h"

@implementation GDWindowController
@synthesize mainWindow;

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDWindowController\n");
	#endif
	if([mainWindow retainCount] > 1) GDRelease(mainWindow);
	[super dealloc];
}

@end