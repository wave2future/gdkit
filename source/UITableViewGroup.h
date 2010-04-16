
#import <Foundation/Foundation.h>
#import "UITableViewRow.h"

/**
 * @file UITableViewGroup.h
 *
 * Header for UITableViewGroup.
 */

/**
 * @class UITableViewGroup
 *
 * The UITableViewGroup is a group object used for table data sources.
 * It contains rows that provide data to a section in a table.
 */
@interface UITableViewGroup : NSObject {
	
	/**
	 * The group's header title.
	 */
	NSString * headerTitle;
	
	/**
	 * The group's footer title.
	 */
	NSString * footerTitle;
	
	/**
	 * The rows that belong to this group.
	 */
	NSMutableArray * rows;
}

/**
 * The rows that belong to this group.
 */
@property (nonatomic,readonly) NSMutableArray * rows;

/**
 * The group's header title.
 */
@property (nonatomic,copy) NSString * headerTitle;

/**
 * The group's footer title.
 */
@property (nonatomic,copy) NSString * footerTitle;

/**
 * Helper method to get a group with header and footer titles.
 */
+ (UITableViewGroup *) groupWithHeaderTitle:(NSString *) _headerTitle andFooterTitle:(NSString *) _footerTitle;

/**
 * Helper method to get a group with an array of rows that are already available.
 */
+ (UITableViewGroup *) groupWithRows:(NSArray *) _rows;

/**
 * Helper method to get a row instance.
 */
+ (UITableViewGroup *) group;

/**
 * Add a row to this group.
 */
- (void) addRow:(UITableViewRow *) _row;

/**
 * Add multiple rows to this group.
 */
- (void) addRows:(NSArray *) _rows;

/**
 * Insert a row at a specific index.
 */
- (void) insertRow:(UITableViewRow *) _row atIndex:(NSInteger) _index;

/**
 * Remove a row.
 */
- (void) removeRow:(UITableViewRow *) _row;

/**
 * Remove a row at a specific index.
 */
- (void) removeRowAtIndex:(NSInteger) _index;

/**
 * Move a row from one index to another.
 */
- (void) moveRowFrom:(NSInteger) _fromIndex to:(NSInteger) _toIndex;

/**
 * Get a row at index.
 */
- (UITableViewRow *) rowAtIndex:(NSInteger) _row;

/**
 * The number of rows in this group.
 */
- (NSInteger) rowCount;

@end
