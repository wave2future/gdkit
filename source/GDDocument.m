
#import "GDDocument.h"

static id appInfo;
static id mainMenu;
static id modals;
static id operations;
static id sound;
static id views;

@implementation GDDocument

+ (void) lazyInitWithAppInfo:(id) _appInfo mainMenu:(id) _mainMenuController modals:(id) _modals operations:(id) _operations viewController:(id) _viewController sounds:(id) _sounds {
	if(views is nil and _viewController not nil) {
		views=_viewController;
		[views performSelector:@selector(lazyInitWithGDDocument:) withObject:self];
	}
	if(appInfo is nil and _appInfo not nil)appInfo=[_appInfo retain];
	if(modals is nil and _modals not nil)modals=[_modals retain];
	if(sound is nil and _sounds not nil)sound=[_sounds retain];
	if(operations is nil and _operations not nil)operations=[_operations retain];
	if(mainMenu is nil and _mainMenuController not nil)mainMenu=[_mainMenuController retain];
}

- (void) initViews {}
- (void) initWindows {}
- (void) startApplication {}

- (void) initDelegates {
	if(appDelegate not nil)[appDelegate performSelector:@selector(lazyInitWithGDDocument:) withObject:self];
	if(docWindowDelegate not nil)[docWindowDelegate performSelector:@selector(lazyInitWithGDDocument:) withObject:self];
}

- (void) awakeFromNib {
	if(awokeFromNib)return;
	awokeFromNib=true;
}

- (id) init {
	self=[super init];
	[self initApplication];
	return self;
}

- (void) initApplication {
	[self initDelegates];
	[self initWindows];
	[self initViews];
	[self startApplication];
}

- (id) appInfo {
	return appInfo;
}

- (id) mainMenu {
	return mainMenu;
}

- (id) modals {
	return modals;
}

- (id) sounds {
	return sound;
}

- (id) views {
	return views;
}

- (id) operations {
	return operations;
}

- (void) dealloc {
	[super dealloc];
}

@end
