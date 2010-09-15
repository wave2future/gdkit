
#import "UITableViewRow.h"
#import "UITableViewGroup.h"

@implementation UITableViewRow
@synthesize isEditable;
@synthesize isSelectable;
@synthesize cellIdentifier;
@synthesize data;
@synthesize nibName;
@synthesize nibbedCell;
@synthesize ownerTable;

+ (id) rowOfClass:(Class) _class withCellIdentifier:(NSString *) _cellIdentifier {
	id row = [[_class alloc] init];
	NSAssert([row isKindOfClass:[UITableViewRow class]],@"Assertion Failure: The Class type passed is not, or does not inherit from UITableViewRow");
	UITableViewRow * r = (UITableViewRow *)row;
	[r setCellIdentifier:_cellIdentifier];
	return [row autorelease];
}

+ (id) rowOfClass:(Class) _class withNibName:(NSString *) _nibName andCellIdentifier:(NSString *) _cellIdentifier {
	id row = [[_class alloc] init];
	NSAssert([row isKindOfClass:[UITableViewRow class]],@"Assertion Failure: The Class type passed is not, or does not inherit from UITableViewRow");
	UITableViewRow * r = (UITableViewRow *)row;
	[r setNibName:_nibName];
	[r setCellIdentifier:_cellIdentifier];
	return [row autorelease];
}

- (id) init {
	if(!(self=[super init]))return nil;
	[self setCellIdentifier:@"Cell"];
	return self;
}

- (id) getCachedRowForTable:(UITableView *) _tableView {
	return [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
}

- (UITableViewCell *) cellForTable:(UITableView *) _tableView {
	UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if(cell==nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
		[cell autorelease];
	}
	return cell;
}

- (void) loadNib {
	NSBundle * mb = [NSBundle mainBundle];
	[self willLoadNib];
	[mb loadNibNamed:nibName owner:self options:nil];
	[self didLoadNib];
}

- (void) didLoadNib {}

- (void) willLoadNib {}

- (BOOL) canMoveRowInGroup:(UITableViewGroup *) _group atIndex:(NSInteger) _index {
	return true;
}

- (void) dealloc {
	[self setCellIdentifier:nil];
	[self setNibName:nil];
	[self setData:nil];
	isEditable=false;
	isSelectable=false;
	[super dealloc];
}

@end
