
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDBaseResponder.h"
#import "GDCallback.h"

@class GDDocument;

@interface GDBaseExternalNibController : GDBaseResponder <NSWindowDelegate> {
	BOOL available;
	NSString * nibName;
	IBOutlet NSWindow * window;
	GDCallback * callback;
}

@property (copy,nonatomic) NSString * nibName;
@property (retain,nonatomic) GDCallback * callback;

- (void) close:(id) sender;
- (void) disposeNibs;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd andNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback;
- (void) loadNibs;
- (void) setNibName:(NSString *) _nibName andCallback:(GDCallback *) _callback;
- (void) show;
- (void) showAsSheetForWindow:(NSWindow *) _window;

@end
