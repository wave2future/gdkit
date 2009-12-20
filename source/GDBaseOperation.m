
#import "GDBaseOperation.h"

@implementation GDBaseOperation

- (BOOL) isFinished {
	return done;
}

- (BOOL) isCancelled {
	return canceled;
}

- (void) main {
	done=true;
}

- (void) cancel	{
	canceled=true;
	[super cancel];
}

- (void) dealloc {
	done=false;
	canceled=false;
	[super dealloc];
}

@end
