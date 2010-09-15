
#import "GDScale3ViewInspector.h"

@implementation GDScale3ViewInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Scale Three View Attributes";
}

- (NSString *) viewNibName {
	return @"Scale3ViewInspector";
}

@end
