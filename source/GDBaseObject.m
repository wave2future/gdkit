
#import "GDBaseObject.h"

@implementation GDBaseObject
@synthesize gd;
@synthesize externalNibController;

- (void) awakeFromNib{}
- (void) setGDRefs{}
- (void) lazyInit{}

- (id) init {
	self=[super init];
	return self;
}

- (id) initWithGDDocument:(GDDocument *) _gd {
	self=[self init];
	gd=[_gd retain];
	[self setGDRefs];
	[self lazyInit];
	return self;
}

- (id) initWithGDApplicationController:(GDApplicationController *) _appController {
	self=[self init];
	gd=[_appController retain];
	[self setGDRefs];
	[self lazyInit];
	return self;
}

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

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDBaseObject\n");
	#endif
	GDRelease(gd);
	GDRelease(externalNibController);
	[super dealloc];
}

@end
