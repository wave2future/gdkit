
#import <Foundation/Foundation.h>

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
	#import <UIKit/UIKit.h>
#endif

/**
 * @file GDPrintUtils.h
 *
 * Header file for printing utils.
 */

/**
 * A shortcut for NSLog which will include __FILE__ and __LINE__ that the NSLog is on.
 */
#define gdflog(s,...) NSLog(@"<%p %@:(%d)> %@",self,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,[NSString stringWithFormat:(s), ##__VA_ARGS__])

/**
 * A shortcut for NSLog(@"",...).
 */
#define gdlog(s,...) NSLog(@"%@",[NSString stringWithFormat:(s),##__VA_ARGS__])

#if TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

/**
 * Prints an NSTask and it's arguments.
 *
 * @param task An NSTask to print.
 */
void GDPrintNSTask(NSTask * task);

NSString * GDPrintGetPrintedNSRect(NSRect _rect);

NSString * GDPrintGetPrintedNSSize(NSSize _size);

NSString * GDPrintGetPrintedNSPoint(NSPoint _point);

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

#endif

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR

/**
 * Print a UIColor formatted like: UIColor(<Color Space>r:%0.f,g:%0.3f,b:%0.3f).
 *
 * @param UIColor A UIColor instance.
 */
void GDPrintUIColor(UIColor * color);

/**
 * Print an UIAcceleration object
 */
NS_INLINE void GDPrintUIAcceleration(UIAcceleration * acceleration) {
	if(acceleration)NSLog(@"UIAcceleration(x:%g, y:%g, z:%g)",[acceleration x],[acceleration y],[acceleration z]);
}

/**
 * Prints a CGPoint formatted like: CGPoint(x:%g,y:%g).
 */
NS_INLINE void GDPrintCGPoint(CGPoint point) {
	NSLog(@"CGPoint(x:%g,y:%g)",point.x,point.y);
}

/**
 * Prints a CGRect formatted like: CGRect(x:%g,y:%g,w:%g,h:%g).
 */
NS_INLINE void GDPrintCGRect(CGRect rect) {
	NSLog(@"CGRect(x:%g,y:%g,w:%g,h:%g)",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
}

#endif