//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

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
