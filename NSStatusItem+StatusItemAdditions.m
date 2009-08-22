//copyright 2009 aaronsmith

#import "NSStatusItem+StatusItemAdditions.h"

@implementation NSStatusItem (StatusItemAdditions)

- (NSPoint) position {
	NSView *tmpView = [[NSView alloc] initWithFrame:NSMakeRect(0.0,0.0,[self length],[[self statusBar] thickness])];
	NSMenu * menu = [self menu];
	[self setView:tmpView];
	NSRect globalOrigin = [[[self view] window] frame];
	[self setView:NULL];
	if(menu != nil) [self setMenu:menu];
	[tmpView release];
	return NSMakePoint(globalOrigin.origin.x,globalOrigin.origin.y);
}

@end
