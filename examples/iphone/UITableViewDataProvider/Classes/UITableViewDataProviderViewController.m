
#import "UITableViewDataProviderViewController.h"

@implementation UITableViewDataProviderViewController
@synthesize tableView;

- (void) viewDidLoad {
	tableData = [[UITableViewDataProvider alloc] init];
	UITableViewGroup * group1 = [UITableViewGroup group];
	MyRow * row1 = [MyRow row];
	MyRow * row2 = [MyRow row];
	MyRowDataItem * data1 = [[MyRowDataItem alloc] init];
	MyRowDataItem * data2 = [[MyRowDataItem alloc] init];
	[row1 setIsSelectable:false];
	[row2 setIsSelectable:true];
	[data1 setLabel:@"Hello World"];
	[data2 setLabel:@"Hello Again"];
	[row1 setData:data1];
	[row2 setData:data2];
	[group1 addRow:row1];
	[group1 addRow:row2];
	[tableData addGroup:group1];
	[tableView setDelegate:self];
	[tableView setDataSource:tableData];
}

- (void) tableView:(UITableView *) _tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	MyRow * row = (MyRow*)[tableData rowForIndexPath:indexPath];
	MyRowDataItem * data = [tableData dataForIndexPath:indexPath];
	NSLog(@"%@",[data label]);
	if(![row isSelectable]) [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void) viewDidUnload {
}


- (void)dealloc {
    [super dealloc];
}

@end
