
#import <UIKit/UIKit.h>
#import "GDKit-iPhone.h"
#import "MyRowDataItem.h"
#import "MyRow.h"

@interface UITableViewDataProviderViewController : UIViewController <UITableViewDelegate> {
	IBOutlet UITableView * tableView;
	UITableViewDataProvider * tableData;
}

@property (nonatomic,retain) UITableView * tableView;

@end

