//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

#ifndef hGDNSStatusItem_StatusItemAdditions
#define hGDNSStatusItem_StatusItemAdditions
#endif

@interface NSStatusItem (StatusItemAdditions)

/**
 * Get the position (in screen coordinates) where the
 * status item is in the menubar.
 */
- (NSPoint) position;

@end
