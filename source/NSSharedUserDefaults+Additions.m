//copyright 2009 aaronsmith

#import "NSSharedUserDefaults+Additions.h"

@implementation NSUserDefaults (Additions)

+ (void) reset {
	[[self standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
	[[self standardUserDefaults] synchronize];
}

@end