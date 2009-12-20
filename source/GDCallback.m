
#import "GDCallback.h"

@implementation GDCallback
@synthesize target;
@synthesize action;
@synthesize args;

- (id) initWithTarget:(id) _target andAction:(SEL) _action {
	self=[super init];
	[self setTarget:_target];
	[self setAction:_action];
	[self setupInvoker];
	return self;
}

- (id) initWithTarget:(id) _target andAction:(SEL) _action andArgs:(NSArray *) _args {
	self=[super init];
	[self setTarget:_target];
	[self setAction:_action];
	if(_args not nil) [self setArgs:_args];
	else [self setupInvoker];
	return self;
}

- (void) setupInvoker {
	GDRelease(signature);
	GDRelease(invoker);
	signature=[[self target] methodSignatureForSelector:[self action]];
	invoker=[[NSInvocation invocationWithMethodSignature:signature] retain];
	[invoker setTarget:[self target]];
	[invoker setSelector:[self action]];
}

- (void) setArgs:(NSArray *) _args {
	if(args not _args) {
		GDRelease(invoker);
		GDRelease(signature);
		GDRelease(args);
	}
	if(_args is nil) {
		GDRelease(args);
		return;
	}
	id arg;
	int c=1;
	args=[_args retain];
	[self setupInvoker];
	for(arg in args)[invoker setArgument:&arg atIndex:++c];
}

- (void) execute {
	[invoker invoke];
}

- (void) executeOnMainThread {
	[self performSelectorOnMainThread:@selector(execute) withObject:nil waitUntilDone:false];
}

- (void) getReturnValue:(void *) _resultAddress {
	[invoker getReturnValue:&_resultAddress];
}

- (void) dealloc {
	GDRelease(invoker);
	GDRelease(signature);
	[self setArgs:nil];
	[super dealloc];
}

@end
