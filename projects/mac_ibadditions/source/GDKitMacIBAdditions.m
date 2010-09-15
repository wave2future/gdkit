
#import "GDKitMacIBAdditions.h"

@implementation GDKitMacIBAdditions

- (NSString *) label {
	return @"GDKit";
}

- (NSArray *) libraryNibNames {
	return [NSArray arrayWithObject:@"GDKitMacIBAdditionsLibrary"];
}

- (NSArray *) requiredFrameworks {
	return [NSArray arrayWithObjects:[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKit"], nil];
}

@end
