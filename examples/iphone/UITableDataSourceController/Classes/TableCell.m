
#import "TableCell.h"

@implementation TableCell
@synthesize label;

- (void) setData:(MyRowData *) d {
	[label setText:[d label]];
}

@end
