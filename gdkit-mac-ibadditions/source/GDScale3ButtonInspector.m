
#import "GDScale3ButtonInspector.h"

@implementation GDScale3ButtonInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Scale Three Button Attributes";
}

- (NSString *) viewNibName {
	return @"Scale3ButtonInspector";
}

@end
