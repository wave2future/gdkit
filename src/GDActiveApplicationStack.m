//copyright aaronsmith 2009

#import "GDActiveApplicationStack.h"

//if 10_5 isn't defined, it means that the sdk
//currently being compiled against is 10.5. awkward.
#ifndef NSAppKitVersionNumber10_5
#warning GDActiveApplicationStack requires 10.6
#endif

@implementation GDActiveApplicationStack
@synthesize limit;
@synthesize onlyBringActiveApplicationsForward;

- (id) init {
	if(self = [super init]) {
		stack = [[NSMutableArray alloc] init];
		[self setLimit:10];
		[self initWorkspaceAndListeners];
	}
	return self;
}

- (NSDictionary *) top {
	if([stack count] < 1) return nil;
	NSUInteger index=[stack count]-1;
	return [stack objectAtIndex:index];
}

- (NSDictionary *) bottom {
	if([stack count] < 1) return nil;
	return [stack objectAtIndex:0];
}

- (void) popAndBringForward {
	if([stack count] < 1) return;
	[stack removeLastObject];
	if([stack count] < 1) return;
	[self bringTopForward];
}

- (void) bringTopForward {
	NSDictionary * top = [self top];
	[workspace bringApplicationToFront:top];
}

- (void) bringBottomForward {
	NSDictionary * app = [self bottom];
	[workspace bringApplicationToFront:app];
}

- (void) initWorkspaceAndListeners {
	workspace = [NSWorkspace sharedWorkspace];
	center = [workspace notificationCenter];
}

- (void) onApplicationActivate:(NSNotification *) notification {
	NSDictionary * app = [workspace activeApplication];
	if([stack count] == [self limit]) [stack removeObjectAtIndex:0];
	[stack addObject:app];
}

@end
