//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>
#import "GDASLLog.h"

#ifndef hGDULimit
#define hGDULimit
#endif

@interface GDULimit : NSObject {
}

/**
 * Enables core dumps. Use this when need to
 * enable  core dumps through code.
 * 
 * This is the equivalent of running 'ulimit -c unlimited'
 */
+ (void) enableCoreDumps;

@end
