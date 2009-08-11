//
//  NSStatusItem+StatusItemAdditions.m
//  gdkit
//
//  Created by Aaron Smith on 8/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSStatusItem+StatusItemAdditions.h"

@implementation NSStatusItem (StatusItemAdditions)

- (NSPoint) getStatusItemPosition:(NSStatusItem *) statusItem {
	NSView *tmpView = [[NSView alloc] initWithFrame:NSMakeRect(0.0,0.0,[statusItem length],[[statusItem statusBar] thickness])];
	[statusItem setView:tmpView];
	NSRect globalOrigin = [[[statusItem view] window] frame];
	//NSLog(@"%g %g",globalOrigin.origin.x, globalOrigin.origin.y);
	[statusItem setView:NULL];
	return NSMakePoint(globalOrigin.origin.x,globalOrigin.origin.y);
}




@end
