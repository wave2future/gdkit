
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * @file UITableViewRow.h
 *
 * Header file for UITableViewRow.
 */

@class UITableViewGroup;

/**
 * @class UITableViewRow
 *
 * The UITableViewRow is a data provider and cell creator for a
 * row in a UITableView.
 */
@interface UITableViewRow : NSObject {
	
	/**
	 * Whether or not this row is editable.
	 */
	BOOL isEditable;
	
	/**
	 * Whether or not this row is selectable.
	 */
	BOOL isSelectable;
	
	/**
	 * Generic data object for a row.
	 */
	id data;
	
	/**
	 * A cached UITableViewCell identifier (see UITableView#dequeueReusableCellWithIdentifier:).
	 */
	NSString * cellIdentifier;
	
	/**
	 * The nib name to load the cell from.
	 */
	NSString * nibName;
}

@property (nonatomic,copy) NSString * nibName;

/**
 * Whether or not this row is selectable.
 */
@property (nonatomic,assign) BOOL isSelectable;

/**
 * Whether or not this row is editable.
 */
@property (nonatomic,assign) BOOL isEditable;

/**
 * A cached UITableViewCell identifier (see UITableView#dequeueReusableCellWithIdentifier:).
 */
@property (nonatomic,copy) NSString * cellIdentifier;

/**
 * Generic data object for a row.
 */
@property (nonatomic,retain) id data;

/**
 * Shortcut to get a row that has the nib name and cell identifier set.
 */
+ (UITableViewRow *) rowWithNibName:(NSString *) _nibName andCellIdentifier:(NSString *) _cellIdent;

/**
 * Shortcut to get a row instance.
 */
+ (UITableViewRow *) row;

/**
 * Shortcut to get a row index and set the cell re-use identifier.
 */
+ (UITableViewRow *) rowForCellIdentifier:(NSString *) _cellIdentifier;

/**
 * Whether or not this row can be moved from a group.
 */
- (BOOL) canMoveRowInGroup:(UITableViewGroup *) _group atIndex:(NSInteger) _index;

/**
 * Create and return a cell that displays this row's associated data.
 */
- (UITableViewCell *) cellForTable:(UITableView *) _tableView;

@end
