
#import <UIKit/UIKit.h>
#import "MyRowData.h"

@interface TableCell : UITableViewCell {
	UILabel * label;
}

@property (nonatomic,retain) IBOutlet UILabel * label;

- (void) setData:(MyRowData *) d;

@end
