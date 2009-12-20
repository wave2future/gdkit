
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
	gd=_gd;
	[self setGDRefs];
	[self lazyInit];
}

- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController {
	gd=_appController;
	[self setGDRefs];
	[self lazyInit];
}

- (void) keyDown:(NSEvent *) theEvent {
	if([self delegate] not nil and [[self delegate] respondsToSelector:@selector(onEscapeKey:)]) {
		[GDResponderHelper ifIsEscapeKey:theEvent sendAction:@selector(onEscapeKey:) toTarget:[self delegate]];
		[super keyDown:theEvent];
		return;
	}
	if([self respondsToSelector:@selector(onEscapeKey:)]) [GDResponderHelper ifIsEscapeKey:theEvent sendAction:@selector(onEscapeKey:) toTarget:[self self]];
	[super keyDown:theEvent];
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDBaseWindow\n");
	#endif
	[super dealloc];
}

@end
