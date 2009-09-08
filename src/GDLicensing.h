//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

/**
 * The GDLicensing protocol defines the contract an object
 * needs to implement for application registration.
 */
@protocol GDLicensing

/**
 * This should return whether or not the application
 * is correctly registered.
 */
- (Boolean) isRegistered;

/**
 * This should check if the app is registered, and can
 * keep running.
 */
- (Boolean) canKeepRunningApp;

/**
 * Check if a license is valid.
 */
- (Boolean) isValid:(NSString *) name regCode:(NSString *) regCode;

/**
 * Save the license and name.
 */
- (void) saveRegistration:(NSString *) name regCode:(NSString *) regCode;

@end
