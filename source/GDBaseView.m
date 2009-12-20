
#import "GDBaseView.h"

@implementation GDBaseView
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

- (void) showInView:(NSView *) view {
	[view addSubview:self];
}

- (void) showMaximizedInView:(NSView *) view {
	NSRect newFrame=[view frame];
	[self setFrame:newFrame];
	[view addSubview:self];
}

- (void) showInView:(NSView *) view withAdjustments:(NSRect) _adjust {
	NSRect newFrame=[view frame];
	newFrame.size.width+=_adjust.size.width;
	newFrame.size.width+=_adjust.size.height;
	newFrame.origin.x+=_adjust.origin.x;
	newFrame.origin.y+=_adjust.origin.y;
	[self setFrame:newFrame];
	[view addSubview:self];
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDBaseView\n");
	#endif	
	GDRelease(gd);
	GDRelease(externalNibController);
	[super dealloc];
}

@end
