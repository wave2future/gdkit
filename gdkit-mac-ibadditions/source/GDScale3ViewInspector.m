
#import "GDScale3ViewInspector.h"

@implementation GDScale3ViewInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Scale3 View Attributes";
}

- (NSString *) viewNibName {
	return @"Scale3ViewInspector";
}

- (void) refresh {
	//NSLog(@"refresh");
	[super refresh];
}

@end
