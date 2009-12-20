//copyright 2009 aaronsmith

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

/**
 * Category additions to NSUserDefaults.
 */
@interface NSUserDefaults (Additions)

/**
 * Deletes any entries identified the application's bundle id.
 */
+ (void) reset;

@end
