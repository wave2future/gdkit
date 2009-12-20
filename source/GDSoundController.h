
#import <Cocoa/Cocoa.h>
#import "macros.h"

@interface GDSoundController : NSObject {
	NSSound * popSound;
}

- (void) clearCache;
- (void) pop;
- (void) popAtVolume:(float) _volume;

@end
