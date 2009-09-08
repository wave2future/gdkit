//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>
#import "GDASLLog.h"

/**
 * A helper for environment resources, generally making
 * updates to ulimit.
 */
@interface GDULimit : NSObject {
}

/**
 * Enables core dumps. This is the equivalent of running
 * 'ulimit -c unlimited'
 */
+ (void) enableCoreDumps;

@end
