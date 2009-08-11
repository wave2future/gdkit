//
//  NSWorkspace+WorkspaceAdditions.m
//  gdkit
//
//  Created by Aaron Smith on 8/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSWorkspace+WorkspaceAdditions.h"

@implementation NSWorkspace (WorkspaceAdditions)

- (void) bringApplicationToFront:(NSDictionary *) appInfo {
	if(appInfo == nil) return;
	NSString * appath = [appInfo valueForKey:@"NSApplicationPath"];
	if(appath == nil) return;
	[[NSWorkspace sharedWorkspace] launchApplication:appath];
}

- (void) bringCurrentApplicationToFront {
	NSBundle * bndl = [NSBundle mainBundle];
	if(bndl == nil) return;
	[self bringApplicationToFrontFromPath:[bndl bundlePath]];
}

- (void) bringApplicationToFrontFromPath:(NSString *) appPath {
	if(appPath == nil) return;
	[self bringApplicationToFrontFromPath:appPath];
}

@end
