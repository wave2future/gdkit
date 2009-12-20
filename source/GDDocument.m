
#import "GDDocument.h"

@implementation GDDocument
@synthesize model;
@synthesize mainMenu;
@synthesize modals;
@synthesize operations;
@synthesize sounds;
@synthesize views;
@synthesize wins;
@synthesize drawers;

- (void) awakeFromNib {
	if(awokeFromNib)return;
	awokeFromNib=true;
	documentHasBeenActive=false;
}

- (id) init {
	self=[super init];
	return self;
}

- (void) initModel {}
- (void) initViews {}
- (void) initWindows {}
- (void) initControllers {}
- (void) startDocument {}

- (void) lazyInitWithModel:(id) _model mainMenu:(id) _mainMenu modals:(id) _modals operations:(id) _operations windows:(id) _windows drawers:(id) _drawers views:(id) _views sounds:(id) _sounds {
	if(drawers and drawers not _drawers)GDRelease(drawers);
	if(drawers is nil and _drawers not nil)drawers=[_drawers retain];
	if(views and views not _views)GDRelease(views);
	if(views is nil and _views not nil)views=[_views retain];
	if(model and model not _model)GDRelease(model);
	if(model is nil and _model not nil)model=[_model retain];
	if(modals and modals not _modals)GDRelease(modals);
	if(modals is nil and _modals not nil)modals=[_modals retain];
	if(sounds and sounds not _sounds)GDRelease(sounds);
	if(sounds is nil and _sounds not nil)sounds=[_sounds retain];
	if(operations and operations not _operations)GDRelease(operations);
	if(operations is nil and _operations not nil)operations=[_operations retain];
	if(mainMenu and mainMenu not _mainMenu)GDRelease(mainMenu);
	if(mainMenu is nil and _mainMenu not nil)mainMenu=[_mainMenu retain];
	if(wins and wins not _windows)GDRelease(wins);
	if(wins is nil and _windows not nil)wins=[_windows retain];
}

- (void) windowControllerDidLoadNib:(NSWindowController *) aController {
	[super windowControllerDidLoadNib:aController];
    [self initDocument];
}

- (void) windowDidBecomeMain:(NSNotification *) notification {
	if(documentHasBeenActive)[mainMenu invalidate];
	if(!documentHasBeenActive)documentHasBeenActive=true;
}

- (void) initDocument {
	[self initModel];
	[self initControllers];
	[self initWindows];
	[self initViews];
	[self startDocument];
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDApplicationController\n");
	#endif
	GDRelease(model);
	GDRelease(mainMenu);
	GDRelease(modals);
	GDRelease(operations);
	GDRelease(sounds);
	GDRelease(views);
	GDRelease(wins);
	GDRelease(drawers);
	awokeFromNib=false;
	documentHasBeenActive=false;
	[super dealloc];
}

@end
