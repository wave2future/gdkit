
#import "GDScale9ViewInspector.h"

@implementation GDScale9ViewInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Scale Nine View Attributes";
}

- (NSString *) viewNibName {
	return @"Scale9ViewInspector";
}

@end
