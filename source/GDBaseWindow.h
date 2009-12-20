
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDResponderHelper.h"

@class GDDocument;
@class GDApplicationController;

@interface GDBaseWindow : NSWindow {
	id gd;
	id externalNibController;
}

@property (retain,nonatomic) IBOutlet id gd;
@property (retain,nonatomic) IBOutlet id externalNibController;

- (void) lazyInit;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd;
- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController;
- (void) setGDRefs;

@end
