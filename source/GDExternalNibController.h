
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDBaseObject.h"
#import "GDCallback.h"

@class GDDocument;
@class GDWindowController;

#if MAC_OS_X_VERSION_MAX_ALLOWED > MAC_OS_X_VERSION_10_5
@interface GDExternalNibController : GDBaseObject <NSWindowDelegate> {
#else
@interface GDExternalNibController : GDBaseObject {
#endif
	BOOL isSheet;
	BOOL available;
	BOOL disposesNibsOnWindowClose;
	NSString * nibName;
	GDCallback * callback;
	IBOutlet GDWindowController * windows;
}

@property (copy,nonatomic) NSString * nibName;
@property (assign,nonatomic) IBOutlet GDWindowController * windows;
@property (assign,nonatomic) BOOL disposesNibsOnWindowClose;
@property (retain,nonatomic) GDCallback * callback;

- (void) close:(id) sender;
- (void) closeWindows;
- (void) disposeNibs;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback;
- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController andNibName:(NSString *) _nibName;
- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback;
- (void) loadNibs;
- (void) prepare;
- (void) setNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback;
- (void) show;
- (void) showAsSheetForWindow:(NSWindow *) _window;
- (id) initWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName;
- (id) initWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback;
- (id) initWithGDApplicationController:(GDApplicationController *) _appController andNibName:(NSString *) _nibName;
- (id) initWithGDApplicationController:(GDApplicationController *) _appController andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback;
	
@end
