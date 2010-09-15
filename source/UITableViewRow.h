
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
	
	/**
	 * An outelet for a UITableCell contained in a nib. The file owner of that nib should
	 * be a subclass of UITableViewRow.
	 */
	UITableViewCell * nibbedCell;
	
	/**
	 * An outlet for a UITableView which is the owner of this row.
	 */
	UITableView * ownerTable;
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
 * An outelet for a UITableCell contained in a nib. The file owner of that nib should
 * be a subclass of UITableViewRow.
 */
@property (nonatomic,retain) IBOutlet UITableViewCell * nibbedCell;

/**
 * An outlet for a UITableView which is the owner of this row.
 */
@property (nonatomic,retain) IBOutlet UITableView * ownerTable;

/**
 * Shortcut to get a row index and set the cell re-use identifier.
 */
+ (id) rowOfClass:(Class) _class withCellIdentifier:(NSString *) _cellIdentifier;

/**
 * Shortcut to get a row that has the nib name and cell identifier set.
 */
+ (id) rowOfClass:(Class) _class withNibName:(NSString *) _nibName andCellIdentifier:(NSString *) _cellIdentifier;

/**
 * Loads the nib specified by "nibName".
 */
- (void) loadNib;

/**
 * Called after the nib was loaded.
 */
- (void) didLoadNib;

/**
 * Called before the nib is loaded.
 */
- (void) willLoadNib;

/**
 * Whether or not this row can be moved from a group.
 */
- (BOOL) canMoveRowInGroup:(UITableViewGroup *) _group atIndex:(NSInteger) _index;

/**
 * A shortcut to remember to first try and grab a cached row.
 */
- (id) getCachedRowForTable:(UITableView *) _tableView;

/**
 * Create and return a cell that displays this row's associated data.
 */
- (UITableViewCell *) cellForTable:(UITableView *) _tableView;

@end
