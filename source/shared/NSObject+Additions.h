
#import <Foundation/Foundation.h>
#import "macros.h"

/**
 * @file NSObject+Additions.h
 *
 * Header file for NSObject additions.
 */

/**
 * @class NSObject
 * 
 * Category additions to NSObject.
 */

/**
 * Category additions to NSObject.
 */
@interface NSObject (Additions)

/**
 * Performs the selector only if the object responds to it.
 *
 * @param selector The selector to perform.
 */
- (id) ifRespondsPerformSelector:(SEL) selector;

/**
 * Performs the selector with an object only if the object responds to it.
 *
 * @param selector The selector to perform.
 * @param arg1 The object.
 */
- (id) ifRespondsPerformSelector:(SEL) selector withObject:(id) arg1;

@end
