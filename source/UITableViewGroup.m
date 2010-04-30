
#import "UITableViewGroup.h"

@implementation UITableViewGroup
@synthesize headerTitle;
@synthesize footerTitle;
@synthesize rows;

+ (UITableViewGroup *) group {
	UITableViewGroup * group = [[UITableViewGroup alloc] init];
	return [group autorelease];
}

+ (UITableViewGroup *) groupWithHeaderTitle:(NSString *) _headerTitle andFooterTitle:(NSString *) _footerTitle {
	UITableViewGroup * group = [[UITableViewGroup alloc] init];
	[group setHeaderTitle:_headerTitle];
	[group setFooterTitle:_footerTitle];
	return [group autorelease];
}

+ (UITableViewGroup *) groupWithRows:(NSArray *) _rows {
	UITableViewGroup * group = [[UITableViewGroup alloc] init];
	[group addRows:_rows];
	return [group autorelease];
}

- (id) init {
	if(!(self=[super init]))return nil;
	rows=[[NSMutableArray alloc] init];
	return self;
}

- (void) setHeaderTitle:(NSString *) _headerTitle andFooterTitle:(NSString *) _footerTitle {
	[self setHeaderTitle:_headerTitle];
	[self setFooterTitle:_footerTitle];
}

- (void) addRows:(NSArray *) _rows {
	[rows addObjectsFromArray:_rows];
}

- (void) addRow:(UITableViewRow *) _row {
	[rows addObject:_row];
}

- (void) insertRow:(UITableViewRow *) _row atIndex:(NSInteger) _index {
	[rows insertObject:_row atIndex:_index];
}

- (void) removeRow:(UITableViewRow *) _row {
	[rows removeObject:_row];
}

- (void) removeRowAtIndex:(NSInteger) _index {
	[rows removeObjectAtIndex:_index];
}

- (UITableViewRow *) rowAtIndex:(NSInteger) _row {
	return (UITableViewRow *)[rows objectAtIndex:_row];
}

- (void) moveRowFrom:(NSInteger) _fromIndex to:(NSInteger) _toIndex {
	UITableViewRow * row = [[rows objectAtIndex:_fromIndex] retain];
	[rows removeObjectAtIndex:_fromIndex];
	[rows insertObject:row atIndex:_toIndex];
	[row release];
}

- (NSInteger) rowCount {
	return [rows count];
}

- (void) dealloc {
	[self setHeaderTitle:nil];
	[self setFooterTitle:nil];
	[rows release];
	[super dealloc];
}

@end
