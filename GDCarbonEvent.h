//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>

#ifndef hGDCarbonEvent
#define hGDCarbonEvent
#endif

@class GDCarbonEventManager;

@interface GDCarbonEvent : NSObject <NSCoding> {
	int keyCode;
	int modifierFlags;
	id target;
	SEL action;
	NSNotificationCenter * notificationCenter;
	NSString * notificationName;
	NSString * sigString;
	NSDictionary * userInfo;
	EventHandlerRef eventRef;
	EventHandlerUPP handlerUPP;
	EventTypeSpec eventSpec;
	EventHotKeyRef hotKeyRef;
	EventHotKeyID hotKeyId;
	NSString * keyChar;
	Boolean isInstalled;
}

/**
 * An NSString for the actual key char - IE
 * like "W", or "F", etc.
 */
@property (copy) NSString * keyChar;

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
 * modifier keys for a carbon hot key event (cmdKey, optionKey, shiftKey, 
 * optionKey, controlKey, kFunctionKeyCharCode)
 */
@property (assign) int modifierFlags;

/**
 * User info dict that get's passed back to the callback,
 * or passed as userInfo in the notification.
 */
@property (retain) NSDictionary * userInfo;

/**
 * Initialize this GDCarbonEvent with a coder - 
 * It only sets up the keyCode, and modifierFlags
 * from the coder. You need to continue initializing
 * the object to setup action/target and other
 * params.
 */
- (id) initWithCoder:(NSCoder *) coder;

/**
 * Writes the keyCode, and modifierFlags to the coder.
 * It doesn't write anything else in the coder.
 */
- (void) encodeWithCoder:(NSCoder *) coder;

/**
 * Increments the eventId, this is used as the increment
 * has to be synchronized
 */
- (void) incrementEventId;

/**
 * Disposes of the internal lookup manager that's used
 * for all GDCarbonEvents. If you use a GDCarbonEvent, then
 * dispose of it, but aren't using anymore GDCarbonEvents,
 * you can call this to dispose of the last NSDictionary
 * that's used for management.
 */
+ (void) disposeOfLookupManager;

/**
 * Set the hotkey signature.
 */
- (void) setHotKeySignature:(NSString *) signature;

/**
 * Sets the hotkey id for a carbon hot key event.
 */
- (void) setHotKeyId:(int) kid;

/**
 * Get the hotkey id.
 */
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
 * Returns the modifier keys converted into a cocoa modifier int.
 */
- (NSUInteger) cocoaModifierKeys;

/**
 * Installs the event.
 */
- (void) install;

/**
 * Uninstalls the event.
 */
- (void) uninstall;

/**
 * Performs the callback action desired,
 * either target/action or notification.
 */
- (void) invoke;

/**
 * Initialize with event class, and event kind.
 */
- (id) initWithEventClass:(FourCharCode) eventClass andEventKind:(NSUInteger) eventKind;

/**
 * Set the notification name, and notification center if you want
 * this event to post notifications.
 */
- (void) setNotificationName:(NSString *) name andNotificationCenter:(NSNotificationCenter *) center;

/**
 * Set the action and target for this event if you want the
 * callback to call a selector.
 */
- (void) setAction:(SEL) action andTarget:(id) target;

/**
 * Set keycode, and modifier flags, optionally tell it that the flags
 * were cocoa, and need to be converted to carbon.
 */
- (void) setKeyCode:(NSUInteger) code andFlags:(NSUInteger) flags areFlagsCocoa:(Boolean) cocoaFlags;

/**
 * This returns a string that represents the value of the keyCode,
 * and modifier keys all added together: keyCode+modifiers.
 */
- (NSString *) keyString;

@end
