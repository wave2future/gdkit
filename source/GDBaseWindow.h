
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDResponderHelper.h"

@class GDDocument;
@class GDApplicationController;

@interface GDBaseWindow : NSWindow {
	IBOutlet id gd;
	IBOutlet id externalNibController;
}

@property (assign,nonatomic) IBOutlet id gd;
@property (assign,nonatomic) IBOutlet id externalNibController;

- (void) lazyInit;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd;
- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController;
- (void) setGDRefs;

@end
