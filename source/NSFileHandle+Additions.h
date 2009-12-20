
#import <Cocoa/Cocoa.h>


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
@interface NSFileHandle (Additions)

- (id) initWithFile:(NSString *) file;
- (id) initWithTruncatedFile:(NSString *) file;

@end
