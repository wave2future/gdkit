//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

/**
 * The GDAccessibilityOperationResult is a result object from an accessibility
 * operation. This contains the result, and is queryable to find out
 * if any errors happend.
 *
 * You should always check [res wasSuccess] before accessing the result.
 * the result property will be NULL if there was an error which will cause
 * your program to crash if you acces it when null.
 */
@interface GDAccessibilityOperationResult : NSObject {
	NSInteger resultCode;
	CFTypeRef result;
}

/**
 * The result code of the operation.
 */
@property (assign) NSInteger resultCode;

/**
 * Whether or not the operation was successful.
 */
- (Boolean) wasSuccess;

/**
 * Checks result code against kAXErrorFailure.
 */
- (Boolean) wasSystemFailure;

/**
 * Checks result code agains kAXErrorIllegalArgument.
 */
- (Boolean) hadIllegalArgument;

/**
 * Checks result code against kAXErrorInvalidUIElement.
 */
- (Boolean) wasInvalidAXUIElementRef;

/**
 * Checks result code against kAXErrorInvalidUIElementObserver.
 */
- (Boolean) wasInvalidAXObserverRef;

/**
 * Checks result code against kAXErrorAttributeUnsupported.
 */
- (Boolean) wasUnsupportedAttribute;

/**
 * Checks result code against kAXErrorActionUnsupported.
 */
- (Boolean) wasUnsupportedAction;

/**
 * Checks result code against kAXErrorNotificationUnsupported.
 */
- (Boolean) wasUnsupportedNotification;

/**
 * Checks result code against kAXErrorNotImplemented.
 */
- (Boolean) wasNotImplemented;

/**
 * Checks result code against kAXErrorNotificationAlreadyRegistered.
 */
- (Boolean) wasNotificationAlreadyRegistered;

/**
 * Checks result code against kAXErrorCannotComplete.
 */
- (Boolean) didMessagingFail;

/**
 * Checks result code against kAXErrorNotificationNotRegistered.
 */
- (Boolean) notificationWasntRegistered;

/**
 * Checks result code against kAXErrorAPIDisabled.
 */
- (Boolean) apiIsDisabled;

/**
 * Checks result code against kAXErrorNoValue and kAMIncorrectValue.
 */
- (Boolean) wasIncorrectValue;

/**
 * Checks result code against kAXErrorParameterizedAttributeUnsupported.
 */
- (Boolean) wasUnsupportedParameterizedAttributes;

/**
 * Checks result code against kAMIncorrectRole.
 */
- (Boolean) wasIncorrectRole;

/**
 * Checks result code against kAMAttributeNotSettable.
 */
- (Boolean) wasAttributeNotSettable;

/**
 * Checks result code agains kAMCouldNotSaveValue - this will occur if
 * AXValueCreate fails.
 */
- (Boolean) wasErrorSettingValue;

/**
 * check if the result is an AXUIElementRef
 */
- (Boolean) isResultAXUIElementRef;

/**
 * Check if the result is a CGPoint type.
 */
- (Boolean) isResultCGPoint;

/**
 * Check if the result is a CGRect type.
 */
- (Boolean) isResultCGRect;

/**
 * Check if the result is a CFRange type.
 */
- (Boolean) isResultCFRange;

/**
 * Check if the value is a CGSize type.
 */
- (Boolean) isResultCGSize;

/**
 * Check if the result is an AXObserverRef
 */
- (Boolean) isResultObserverRef;

/**
 * Returns the result as an NSPoint, you should first check
 * that the result was a CGPoint ([res isResultCGPoint]);
 */
- (NSPoint) resultAsNSPoint;

/**
 * Returns the result as an NSRect, you should first check
 * that the result was a CGRect ([res isResultCGRect]);
 */
- (NSRect) resultAsNSRect;

/**
 * Returns the result as an NSSize, you should first check
 * that the result was a CGSize ([res isResultCGSize]);
 */
- (NSSize) resultAsNSSize;

/**
 * Returns the result as an NSRange, you should first check
 * that the result was a CGRange ([res isResultCGRange]);
 */
- (NSRange) resultAsNSRange;

/**
 * Returns the result as an NSString.
 */
- (NSString *) resultAsNSString;

/**
 * Return the result as an NSValue, which will contain
 * either a point, rect, size, or range. If the result isn't
 * one of CGPoint, CGRect, CFRange, or CGSize a NULL pointer
 * will be returned, so you should check against NULL.
 */
- (NSValue *) resultAsNSValue;

/**
 * The raw result from the operation.
 */
- (CFTypeRef) result;

/**
 * Set the result.
 */
- (void) setResult:(CFTypeRef)reslt;

@end
