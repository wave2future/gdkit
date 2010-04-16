
#import "UITableViewDataProvider.h"

@implementation UITableViewDataProvider
@synthesize groups;

- (id) init {
	if(!(self=[super init]))return nil;
	groups=[[NSMutableArray alloc] init];
	return self;
}

- (void) addGroup:(UITableViewGroup *) _group {
	if(!groups)groups=[[NSMutableArray alloc] init];
	if(!_group)return;
	[groups addObject:_group];
}

- (void) removeGroup:(UITableViewGroup *) _group {
	if(!groups)groups=[[NSMutableArray alloc] init];
	if(!_group)return;
	[groups removeObject:_group];
}

- (UITableViewRow *) rowForIndexPath:(NSIndexPath *) _indexPath {
	if(!groups||!_indexPath)return nil;
	NSInteger row = [_indexPath indexAtPosition:1];
	UITableViewGroup * group = [self groupForIndexPath:_indexPath];
	return (UITableViewRow *)[group rowAtIndex:row];
}

- (UITableViewGroup *) groupForIndexPath:(NSIndexPath *) _indexPath {
	if(!groups||!_indexPath)return nil;
	NSInteger col = [_indexPath indexAtPosition:0];
	UITableViewGroup * group = [groups objectAtIndex:col];
	return group;
}

- (UITableViewCell *) cellForTable:(UITableView *) _tableView atIndexPath:(NSIndexPath *) _indexPath {
	return (UITableViewCell *)[_tableView cellForRowAtIndexPath:_indexPath];
}

- (id) dataForIndexPath:(NSIndexPath *) _indexPath {
	if(!groups||!_indexPath)return nil;
	UITableViewGroup * group = [self groupForIndexPath:_indexPath];
	NSInteger row = [_indexPath indexAtPosition:1];
	UITableViewRow * tr = [group rowAtIndex:row];
	return [tr data];
}

#pragma mark data source methods

- (NSInteger) numberOfSectionsInTableView:(UITableView *) _tableView {
	return [groups count];
}

- (NSInteger) tableView:(UITableView *) table numberOfRowsInSection:(NSInteger) section {
	if(!groups) return 0;
	UITableViewGroup * group = [groups objectAtIndex:section];
	return [group rowCount];
}

- (UITableViewCell *) tableView:(UITableView *) _tableView cellForRowAtIndexPath:(NSIndexPath *) _indexPath {
	if(!groups)return nil;
	UITableViewGroup * group = [self groupForIndexPath:_indexPath];
	UITableViewRow * row = [group rowAtIndex:[_indexPath indexAtPosition:1]];
	UITableViewCell * cell = (UITableViewCell *)[row cellForTable:_tableView];
	return cell;
}

- (NSString *) tableView:(UITableView *) _tableView titleForFooterInSection:(NSInteger) section {
	if(!groups)return nil;
	UITableViewGroup * group = [groups objectAtIndex:section];
	return [group footerTitle];
}

- (NSString *) tableView:(UITableView *) _tableView titleForHeaderInSection:(NSInteger) section {
	if(!groups)return nil;
	UITableViewGroup * group = [groups objectAtIndex:section];
	return [group headerTitle];
}

- (void) tableView:(UITableView *) _tableView moveRowAtIndexPath:(NSIndexPath *) fromIndexPath toIndexPath:(NSIndexPath *) toIndexPath {
	NSInteger fc = [fromIndexPath indexAtPosition:0];
	NSInteger fr = [fromIndexPath indexAtPosition:1];
	NSInteger tc = [toIndexPath indexAtPosition:0];
	NSInteger tr = [toIndexPath indexAtPosition:1];
	UITableViewGroup * group = [groups objectAtIndex:fc];
	UITableViewGroup * group2;
	if(fc == tc) {
		[group moveRowFrom:fr to:tr];
	} else {
		@synchronized(self) {
			UITableViewRow * row = [[group rowAtIndex:fr] retain];
			[group removeRowAtIndex:fr];
			group2 = [groups objectAtIndex:tc];
			[group2 insertRow:row atIndex:tr];
			[row release];
		}
	}
}

- (BOOL) tableView:(UITableView *) _tableView canEditRowAtIndexPath:(NSIndexPath *) _indexPath {
	if(!groups||!_indexPath)return false;
	UITableViewGroup * group = [self groupForIndexPath:_indexPath];
	NSInteger row = [_indexPath indexAtPosition:1];
	UITableViewRow * tr = [group rowAtIndex:row];
	return [tr isEditable];
}

- (BOOL) tableView:(UITableView *) _tableView canMoveRowAtIndexPath:(NSIndexPath *) _indexPath {
	if(!groups||!_indexPath)return false;
	UITableViewGroup * group = [self groupForIndexPath:_indexPath];
	NSInteger row = [_indexPath indexAtPosition:1];
	UITableViewRow * tr = [group rowAtIndex:row];
	return [tr canMoveRowInGroup:group atIndex:row];
}

@end
