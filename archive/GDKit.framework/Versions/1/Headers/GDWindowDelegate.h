
#import <Cocoa/Cocoa.h>
#import "GDBaseObject.h"

#if MAC_OS_X_VERSION_MAX_ALLOWED > MAC_OS_X_VERSION_10_5
@interface GDWindowDelegate : GDBaseObject <NSWindowDelegate> {
#else
@interface GDWindowDelegate : GDBaseObject {
#endif
	
}

@end
