//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>
#import "GDASLLog.h"

#ifndef hGDASLLogManager
#define hGDASLLogManager
#endif


@interface GDASLLogManager : NSObject {
	NSMutableDictionary * logs;
	Boolean enabled;
}

/**
 * Whether or not logging is enabled. You can
 * toggle this to disable or enable all GDASLLog
 * instances.
 */
@property (assign) Boolean enabled;

/**
 * Singleton instance.
 */
+ (GDASLLogManager *) sharedInstance;

/**
 * Set a log object for key.
 */
- (void) setLog:(GDASLLog *) log forKey:(NSString *) key;

/**
 * Get a log object by key.
 */
- (GDASLLog *) getLogForKey:(NSString *) key;

@end
