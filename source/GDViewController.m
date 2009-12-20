
#import "GDViewController.h"

@implementation GDViewController

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDViewController\n");
	#endif
	GDRelease(lastLoadedNibName);
	[super dealloc];
}

- (void) loadViewsInNibNamed:(NSString *) _nibName {
	lastLoadedNibName=[_nibName copy];
	[NSBundle loadNibNamed:_nibName owner:self];
}

@end
