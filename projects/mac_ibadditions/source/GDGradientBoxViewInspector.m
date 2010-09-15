
#import "GDGradientBoxViewInspector.h"

@implementation GDGradientBoxViewInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Gradient Box View Attributes";
}

- (NSString *) viewNibName {
	return @"GradientBoxViewInspector";
}

@end
