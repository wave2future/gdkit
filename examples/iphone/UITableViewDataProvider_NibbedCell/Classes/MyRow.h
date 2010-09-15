
#import <Foundation/Foundation.h>
#import "GDKit-iPhone.h"

//the data item for this row.
@interface MyDataItem : NSObject {
	NSString * label;
}
@property (nonatomic,copy) NSString * label;
@end

//the cell that renders this row
@interface MyCustomCell : UITableViewCell {
	IBOutlet UILabel * uilabel;
	IBOutlet UISwitch * uiswitch;
}
@property (nonatomic,retain) UISwitch * uiswitch;
@property (nonatomic,retain) UILabel * uilabel;
@end

//the row
@interface MyRow : UITableViewRow {
}
@end
