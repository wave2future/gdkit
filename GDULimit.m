//copyright 2009 aaronsmith

#import "GDULimit.h"

@implementation GDULimit

+ (void) enableCoreDumps {
	struct rlimit r1;
	r1.rlim_cur = RLIM_INFINITY;
	r1.rlim_max = RLIM_INFINITY;
	const char * error_msg;
	if(setrlimit(RLIMIT_CORE,&r1)==-1) {
		NSString * appname = [[NSBundle mainBundle] bundleIdentifier];
		GDASLLog * log = [[GDASLLog alloc] initWithSender:appname facility:appname connectImmediately:TRUE];
		error_msg = strerror(errno);
		[log error:[NSString stringWithCString:error_msg]];
		[log release];
	}
}

@end
