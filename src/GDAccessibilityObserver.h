//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>
#import "GDAccessibilityManager.h"
#import "GDAccessibilityNotification.h"
#import "GDAccessibilityObserver.h"

/**
 * GDAccessibilityObserver is an object oriented wrapper around
 * accessibility notifications.
 */
@interface GDAccessibilityObserver : NSObject {
	pid_t app_pid;
	id actionTarget;
	SEL actionSelector;
	AXObserverRef observer;
	AXUIElementRef element;
	NSInvocation * invoker;
	NSMethodSignature * selectorSignature;
	NSDictionary * userInfo;
	NSString * notification;
	GDAccessibilityManager * accessManager;
	GDAccessibilityNotification * notify;
}

/**
 * Designated initializer.
 */
- (id) initWithNotification:(NSString *) notification forAXUIElementRef:(AXUIElementRef) element callsAction:(SEL) action onTarget:(id) target withUserInfo:(NSDictionary *) userInpho;

@end

@interface  GDAccessibilityObserver (Private)

//returns the invoker for this observer.
- (NSInvocation *) invoker;

@end
