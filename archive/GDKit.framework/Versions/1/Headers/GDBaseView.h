
#import <Cocoa/Cocoa.h>
#import "macros.h"

@class GDDocument;
@class GDApplicationController;

@interface GDBaseView : NSView {
	id gd;
	id externalNibController;
}

@property (retain,nonatomic) IBOutlet id gd;
@property (retain,nonatomic) IBOutlet id externalNibController;

- (void) lazyInit;
- (void) lazyInitWithGDDocument:(GDDocument *) _gd;
- (void) lazyInitWithGDApplicationController:(GDApplicationController *) _appController;
- (void) setGDRefs;
- (void) showInView:(NSView *) view;
- (void) showMaximizedInView:(NSView *) view;
- (void) showInView:(NSView *) view withAdjustments:(NSRect) _adjust;

@end
