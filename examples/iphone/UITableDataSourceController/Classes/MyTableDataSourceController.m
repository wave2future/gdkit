
#import "MyTableDataSourceController.h"

@implementation MyTableDataSourceController

- (id) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
	id cell;
	MyRowData * d = [self itemInSection:0 atIndex:[indexPath row]];
	if(!d) return nil;
	TableCell * c = (TableCell *)[tableView dequeueReusableCellWithIdentifier:@"TableCell"];
	if(!c) {
		UITableCellLoader * loader = [[UITableCellLoader alloc] initWithNibName:@"TableCell"];
		[loader load];
		c = (TableCell *)[loader nibbedCell];
		[loader release];
		[c autorelease];
	}
	[c setData:d];
	cell = c;
	return cell;
}

@end
