
#import <Cocoa/Cocoa.h>
#import "macros.h"

@interface GDApplicationInfo : NSMutableDictionary {

}

+ (GDApplicationInfo *) instanceFromDefaultPlist;
+ (GDApplicationInfo *) instanceFromLoadingPlist:(NSString *) _plist;
+ (void) setDefaultInstance:(GDApplicationInfo *) instance;
- (void) loadDefaultInfoPlist;
- (void) loadPlist:(NSString *) _plist;

@end
