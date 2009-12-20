
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit.h>
#import "TCustomView.h"

@interface TViewController : GDViewController {
	IBOutlet TCustomView * customView1;
}

@property (readonly,nonatomic) TCustomView * customView1;

- (void) showCustomView1;

@end
