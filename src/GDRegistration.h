//copyright 2009 aaronsmith

#import <Cocoa/Cocoa.h>

/**
 * Some helper methods for application registration.
 */
@interface GDRegistration : NSObject {
}

/**
 * Saves registration info into user defaults.
 */
- (void) saveRegistrationintoUserDefaults:(NSString *) nameKey regCodeKey:(NSString *) regCodeKey name:(NSString *) regName regCode:(NSString *) regCode;

@end
