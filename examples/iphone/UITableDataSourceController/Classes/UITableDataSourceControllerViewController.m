
#import "UITableDataSourceControllerViewController.h"

@implementation UITableDataSourceControllerViewController
@synthesize tableView;

- (void) viewDidLoad {
	data = [[MyTableDataSourceController alloc] init];
	[data addSection];
	
	//add some rows (usually this will come from services or something else..)
	MyRowData * rd;
	rd = [MyRowData dataWithLabel:@"Hello World"];
	[data addItem:rd toSection:0];
	rd = [MyRowData dataWithLabel:@"Hello World 2"];
	[data addItem:rd toSection:0];
	[tableView setDataSource:data];
}

- (void) didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void) viewDidUnload {
	
}

- (void) dealloc {
	[super dealloc];
}

@end
