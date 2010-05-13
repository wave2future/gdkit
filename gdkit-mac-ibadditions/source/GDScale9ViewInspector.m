
#import "GDScale9ViewInspector.h"

@implementation GDScale9ViewInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Scale9 View Attributes";
}

- (NSString *) viewNibName {
	return @"Scale9ViewInspector";
}

- (void) refresh {
	[super refresh];
}

@end
