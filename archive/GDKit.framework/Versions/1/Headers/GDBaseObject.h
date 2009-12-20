
#import <Cocoa/Cocoa.h>
#import "macros.h"

@class GDDocument;
@class GDApplicationController;

@interface GDBaseObject : NSObject {
	IBOutlet id gd;
	IBOutlet id externalNibController;
}

@property (assign,nonatomic) IBOutlet id gd;
@property (assign,nonatomic) IBOutlet id externalNibController;

- (void) setGDRefs;
- (void) lazyInit;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd;
- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController;
- (id) initWithGDDocument:(GDDocument *) _gd;
- (id) initWithGDApplicationController:(GDApplicationController *) _appController;

@end
