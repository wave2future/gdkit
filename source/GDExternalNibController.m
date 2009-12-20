
#import "GDExternalNibController.h"
#import "GDDocument.h"
#import "GDApplicationController.h"
#import "GDWindowController.h"

@implementation GDExternalNibController
@synthesize windows;
@synthesize callback;
@synthesize nibName;
@synthesize disposesNibsOnWindowClose;

- (void) reset {}

- (void) windowWillClose:(NSNotification *) notification {
	if(isSheet) return;
	if(disposesNibsOnWindowClose) [self disposeNibs];
}

- (id) initWithGDApplicationController:(GDApplicationController *) _appController andNibName:(NSString *) _nibName {
	self = [super init];
	[super lazyInitWithGDApplicationController:_appController];
	[self setNibName:_nibName];
	return self;
}

- (id) initWithGDApplicationController:(GDApplicationController *) _appController andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback {
	self=[super init];
	[super lazyInitWithGDApplicationController:_appController];
	[self setNibName:_nibName andCallback:_callback];
	return self;
}

- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController andNibName:(NSString *) _nibName {
	[super lazyInitWithGDApplicationController:_appController];
	[self setNibName:_nibName];
}

- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback {
	[super lazyInitWithGDApplicationController:_appController];
	[self setNibName:_nibName andCallback:_callback];
}

- (void) lazyInitWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName {
	[super lazyInitWithGDDocument:_gd];
	[self setNibName:_nibName];
}

- (void) lazyInitWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback {
	[super lazyInitWithGDDocument:_gd];
	[self setNibName:_nibName andCallback:_callback];
}

- (id) initWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName {
	self=[super init];
	[super lazyInitWithGDDocument:_gd];
	[self setNibName:_nibName];
	return self;
}

- (id) initWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback {
	self=[super init];
	[super lazyInitWithGDDocument:_gd];
	[self setNibName:_nibName andCallback:_callback];
	return self;
}

- (void) setNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback {
	[self setNibName:_nibName];
	[self setCallback:_callback];
}

- (void) loadNibs {
	if(available)return;
	NSAssert(!(nibName is nil), @"An external nib controller tried to load nibs but the nibName property isn't set");
	[NSBundle loadNibNamed:nibName owner:self];
	available=true;
}

- (void) prepare {
	[self loadNibs];
}

- (void) show {
	isSheet=false;
	[self closeWindows];
	[self loadNibs];
	[self reset];
	[[windows mainWindow] makeKeyAndOrderFront:nil];
}

- (void) showAsSheetForWindow:(NSWindow *) _window {
	isSheet=true;
	[self closeWindows];
	[self loadNibs];
	[self reset];
	[[NSApplication sharedApplication] beginSheet:[windows mainWindow] modalForWindow:_window modalDelegate:self didEndSelector:@selector(sheetEnded) contextInfo:nil];
}

- (void) sheetEnded {
	isSheet=false;
	if(disposesNibsOnWindowClose)[self disposeNibs];
}

- (void) onEscapeKey:(id) sender {
	[self close:nil];
}

- (void) close:(id) sender {
	[self disposeNibs];
}

- (void) closeWindows {
	if(windows and [windows mainWindow] not nil) {
		if([[windows mainWindow] isSheet]) [[NSApplication sharedApplication] endSheet:[windows mainWindow]];
		[[windows mainWindow] orderOut:nil];
	}
}

- (void) disposeNibs {
	if(!available) return;
	available=false;
	[self closeWindows];
	GDRelease(windows);
	windows=nil;
}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDExternalNibController\n");
	#endif
	GDRelease(nibName);
	GDRelease(callback);
	GDRelease(windows);
	available=false;
	[super dealloc];
}

@end
