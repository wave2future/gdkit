
#import <Cocoa/Cocoa.h>

#if MAC_OS_X_VERSION_MAX_ALLOWED > MAC_OS_X_VERSION_10_5
@interface GDDocumentController : NSDocumentController <NSApplicationDelegate> {
#else
@interface GDDocumentController : NSDocumentController {
#endif

}

@end
