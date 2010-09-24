
#import <Foundation/Foundation.h>
#include <fcntl.h>
#include <unistd.h>

/**
 * @file NSFileHandle+Additions.h
 *
 * Header file for NSFileHandle cocoa additions.
 */

/**
 * @class NSFileHandle
 * 
 * Category additions to NSFileHandle.
 */

/**
 * Category additions to NSFileHandle.
 */
@interface NSFileHandle (GDAdditions)

+ (NSString *) tmpFileName;
- (id) initWithFile:(NSString *) file;
- (id) initWithTruncatedFile:(NSString *) file;
+ (NSFileHandle *) tmpFile:(NSString *) path;

@end
