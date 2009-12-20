
#import "GDViewController.h"

@implementation GDViewController

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDViewController\n");
	#endif
	[super dealloc];
}

@end
