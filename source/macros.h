
#import <Foundation/Foundation.h>

/**
 * @file macros.h
 * 
 * Header file that contains macros, and other c definitions.
 */

#define or ||
#define not !=
#define and &&
#define eq ==
#define is ==

/**
 * Releases and nil's out any id object.
 */
NS_INLINE void GDRelease(id obj) {
	//NSLog(@"retainCount: %@ \t\t %i",obj,[obj retainCount]);
	if(obj != NULL && [obj retainCount]>0)[obj release];
	//NSLog(@"retainCountAfter: %@ \t\t %i",obj,[obj retainCount]);
	obj=NULL;
}

/**
 * Prints an NSRect formatted like: NSRect(x:%g, y:%g, w:%g, h:%g).
 */
NS_INLINE void GDPrintNSRect(NSRect rect) {
	NSLog(@"NSRect(x:%g, y:%g, w:%g, h:%g)",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
}

/**
 * Prints an NSRect prefixed with some label: "[label] NSRect(x:%g, y:%g, w:%g, h:%g)".
 */
NS_INLINE void GDPrintNSRectWithLabel(NSString * label, NSRect rect) {
	NSLog(@"[%@] NSRect(x:%g, y:%g, w:%g, h:%g)",label,rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
}

/**
 * Prints an NSPoint formatted like: NSPoint(x:%g,y:%g).
 */
NS_INLINE void GDPrintNSPoint(NSPoint point) {
	NSLog(@"NSPoint(x:%g,y:%g)",point.x,point.y);
}

/**
 * Prints an NSPoint prefixed with some label: "[label] NSPoint(x:%g,y:%g)".
 */
NS_INLINE void GDPrintNSPointWithLabel(NSString * label,NSPoint point) {
	NSLog(@"[%@] NSPoint(x:%g,y:%g)",label,point.x,point.y);
}

/**
 * Prints an NSSize formatted like: NSSize(w:%g,h:%g).
 */
NS_INLINE void GDPrintNSSize(NSSize size) {
	NSLog(@"NSSize(w:%g,h:%g)",size.width,size.height);
}

/**
 * Prints an NSSize prefixed with some label: "[label] NSSize(w:%g,h:%g)".
 */
NS_INLINE void GDPrintNSSizeWithLabel(NSString * label,NSSize size) {
	NSLog(@"[%@] NSSize(w:%g,h:%g)",label,size.width,size.height);
}

/**
 * A shortcut for NSLog which will include __FILE__ and __LINE__ that the NSLog is on.
 */
#define gdflog(s,...) NSLog(@"<%p %@:(%d)> %@",self,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__])

/**
 * A shortcut for NSLog(@"",...).
 */
#define gdlog(s,...) NSLog(@"%@",[NSString stringWithFormat:(s),##__VA_ARGS__])
