
#import "GDScale3Button.h"
#import "GDScale3ButtonCell.h"

@implementation GDScale3Button

+ (id) cellClass {
	return [GDScale3ButtonCell class];
}

- (void) triggerObserverNotificationForProperty:(NSString *) _property {
	[self willChangeValueForKey:_property];
	[self didChangeValueForKey:_property];
}

- (void) setSliceSize:(NSSize) _size {
	[[self cell] setSliceSize:_size];
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

- (void) setSliceSizeWidth:(float) _width {
	[[self cell] setSliceSizeWidth:_width];
}

- (void) setSliceSizeHeight:(float) _height {
	[[self cell] setSliceSizeHeight:_height];
}

- (void) setVertical:(Boolean) _vertical {
	[[self cell] setVertical:_vertical];
}

- (void) setHorizontal:(Boolean) _horizontal {
	[[self cell] setHorizontal:_horizontal];
}

- (Boolean) vertical {
	return [[self cell] vertical];
}

- (Boolean) horizontal {
	return [[self cell] horizontal];
}

- (NSSize) sliceSize {
	return [[self cell] sliceSize];
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

- (float) sliceSizeWidth {
	return [[self cell] sliceSizeWidth];
}

- (float) sliceSizeHeight {
	return [[self cell] sliceSizeHeight];
}

@end
