//copyright 2009 aaronsmith

#import "NSStatusItem+StatusItemAdditions.h"

@implementation NSStatusItem (StatusItemAdditions)

- (NSPoint) position {
	NSView *tmpView = [[NSView alloc] initWithFrame:NSMakeRect(0.0,0.0,[self length],[[self statusBar] thickness])];
	[self setView:tmpView];
	NSRect globalOrigin = [[[self view] window] frame];
	[self setView:NULL];
	[tmpView release];
	return NSMakePoint(globalOrigin.origin.x,globalOrigin.origin.y);
}

@end
