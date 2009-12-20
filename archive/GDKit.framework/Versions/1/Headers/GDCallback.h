
#import <Cocoa/Cocoa.h>
#import "macros.h"
#import "GDBaseObject.h"

@interface GDCallback : NSObject {
	id target;
	SEL action;
	NSArray * args;
	NSInvocation * invoker;
	NSMethodSignature * signature;
}

@property (retain,nonatomic) NSArray * args;
@property (retain,nonatomic) id target;
@property (assign,nonatomic) SEL action;

- (void) execute;
- (void) executeOnMainThread;
- (void) getReturnValue:(void *) _resultAddress;
- (id) initWithTarget:(id) _target andAction:(SEL) _action;
- (id) initWithTarget:(id) _target andAction:(SEL) _action andArgs:(NSArray *) _args;
- (void) setupInvoker;

@end
