
#import <Cocoa/Cocoa.h>
#import "GDScale9ButtonCell.h"

@interface GDScale9Button : NSButton {

}

- (void) setCornerSize:(NSSize) _size;

- (void) setUpImage:(NSImage *) _image;

- (void) setDownImage:(NSImage *) _image;

- (void) setUpImageName:(NSString *) _upImageName;

- (void) setDownImageName:(NSString *) _downImageName;

- (NSSize) cornerSize;

- (NSImage *) upImage;

- (NSImage *) downImage;

- (NSString *) upImageName;

- (NSString *) downImageName;

@end
