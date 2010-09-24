
#import "GDScale9Button.h"

@implementation GDScale9Button

+ (id) cellClass {
	return [GDScale9ButtonCell class];
}

- (void) setCornerSize:(NSSize) _size {
	[[self cell] setCornerSize:_size];
}

- (void) setUpImage:(NSImage *) _image {
	[[self cell] setUpImage:_image];
}

- (void) setDownImage:(NSImage *) _image {
	[[self cell] setDownImage:_image];
}

- (void) setDownImageName:(NSString *) _downImageName {
	[[self cell] setDownImageName:_downImageName];
}

- (void) setUpImageName:(NSString *) _upImageName {
	[[self cell] setUpImageName:_upImageName];
}

- (void) setCornerSizeWidth:(float) _width {
	[[self cell] setCornerSizeWidth:_width];
}

- (void) setCornerSizeHeight:(float) _height {
	[[self cell] setCornerSizeHeight:_height];
}

- (NSSize) cornerSize {
	return [[self cell] cornerSize];
}

- (NSImage *) upImage {
	return [[self cell] upImage];
}

- (NSImage *) downImage {
	return [[self cell] downImage];
}

- (NSString *) upImageName {
	return [[self cell] upImageName];
}

- (NSString *) downImageName {
	return [[self cell] downImageName];
}

- (float) cornerSizeWidth {
	return [[self cell] cornerSizeWidth];
}

- (float) cornerSizeHeight {
	return [[self cell] cornerSizeHeight];
}

@end
