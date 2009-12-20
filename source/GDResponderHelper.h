
#import <Cocoa/Cocoa.h>
#import "macros.h"

@interface GDResponderHelper : NSObject {

}

+ (void) ifIsEscapeKey:(NSEvent *) event sendAction:(SEL) _action toTarget:(id) _target;

@end
