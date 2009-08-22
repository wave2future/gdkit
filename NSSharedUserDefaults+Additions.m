//copyright 2009 aaronsmith

#import "NSSharedUserDefaults+Additions.h"

@implementation NSUserDefaults (NSSharedUserDefaultAdditions)

+ (void) reset {
	[[self standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
}

@end
