//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>
#import "GDAccessibilityOperationResult.h"

enum {
	
	/**
	 * Used in a couple places to indicate that an AXUIElement
	 * doesn't act as the right role for whatever operation was
	 * trying to be called.
	 */
	kAMIncorrectRole = -25215,
	
	/**
	 * Used to indicate that an attribute is not settable.
	 */
	kAMAttributeNotSettable = -25216,
	
	/**
	 * Used to indicate that an incorrect value was attempted
	 * to be set on a AXUIElement ref.
	 */
	kAMIncorrectValue = -25217,
	
	/**
	 * Used to indicate that the set attribute opration for a
	 * AXUIElementRef couldn't complete.
	 */
	kAMCouldNotSetValue = -25218,
};
typedef NSInteger GDAccessibilityManagerErrorConstant;

/**
 * The GDAccessibilityManager handles working with the carbon
 * accessibility API for you.
 */
@interface GDAccessibilityManager : NSObject {
	Boolean useCacheForPids;
	NSWorkspace * workspace;
}

/**
 * Whether or not the accessibility API is on.
 */
- (Boolean) isAccessibilityEnabled;

/**
 * Returns whether or not the axuielement exposes an attribute
 * as settable.
 */
- (Boolean) isAXUIElementRef:(AXUIElementRef) element attributeSettable:(NSString *) attribute;

/**
 * Checks whether an attribute is exposed on the elementref.
 */
- (Boolean) doesElementRef:(AXUIElementRef) elementRef exposeAttribute:(NSString *) attribute;

/**
 * Whether or not an element acts as a particular role.
 */
- (Boolean) doesElementRef:(AXUIElementRef) element actAsRole:(NSString *) role;

/**
 * Check if a CFTypeRef is a CGPoint.
 */
- (Boolean) isCGPoint:(CFTypeRef) possibleCGPointRef;

/**
 * Check if a CFTypeRef is a CGRect.
 */
- (Boolean) isCGRect:(CFTypeRef) possibleCGRectRef;

/**
 * Check if a CFTypeRef is a CGSize.
 */
- (Boolean) isCGSize:(CFTypeRef) possibleCGSize;

/**
 * Check if a CFTypeRef is a CFRange.
 */
- (Boolean) isCFRange:(CFTypeRef) possibleCFRange;

/**
 * Check if a CFTypeRef is an NSString.
 */
- (Boolean) isNSString:(CFTypeRef) possibleString;

/**
 * Check if a CFTypeRef is an NSValue.
 */
- (Boolean) isNSValue:(CFTypeRef) possibleNSValue;

/**
 * Return's a pid_t for the given accessibility object. This returns -1
 * when an error occures from the accessibility api.
 */
- (pid_t) forAXUIElementRefGetPID:(AXUIElementRef) element;

/**
 * Singleton instance.
 */
+ (GDAccessibilityManager *) sharedInstance;

/**
 * Get the system wide accessibility object.
 */
- (GDAccessibilityOperationResult *) sysWide;

/**
 * Returns an GDAccessibilityOperationResult which will either
 * be an error, or contain the result which is the AXUIElement
 * representing the foused application.
 */
- (GDAccessibilityOperationResult *) focusedApplicationRef;

/**
 * Get the focused window for the currently focused application.
 */
- (GDAccessibilityOperationResult *) focusedWindowForFocusedApplication;

/**
 * Returns an GDAccessibilityOperationResult which will either
 * be an error, or contain the result which is the AXUIElement
 * representing the currently focused window for the specified
 * application AXUIElementRef.
 */
- (GDAccessibilityOperationResult *) focusedWindowForApplication:(AXUIElementRef) applicationRef;

/**
 * Get an application AXUIElementRef from a process id.
 */
- (GDAccessibilityOperationResult *) applicationRefFromPid:(pid_t)pid;

/**
 * Get's the role attribute for an element ref.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRefGetRoleAttribute:(AXUIElementRef)element;

/**
 * Gets the role descriptiong for an element ref.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRefGetRoleDescriptionAttribute:(AXUIElementRef)element;

/**
 * Get the title for an element ref.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRefGetTitleAttribute:(AXUIElementRef)element;

/**
 * Get's the value of an attribute for an element ref.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element getAttributeValue:(NSString *) attribute;

/**
 * Get's the attribute value count of an attribute for an element ref.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element getAttributeValueCount:(NSString *) attribute;

/**
 * Set's the value of an attribute for an element ref. This is a shorctut
 * to accept NSValue objects. It does not accept NSStrings.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element setAttribute:(NSString *) attribute toNSValue:(NSValue *) nsvalue;

/**
 * Set an attribute's value to an NSPoint.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element setAttribute:(NSString *) attribute toNSPoint:(NSPoint) point;

/**
 * Set an attribute's value to an NSRect.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element setAttribute:(NSString *) attribute toNSRect:(NSRect) rect;

/**
 * Set an attribute's value to an NSRange.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element setAttribute:(NSString *) attribute toNSRange:(NSRange) range;

/**
 * Set an attribute's value to an NSSize.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element setAttribute:(NSString *) attribute toNSSize:(NSSize) size;

/**
 * Set an attribute's value to an NSString.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element setAttribute:(NSString *) attribute toNSString:(NSString *) string;

/**
 * Get's attribute names for an axuielement.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRefGetAttributeNames:(AXUIElementRef) element;

/**
 * Gets action names for an element ref.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRefGetActionNames:(AXUIElementRef) element;

/**
 * Gets an action description on an element ref.
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element getActionDescription:(NSString *)action;

/**
 * Performs an action on an AXUIElementRef
 */
- (GDAccessibilityOperationResult *) forAXUIElementRef:(AXUIElementRef) element performAction:(NSString *) action;

@end

@interface GDAccessibilityManager (Private)

- (GDAccessibilityOperationResult *) getAPIDisabledOperationResult;
- (GDAccessibilityOperationResult *) getCannotCreateValueOperationResult;

@end
