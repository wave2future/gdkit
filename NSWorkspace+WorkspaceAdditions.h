//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

#ifndef hGDNSWorkspace_WorkspaceAdditions
#define	hGDNSWorkspace_WorkspaceAdditions
#endif

@interface NSWorkspace (WorkspaceAdditions)

/**
 * Brings an application to the front. Requires an application
 * info dictionary, which must contain the key "NSApplicationPath"
 */
- (void) bringApplicationToFront:(NSDictionary *) appInfo;

/**
 * Brings the current application to front - uses NSBundle internally.
 */
- (void) bringCurrentApplicationToFront;

/**
 * Brings an application to the front, from an application
 * path.
 */
- (void) bringApplicationToFrontFromPath:(NSString *) appPath;

@end
