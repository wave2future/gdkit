//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

/**
 * @file NSStatusItem+Additions.h
 *
 * Header file for NSStatusItem cocoa additions.
 */

/**
 * @class NSStatusItem
 *
 * Category additions to NSStatusItem.
 */
@interface NSStatusItem (Additions)

/**
 * Get the position (in screen coordinates) where the
 * status item is in the menubar.
 */
- (NSPoint) position;

@end
