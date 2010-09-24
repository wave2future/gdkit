
#import "NSObject+Additions.h"

@implementation NSObject (Additions)

- (id) ifRespondsPerformSelector:(SEL) selector {
	if([self respondsToSelector:selector]) return [self performSelector:selector];
	return nil;
}

- (id) ifRespondsPerformSelector:(SEL) selector withObject:(id) arg1 {
	if([self respondsToSelector:selector]) return [self performSelector:selector withObject:arg1];
	return nil;
}

@end
