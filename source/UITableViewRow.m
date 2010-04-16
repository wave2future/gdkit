
#import "UITableViewRow.h"
#import "UITableViewGroup.h"

@implementation UITableViewRow
@synthesize isEditable;
@synthesize isSelectable;
@synthesize cellIdentifier;
@synthesize data;
@synthesize nibName;

+ (UITableViewRow *) row {
	UITableViewRow * row = [[UITableViewRow alloc] init];
	return [row autorelease];
}

+ (UITableViewRow *) rowForCellIdentifier:(NSString *) _cellIdentifier {
	UITableViewRow * row = [[UITableViewRow alloc] init];
	[row setCellIdentifier:_cellIdentifier];
	return [row autorelease];
}

+ (UITableViewRow *) rowWithNibName:(NSString *) _nibName andCellIdentifier:(NSString *) _cellIdent {
	UITableViewRow * row = [[UITableViewRow alloc] init];
	[row setNibName:_nibName];
	[row setCellIdentifier:_cellIdent];
	return [row autorelease];
}

- (id) init {
	if(!(self=[super init]))return nil;
	[self setCellIdentifier:@"Cell"];
	return self;
}

- (UITableViewCell *) cellForTable:(UITableView *) _tableView {
	UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if(cell==nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
		[cell autorelease];
	}
	return cell;
}

- (BOOL) canMoveRowInGroup:(UITableViewGroup *) _group atIndex:(NSInteger) _index {
	return true;
}

- (void) dealloc {
	[cellIdentifier release];
	[super dealloc];
}

@end
