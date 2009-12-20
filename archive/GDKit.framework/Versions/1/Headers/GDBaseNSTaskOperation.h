
#import <Cocoa/Cocoa.h>
#import "GDBaseOperation.h"
#import "macros.h"

@interface GDBaseNSTaskOperation : GDBaseOperation {
	BOOL readsSTOUT;
	BOOL readsSTERR;
	NSString * stout;
	NSString * sterr;
	NSMutableArray * args;
	NSTask * task;
}

- (void) initializeTask;
- (void) main;
- (void) readSTDERR;
- (void) readSTDOUT;
- (void) prepareTask;
- (void) updateArguments;
- (void) validateTerminationStatus;

@end
