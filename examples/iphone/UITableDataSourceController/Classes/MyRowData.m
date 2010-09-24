
#import "MyRowData.h"

@implementation MyRowData
@synthesize label;

+ (id) dataWithLabel:(NSString *) aLabel {
	MyRowData * data = [[MyRowData alloc] init];
	[data setLabel:aLabel];
	return [data autorelease];
}

@end
