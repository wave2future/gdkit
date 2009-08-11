//
//  NSWorkspace+WorkspaceAdditions.h
//  gdkit
//
//  Created by Aaron Smith on 8/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSWorkspace (WorkspaceAdditions)

/**
 * Requires an application info dictionary, which must
 * contain the key "NSApplicationPath"
 */
- (void) bringApplicationToFront:(NSDictionary *) appInfo;

/**
 * Brings the current application to front, which uses
 * NSBundle internally.
 */
- (void) bringCurrentApplicationToFront;

/**
 * Brings an application to the front, from an application
 * path.
 */
- (void) bringApplicationToFrontFromPath:(NSString *) appPath;

@end
