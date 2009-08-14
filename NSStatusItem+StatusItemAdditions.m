//
//  NSStatusItem+StatusItemAdditions.m
//  gdkit
//
//  Created by Aaron Smith on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSStatusItem+StatusItemAdditions.h"

@implementation NSStatusItem (StatusItemAdditions)

- (NSPoint) position {
	NSView *tmpView = [[NSView alloc] initWithFrame:NSMakeRect(0.0,0.0,[self length],[[self statusBar] thickness])];
	[self setView:tmpView];
	NSRect globalOrigin = [[[self view] window] frame];
	//NSLog(@"%g %g",globalOrigin.origin.x, globalOrigin.origin.y);
	[self setView:NULL];
	return NSMakePoint(globalOrigin.origin.x,globalOrigin.origin.y);
}

@end
