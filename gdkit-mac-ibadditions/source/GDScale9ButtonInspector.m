
#import "GDScale9ButtonInspector.h"

@implementation GDScale9ButtonInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Scale Nine Button Attributes";
}

- (NSString *) viewNibName {
	return @"Scale9ButtonInspector";
}

@end
