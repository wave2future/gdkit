
#import <Cocoa/Cocoa.h>
#import "GDScale9ButtonCell.h"

@interface GDScale9Button : NSButton {
}

- (void) setCornerSize:(NSSize) _size;
- (void) setUpImage:(NSImage *) _image;
- (void) setDownImage:(NSImage *) _image;
- (void) setDownImageName:(NSString *) _downImageName;
- (void) setUpImageName:(NSString *) _upImageName;
- (void) setCornerSizeWidth:(float) _width;
- (void) setCornerSizeHeight:(float) _height;
- (float) cornerSizeWidth;
- (float) cornerSizeHeight;
- (NSSize) cornerSize;
- (NSImage *) upImage;
- (NSImage *) downImage;
- (NSString *) upImageName;
- (NSString *) downImageName;

@end
