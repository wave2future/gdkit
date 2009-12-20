
#import <Cocoa/Cocoa.h>
#import "GDBaseObject.h"

#if MAC_OS_X_VERSION_MAX_ALLOWED > MAC_OS_X_VERSION_10_5
@interface GDDocumentWindowDelegate : GDBaseObject <NSWindowDelegate> {
#else
@interface GDDocumentWindowDelegate : GDBaseObject {
#endif
	
}

@end
