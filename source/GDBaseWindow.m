
#import "GDBaseWindow.h"
#import "GDDocument.h"
#import "GDApplicationController.h"

@implementation GDBaseWindow
@synthesize gd;
@synthesize externalNibController;

- (void) awakeFromNib{}
- (void) setGDRefs{}
- (void) lazyInit{}

- (void) lazyInitWithGDDocument:(GDDocument *) _gd {
	GDRelease(gd);
	gd=[_gd retain];
	[self setGDRefs];
	[self lazyInit];
}

- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController {
	GDRelease(gd);
	gd=[_appController retain];
	[self setGDRefs];
	[self lazyInit];
}

- (void) keyDown:(NSEvent *) theEvent {
	if([self delegate] not nil) [GDResponderHelper ifIsEscapeKey:theEvent sendAction:@selector(onEscapeKey:) toTarget:[self delegate]];
	[super keyDown:theEvent];
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDBaseWindow\n");
	#endif
	GDRelease(gd);
	GDRelease(externalNibController);
	[super dealloc];
}

@end
