
#import <UIKit/UIKit.h>
#import "GDKit-iPhone.h"
#import "MyRow.h"

@interface UITableViewDataProvider_NibbedCellViewController : UIViewController <UITableViewDelegate> {
	IBOutlet UITableView * tableView;
	UITableViewDataProvider * tableData;
}

@property (nonatomic,retain) UITableView * tableView;

@end

