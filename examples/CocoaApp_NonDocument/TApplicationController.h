
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit.h>
#import "TOperationsController.h"
#import "TViewController.h"
#import "TSoundController.h"
#import "TModalController.h"
#import "TMainMenuController.h"
#import "TExternalNibTest.h"
#import "TModel.h"
#import "TContextMenuController.h"

@interface TApplicationController : GDApplicationController <NSApplicationDelegate> {
	TExternalNibTest * externalNibTest;
}

- (IBAction) hello:(id) sender;
- (IBAction) loadExternalNibTest:(id) sender;
- (IBAction) loadExternalNibAsSheet:(id) sender;
- (IBAction) popTest:(id) sender;

@end
