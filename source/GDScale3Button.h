
#import <Cocoa/Cocoa.h>

@interface GDScale3Button : NSControl {
}

- (void) setSliceSize:(NSSize) _size;
- (void) setUpImage:(NSImage *) _image;
- (void) setDownImage:(NSImage *) _image;
- (void) setDownImageName:(NSString *) _downImageName;
- (void) setUpImageName:(NSString *) _upImageName;
- (void) setSliceSizeWidth:(float) _width;
- (void) setSliceSizeHeight:(float) _height;
- (void) setVertical:(Boolean) _vertical;
- (float) sliceSizeWidth;
- (float) sliceSizeHeight;
- (Boolean) vertical;
- (NSSize) sliceSize;
- (NSImage *) upImage;
- (NSImage *) downImage;
- (NSString *) upImageName;
- (NSString *) downImageName;

@end
