
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDBaseObject.h"

@interface GDApplicationController : GDBaseObject {
	BOOL awokeFromNib;
	id model;
	id mainMenu;
	id modals;
	id operations;
	id sounds;
	IBOutlet id views;
	IBOutlet id wins;
	IBOutlet id drawers;
}

@property (readonly,nonatomic) id model;
@property (readonly,nonatomic) id operations;
@property (readonly,nonatomic) id mainMenu;
@property (readonly,nonatomic) id modals;
@property (readonly,nonatomic) id sounds;
@property (retain,nonatomic) id views;
@property (retain,nonatomic) id wins;
@property (retain,nonatomic) id drawers;

- (void) lazyInitWithModel:(id) _model mainMenu:(id) _mainMenu modals:(id) _modals operations:(id) _operations windows:(id) _windows drawers:(id) _drawers views:(id) _views sounds:(id) _sounds;
- (void) initApplication;
- (void) initModel;
- (void) initControllers;
- (void) initWindows;
- (void) initViews;
- (void) startApplication;

@end
