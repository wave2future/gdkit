//copyright aaronsmith 2009

#import <Cocoa/Cocoa.h>
#import "NSWorkspace+WorkspaceAdditions.h"

/**
 * The GDActiveApplicationsStack keeps a stack
 * of application info dictionaries when applications
 * switch focus.
 */
@interface GDActiveApplicationStack : NSObject {
	short limit;
	BOOL onlyBringActiveApplicationsForward;
	NSMutableArray * stack;
	NSWorkspace * workspace;
}

/**
 * The application stack limit.
 */
@property (assign) short limit;

/**
 * Only bring applications that are active forward. If a call
 * is made to bringTopForward, but the application that was saved
 * in the stack isn't active, it will pop, and try again.
 *
 * If this isn't on, a call to bringTopForward will cause the
 * application to launch if it's not open.
 */
@property (assign) BOOL onlyBringActiveApplicationsForward;

/**
 * Returns the top item in the stack.
 */
- (NSDictionary *) top;

/**
 * Returns the bottom item in the stack.
 */
- (NSDictionary *) bottom;

/**
 * Pops an application off the stack, then brings the
 * the bottom application forward.
 */
- (void) popAndBringForward;

/**
 * Brings the top application forward.
 */
- (void) bringTopForward;

/**
 * Brings the bottom application forward.
 */
- (void) bringBottomForward;

@end

@interface GDActiveApplicationStack (Private)

/**
 * Initializes the workspace and listeners.
 */
- (void) initWorkspaceAndListeners;

/**
 * When the workspace changes active applications.
 */
- (void) onApplicationActivate;

@end