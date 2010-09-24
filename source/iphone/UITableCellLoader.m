
#import "UITableCellLoader.h"

@implementation UITableCellLoader
@synthesize nibName;
@synthesize nibbedCell;

- (id) initWithNibName:(NSString *) _nibName {
	if(!(self = [super init])) return nil;
	[self setNibName:_nibName];
	return self;
}

- (void) load {
	NSBundle * mb = [NSBundle mainBundle];
	[mb loadNibNamed:nibName owner:self options:nil];
	if([nibbedCell respondsToSelector:@selector(ifRespondsPerformSelector:)]) {
		[nibbedCell ifRespondsPerformSelector:@selector(viewDidLoad)];
	}
}

- (void) dealloc {
	[nibName release];
	[nibbedCell release];
	nibName = nil;
	nibbedCell = nil;
	#ifdef ACNSLogDealloc
	NSLog(@"DEALLOC UITableCellLoader");
	#endif
	[super dealloc];
}

@end
