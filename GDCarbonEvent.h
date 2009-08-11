//
//  GDCarbonEvent.h
//  gdkit
//
//  Created by Aaron Smith on 8/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

/**
 * handler for callbacks.
 */
static OSStatus hotKeyHandler(EventHandlerCallRef nextHandler,EventRef anEvent,void * userData);

@interface GDCarbonEvent : NSObject {
	int keyCode;
	int modifierFlags;
	id target;
	SEL action;
	NSNotificationCenter * notificationCenter;
	NSString * notificationName;
	NSString * sigString;
	NSDictionary * userInfo;
	EventTypeSpec eventSpec;
	EventHotKeyRef hotKeyRef;
	EventHotKeyID hotKeyId;
	NSString * testID;
}

-(void) setTestID:(NSString *) s;
-(NSString *) testID;

/**
 * The notifiation name, if this carbon event is posting
 * to a notification center.
 */
@property (copy) NSString * notificationName;

/**
 * The nofication center to post to.
 */
@property (assign) NSNotificationCenter * notificationCenter;

/**
 * Selector to callback, if this event is NOT posting
 * to a notification center.
 */
@property (assign) SEL action;

/**
 * The target for the selector
 */
@property (retain) id target;

/**
 * ASCII Key code for carbon event HotKey
 */
@property (assign) int keyCode;

/**
 * modifier keys for a carbon hot key event (cmdKey, optionKey, shiftKey, optionKey, controlKey, kFunctionKeyCharCode)
 */
@property (assign) int modifierFlags;

/**
 * User info dict that get's passed back to the callback,
 * or passed as userInfo in the notification.
 */
@property (retain) NSDictionary * userInfo;

/**
 * Designated creator. Creates a global key carbon event, which calls
 * a selector on a target for you. Passing a pointer to the info you give it
 * (or null).
 */
+ (GDCarbonEvent *) createKeyEvent:(int) key modifierFlags:(int) flags whichCallsAction:(SEL) action onTarget:(id) target withUserInfo:(NSDictionary *) userInfo;

/**
 * Designated creator. Creates a global key carbon evet, which posts
 * a notification to a notification center, using the user info dict
 * ast he user info in the notification.
 */
+ (GDCarbonEvent *) createKeyEvent:(int) key modifierFlags:(int) flags whichPostsNotification:(NSString *) notificationName toCenter:(NSNotificationCenter *) center withUserInfo:(NSDictionary *) userInfo;

/**
 * Set the hotkey signature.
 */
- (void) setHotKeySignature:(NSString *) signature;

/**
 * Sets the hotkey id for a carbon hot key event.
 */
- (void) setHotKeyId:(int) kid;
- (int) hotKeyId;

/**
 * Sets the event class for a carbon event.
 */
- (void) setEventClass:(FourCharCode) eventClass;

/**
 * Set's the event kind for a carbon event.
 */
- (void) setEventKind:(unsigned int) eventKind;

/**
 * Installs the event.
 */
- (void) install;

/**
 * Will uninstall the event.
 */
- (void) uninstall;

/**
 * Performs the callback action desired,
 * either target/action or notification.
 */
- (void) call;

@end
