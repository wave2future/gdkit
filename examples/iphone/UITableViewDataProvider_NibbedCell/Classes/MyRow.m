
#import "MyRow.h"

//the data item for this row.
@implementation MyDataItem
@synthesize label;
@end

//the cell that renders this row
@implementation MyCustomCell
@synthesize uilabel;
@synthesize uiswitch;
@end

//the row
@implementation MyRow
@synthesize cell;

- (UITableViewCell *) cellForTable:(UITableView *) _tableView {
	MyDataItem * d = (MyDataItem *)data;
	MyCustomCell * cl = (MyCustomCell *)[super getCachedRowForTable:_tableView];
	if(cl) {
		[[cl uilabel] setText:[d label]];
		return cl;
	}
	[self loadNib];
	[[cell uilabel] setText:[(MyDataItem *)data label]];
	return cell;
}

@end
