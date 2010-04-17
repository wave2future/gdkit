
#import "UITableViewDataProvider_NibbedCellViewController.h"

@implementation UITableViewDataProvider_NibbedCellViewController
@synthesize tableView;

- (void) viewDidLoad {
	MyDataItem * item1 = [[MyDataItem alloc] init];
	[item1 setLabel:@"Hello World"];
	
	tableData = [[UITableViewDataProvider alloc] init];
	UITableViewGroup * group = [UITableViewGroup group];
	
	MyRow * row1 = [UITableViewRow rowOfClass:[MyRow class] withNibName:@"MyCell" andCellIdentifier:@"MyCell"];
	[row1 setNibName:@"MyCell"];
	[row1 setCellIdentifier:@"MyCell"];
	[row1 setData:item1];
	[row1 setIsSelectable:false];
	
	[group addRow:row1];
	
	[tableData addGroup:group];
	
	[tableView setDataSource:tableData];
	[tableView setDelegate:self];
}

- (void) tableView:(UITableView *) _tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
	MyRow * row = (MyRow *)[tableData rowForIndexPath:indexPath];
	MyDataItem * data = [tableData dataForIndexPath:indexPath];
	MyCustomCell * cell = (MyCustomCell *)[tableView cellForRowAtIndexPath:indexPath];
	NSLog(@"data label: %@, cell label: %@",[data label],[[cell uilabel] text]);
	if(![row isSelectable]) [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void) dealloc {
	[super dealloc];
}

@end
