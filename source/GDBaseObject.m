
#import "GDBaseObject.h"

@implementation GDBaseObject
@synthesize gd;
@synthesize externalNibController;

- (void) awakeFromNib{}
- (void) setGDRefs{}
- (void) lazyInit{}

- (id) init {
	self=[super init];
	#ifdef GDKIT_METHOD_CALLS
	printf("[GDBaseObject init]\n");
	#endif
	return self;
}

- (id) initWithGDDocument:(GDDocument *) _gd {
	self=[self init];
	#ifdef GDKIT_METHOD_CALLS
	printf("[GDBaseObject initWithGDDocument:]\n");
	#endif
	gd=_gd;
	[self setGDRefs];
	[self lazyInit];
	return self;
}

- (id) initWithGDApplicationController:(GDApplicationController *) _appController {
	self=[self init];
	#ifdef GDKIT_METHOD_CALLS
	printf("[GDBaseObject initWithGDApplicationController:]\n");
	#endif
	gd=[_appController retain];
	gd=_appController;
	[self setGDRefs];
	[self lazyInit];
	return self;
}

- (void) lazyInitWithGDDocument:(GDDocument *) _gd {
	#ifdef GDKIT_METHOD_CALLS
	printf("[GDBaseObject lazyInitWithGDDocument:]\n");
	#endif
	gd=_gd;
	[self setGDRefs];
	[self lazyInit];
}

- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController {
	#ifdef GDKIT_METHOD_CALLS
	printf("[GDBaseObject lazyInitWithGDApplicationController:]\n");
	#endif
	gd=[_appController retain];
	gd=_appController;
	[self setGDRefs];
	[self lazyInit];
}

- (void) dealloc {
	#ifdef GDKIT_METHOD_CALLS
	printf("[GDBaseObject dealloc]\n");
	#endif
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDBaseObject\n");
	#endif
	[super dealloc];
}

@end
