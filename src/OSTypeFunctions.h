#import <Cocoa/Cocoa.h>

/**
 * @file OSTypeFunctions.h
 *
 * Some helper functions for OSType conversions.
 */

//#ifdef AVAILABLE_MAC_OS_X_VERSION_10_4_AND_LATER

/**
 * Convert an NSString of four characters into
 * an OSType.
 */
OSType fourCharCodeToOSType(NSString * inCode);

/**
 * Convert an OSType into an NSString of four chars.
 */
NSString * osTypeToFourCharCode(OSType inType);