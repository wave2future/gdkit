
#import "MyRow.h"

@implementation MyRow

+ (MyRow *) row {
	return [[[MyRow alloc] init] autorelease];
}

- (UITableViewCell *) cellForTable:(UITableView *) _tableView {
	UITableViewCell * cell = [super cellForTable:_tableView];
	MyRowDataItem * d = (MyRowDataItem *)data;
	[cell setText:[d label]];
	return cell;
}

@end
