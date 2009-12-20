
#import "TCustomView.h"
#import "TViewController.h"

@implementation TCustomView

- (id) init {
	self=[super init];
	NSLog(@"1");
	NSLog(@"%@",[[gd views] customView1]);
	//NSLog(@"%@",[[gd views] customView1]);
	return self;
}

@end
