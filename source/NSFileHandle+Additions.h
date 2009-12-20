
#import <Cocoa/Cocoa.h>

@interface NSFileHandle (Additions)

- (id) initWithFile:(NSString *) file;
- (id) initWithTruncatedFile:(NSString *) file;

@end
