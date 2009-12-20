
#import <Cocoa/Cocoa.h>
#import "GDBaseObject.h"

#if MAC_OS_X_VERSION_MAX_ALLOWED > MAC_OS_X_VERSION_10_5
@interface GDApplicationDelegate : GDBaseObject <NSApplicationDelegate> {
#else
@interface GDApplicationDelegate : GDBaseObject {
#endif
	
}

@end
