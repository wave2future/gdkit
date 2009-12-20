
#import "TOperationsController.h"

@implementation TOperationsController

- (void) doSomething {
	NSLog(@"doing something");
}

- (void) doSomethingWithCallback:(GDCallback *) _callback {
	[_callback executeOnMainThread];
}

@end
