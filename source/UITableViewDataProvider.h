
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UITableViewGroup.h"
#import "UITableViewRow.h"

/**
 * @file UITableViewDataProvider.h
 *
 * Header for UITableViewDataProvider
 */

/**
 * @class UITableViewDataProvider
 *
 * The UITableViewDataProvider implements the UITableViewDataSource protocol
 * and simplifies the logic that you need for every UITableView's data source.
 */
@interface UITableViewDataProvider : NSObject <UITableViewDataSource> {
	
	/**
	 * The groups in the associated table view.
	 */
	NSMutableArray * groups;
}

/**
 * The groups in the associated table view.
 */
@property (nonatomic,readonly) NSMutableArray * groups;

/**
 * Add a group to the table's data.
 */
- (void) addGroup:(UITableViewGroup *) _group;

/**
 * Remove a group from the table's data.
 */
- (void) removeGroup:(UITableViewGroup *) _group;

/**
 * Get the data associated with a row.
 */
- (id) dataForIndexPath:(NSIndexPath *) _indexPath;

/**
 * Get the currently rendered cell at a row. This is just
 * a shortcut to call [tableView cellForRowAtIndexPath:];
 */
- (UITableViewCell *) cellForTable:(UITableView *) _tableView atIndexPath:(NSIndexPath *) _indexPath;

/**
 * Get a row object for an index path.
 */
- (UITableViewRow *) rowForIndexPath:(NSIndexPath *) _indexPath;

/**
 * Get a group for an index path.
 */
- (UITableViewGroup *) groupForIndexPath:(NSIndexPath *) _path;

#pragma mark data source methods

/**
 * (UITableViewDataSource) Move a row at an index path to another index path. This
 * will move rows within the same group, or rows into a different group.
 */
- (void) tableView:(UITableView *) _tableView moveRowAtIndexPath:(NSIndexPath *) fromIndexPath toIndexPath:(NSIndexPath *) toIndexPath;	

/**
 * (UITableViewDataSource) Whether or not the row is editable. When this is called
 * the row at the index path is queried.
 */
- (BOOL) tableView:(UITableView *) _tableView canEditRowAtIndexPath:(NSIndexPath *) _indexPath;

/**
 * (UITableViewDataSource) The number of sections in the table view.
 */
- (NSInteger) numberOfSectionsInTableView:(UITableView *) _tableView;

/**
 * (UITableViewDataSource) The number of rows in a table section.
 */
- (NSInteger) tableView:(UITableView *) table numberOfRowsInSection:(NSInteger) section;

/**
 * (UITableViewDataSource) Creates and returns a cell for the table. The cell
 * creation logic comes from the row (UITableViewRow).
 */
- (UITableViewCell *) tableView:(UITableView *) _tableView cellForRowAtIndexPath:(NSIndexPath *) _indexPath;

/**
 * (UITableViewDataSource) The footer title for the section. The title is taken
 * from a group (UITableViewGroup).
 */
- (NSString *) tableView:(UITableView *) _tableView titleForFooterInSection:(NSInteger) section;

/**
 * (UITableViewDataSource) The header title for the section. The title is taken
 * from a group (UITableViewGroup).
 */
- (NSString *) tableView:(UITableView *) _tableView titleForHeaderInSection:(NSInteger) section;

@end
