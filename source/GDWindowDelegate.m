
#import "GDWindowDelegate.h"
#import "GDExternalNibController.h"

@implementation GDWindowDelegate

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDWindowDelegate\n");
	#endif
	[super dealloc];
}

@end
