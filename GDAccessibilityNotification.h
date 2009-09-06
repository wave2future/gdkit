//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

/**
 * GDAccessibilityNotifications are passed to your selector callbacks
 * from an AccessibilityObserver.
 */
@interface GDAccessibilityNotification : NSObject {
	AXUIElementRef element;
	NSDictionary * userInfo;
	NSString * notification;
}

/**
 * The notification name that was listened for
 * which triggered this GDAccessibilityNotification.
 */
@property (copy) NSString * notification;

/**
 * Designated initializer.
 */
- (id) initWithElement:(AXUIElementRef) element forNotification:(NSString *) notification withUserInfo:(NSDictionary *) userInfo;

/**
 * Set the element that triggered the notification.
 */
- (void) setElement:(AXUIElementRef) element;

/**
 * Get the element.
 */
- (AXUIElementRef) element;

/**
 * Set the user info dictionary.
 */
- (void) setUserInfo:(NSDictionary *) userInfow;

/**
 * Get the user info dict.
 */
- (NSDictionary *) userInfo;

@end
