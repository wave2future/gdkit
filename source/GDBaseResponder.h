
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDResponderHelper.h"

@class GDDocument;
@class GDApplicationController;

@interface GDBaseResponder : NSResponder {
	id gd;
}

- (void) setGDRefs;
- (void) lazyInit;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd;
- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController;

@end
