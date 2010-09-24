
#import <UIKit/UIKit.h>
#import "MyTableDataSourceController.h"

@interface UITableDataSourceControllerViewController : UIViewController {
	UITableView * tableView;
	MyTableDataSourceController * data;
}

@property (nonatomic,retain) IBOutlet UITableView * tableView;

@end

