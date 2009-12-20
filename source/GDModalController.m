
#import "GDModalController.h"

@implementation GDModalController

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("deallog GDModalController\n");
	#endif
	[super dealloc];
}

@end
