
#import <Cocoa/Cocoa.h>
#import "macros.h"

@interface GDDocument : NSDocument {
	BOOL awokeFromNib;
	IBOutlet id appDelegate;
	IBOutlet id docWindowDelegate;
	IBOutlet NSWindow * window;
}

+ (void) lazyInitWithAppInfo:(id) _appInfo mainMenu:(id) _mainMenuController modals:(id) _modals operations:(id) _operations viewController:(id) _viewController sounds:(id) _sounds;
- (void) initApplication;
- (void) initDelegates;
- (void) initWindows;
- (void) initViews;
- (void) startApplication;
- (id) appInfo;
- (id) mainMenu;
- (id) modals;
- (id) sounds;
- (id) views;
- (id) operations;

@end
