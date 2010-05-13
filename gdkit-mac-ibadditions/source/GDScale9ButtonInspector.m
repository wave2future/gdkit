
#import "GDScale9ButtonInspector.h"

@implementation GDScale9ButtonInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Scale9 Button Attributes";
}

- (NSString *) viewNibName {
	return @"Scale9ButtonInspector";
}

- (void) refresh {
	//NSLog(@"refresh");
	[super refresh];
}

@end
