
#import "GDBaseResponder.h"
#import "GDDocument.h"
#import "GDApplicationController.h"

@implementation GDBaseResponder

- (void) awakeFromNib{}
- (void) setGDRefs{}
- (void) lazyInit{}

- (id) init {
	self=[super init];
	return self;
}

- (void) keyDown:(NSEvent *) theEvent {
	[GDResponderHelper ifIsEscapeKey:theEvent sendAction:@selector(onEscapeKey:) toTarget:self];
	[super keyDown:theEvent];
}

- (void) lazyInitWithGDDocument:(GDDocument *) _gd {
	gd=[_gd retain];
	[self setGDRefs];
	[self lazyInit];
}

- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController {
	gd=[_appController retain];
	[self setGDRefs];
	[self lazyInit];
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDBaseResponder\n");
	#endif
	GDRelease(gd);
	[super dealloc];
}

@end
