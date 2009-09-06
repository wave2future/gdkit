//copyright 2009 aaronsmith

#import "GDRegistration.h"

@implementation GDRegistration

- (void) saveRegistrationintoUserDefaults:(NSString *) nameKey regCodeKey:(NSString *) regCodeKey name:(NSString *) regName regCode:(NSString *) regCode {
	NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
	[ud setObject:regName forKey:nameKey];
	[ud setObject:regCode forKey:regCodeKey];
}

@end
