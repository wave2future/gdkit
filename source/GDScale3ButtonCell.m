
#import "GDScale3ButtonCell.h"

static int defaultSliceSizeWidth = 7;
static int defaultSliceSizeHeight = 7;

@implementation GDScale3ButtonCell
@synthesize upImage;
@synthesize downImage;
@synthesize sliceSize;
@synthesize upImageName;
@synthesize downImageName;
@synthesize sliceSizeHeight;
@synthesize sliceSizeWidth;
@synthesize vertical;
@synthesize horizontal;

+ (void) setDefaultSliceSizeWidth:(int) width {
	defaultSliceSizeWidth = width;
}

+ (void) setDefaultSliceSizeHeight:(int) height {
	defaultSliceSizeHeight = height;
}

+ (int) defaultSliceSizeWidth {
	return defaultSliceSizeWidth;
}

+ (int) defaultSliceSizeHeight {
	return defaultSliceSizeHeight;
}

- (id) copyWithZone:(NSZone *) zone {
	GDScale3ButtonCell * copy;
	copy = (GDScale3ButtonCell*)[super copyWithZone:zone];
	copy->upImage = nil;
	copy->downImage = nil;
	copy->upSlices = nil;
	copy->downSlices = nil;
	copy->lastUpSlicedImage = nil;
	copy->lastDownSlicedImage = nil;
	copy->upImageName = nil;
	copy->downImageName = nil;
	copy->reslice = false;
	copy->resliceDown = false;
	copy->resliceUp = false;
	copy->decoding = false;
	copy->upImageNameChanged = false;
	copy->downImageNameChanged = false;
	copy->vertical = vertical;
	copy->changedOrientation = false;
	[copy setUpImage:upImage];
	[copy setDownImage:downImage];
	[copy setUpImageName:upImageName];
	[copy setDownImageName:downImageName];
	return copy;
}

- (id) init {
	if(!(self=[super init])) return nil;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	IBDocument = NSClassFromString(@"IBDocument");
	document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
	gdKitIBBundle = [[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"] retain];
	horizontal = true;
	fileManager = [NSFileManager defaultManager];
	if(sliceSize.width < 1) sliceSize.width = defaultSliceSizeWidth;
	if(sliceSize.height < 1) sliceSize.height = defaultSliceSizeHeight;
	[self setBezelStyle:NSRegularSquareBezelStyle];
	return self;
}

- (id) initWithCoder:(NSCoder *) _coder {
	if(!(self=[super initWithCoder:_coder])) return nil;
	NSKeyedUnarchiver * unarchiver = (NSKeyedUnarchiver *)_coder;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	IBDocument = NSClassFromString(@"IBDocument");
	document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
	gdKitIBBundle = [[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"] retain];
	fileManager = [NSFileManager defaultManager];
	decoding = true;
	horizontal = true;
	if([unarchiver containsValueForKey:@"GDScale3ButtonCell.upImageName"]) [self setUpImageName:[unarchiver decodeObjectForKey:@"GDScale3ButtonCell.upImageName"]];
	if([unarchiver containsValueForKey:@"GDScale3ButtonCell.downImageName"]) [self setDownImageName:[unarchiver decodeObjectForKey:@"GDScale3ButtonCell.downImageName"]];
	if([unarchiver containsValueForKey:@"GDScale3ButtonCell.sliceSize.width"]) sliceSize.width = [unarchiver decodeIntegerForKey:@"GDScale3ButtonCell.sliceSize.width"];
	if([unarchiver containsValueForKey:@"GDScale3ButtonCell.sliceSize.height"]) sliceSize.height = [unarchiver decodeIntegerForKey:@"GDScale3ButtonCell.sliceSize.height"];
	if([unarchiver containsValueForKey:@"GDScale3ButtonCell.vertical"]) vertical = [unarchiver decodeBoolForKey:@"GDScale3ButtonCell.vertical"];
	if([unarchiver containsValueForKey:@"GDScale3ButtonCell.horizontal"]) horizontal = [unarchiver decodeBoolForKey:@"GDScale3ButtonCell.horizontal"];
	if(!upImage && upImageName) [self setUpImage:[NSImage imageNamed:upImageName]];
	if(!downImage && downImageName) [self setDownImage:[NSImage imageNamed:downImageName]];
	if(sliceSize.width < 1) sliceSize.width = defaultSliceSizeWidth;
	if(sliceSize.height < 1) sliceSize.height = defaultSliceSizeHeight;
	[self setBezelStyle:NSRegularSquareBezelStyle];
	decoding = false;
	if([self controlView]) [[self controlView] setNeedsDisplay:true];
	return self;
}

- (void) encodeWithCoder:(NSCoder *) _coder {
	[super encodeWithCoder:_coder];
	NSKeyedArchiver * archiver = (NSKeyedArchiver *)_coder;
	[archiver encodeObject:upImageName forKey:@"GDScale3ButtonCell.upImageName"];
	[archiver encodeObject:downImageName forKey:@"GDScale3ButtonCell.downImageName"];
	[archiver encodeInteger:sliceSize.width forKey:@"GDScale3ButtonCell.sliceSize.width"];
	[archiver encodeInteger:sliceSize.height forKey:@"GDScale3ButtonCell.sliceSize.height"];
	[archiver encodeBool:vertical forKey:@"GDScale3ButtonCell.vertical"];
	[archiver encodeBool:horizontal forKey:@"GDScale3ButtonCell.horizontal"];
}

- (float) sliceSizeWidth {
	return sliceSize.width;
}

- (void) setsliceSizeWidth:(float) _width {
	if(sliceSize.width != _width) {
		sliceSize.width = _width;
		reslice = true;
		if(!decoding) if([self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (float) sliceSizeHeight {
	return sliceSize.height;
}

- (void) setsliceSizeHeight:(float) _height {
	if(sliceSize.height != _height) {
		sliceSize.height = _height;
		reslice = true;
		if(!decoding) if([self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setsliceSize:(NSSize) _size {
	if(sliceSize.width != _size.width || sliceSize.height != _size.height) {
		sliceSize = _size;
		if(sliceSize.width < 1) sliceSize.width = defaultSliceSizeWidth;
		if(sliceSize.height < 1) sliceSize.height = defaultSliceSizeHeight;
		reslice = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setUpImage:(NSImage *) _image {
	if(_image != upImage) {
		[upImage release];
		upImage = [_image retain];
		resliceUp = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setDownImage:(NSImage *) _image {
	if(_image != downImage) {
		[downImage release];
		downImage = [_image retain];
		resliceDown = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setUpImageName:(NSString *) _upImageName {
	if(![upImageName isEqual:_upImageName]) {
		[upImageName release];
		upImageName = [_upImageName retain];
		upImageNameChanged = true;
		resliceUp = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setDownImageName:(NSString *) _downImageName {
	if(![downImageName isEqual:_downImageName]) {
		[downImageName release];
		downImageName = [_downImageName retain];
		downImageNameChanged = true;
		resliceDown = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setVertical:(Boolean) _vertical {
	if(vertical != _vertical) {
		vertical = _vertical;
		if(!vertical) horizontal = true;
		else horizontal = false;
		if([[self controlView] isKindOfClass:[GDScale3Button class]]) {
			[(GDScale3Button *)[self controlView] triggerObserverNotificationForProperty:@"horizontal"];
		}
		reslice = true;
		changedOrientation = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) setHorizontal:(Boolean) _horizontal {
	if(horizontal != _horizontal) {
		horizontal = _horizontal;
		if(!horizontal) vertical = true;
		else vertical = false;
		if([[self controlView] isKindOfClass:[GDScale3Button class]]) {
			[(GDScale3Button *)[self controlView] triggerObserverNotificationForProperty:@"vertical"];
		}
		reslice = true;
		changedOrientation = true;
		if(!decoding && [self controlView]) [[self controlView] setNeedsDisplay:true];
	}
}

- (void) drawBezelWithFrame:(NSRect) frame inView:(NSView *) controlView {
	frame = NSInsetRect(frame,2,2);
	frame.size.height -= 2;
	NSString * path;
	if(!upImage && upImageName) upImage = [[NSImage imageNamed:upImageName] retain];
	if(!downImage && downImageName) downImage = [[NSImage imageNamed:downImageName] retain];
	if(upImageNameChanged || changedOrientation) {
		changedOrientation = false;
		upImageNameChanged = false;
		GDRelease(upImage);
		upImage = [[NSImage imageNamed:upImageName] retain];
		if(!upImage && isInInterfaceBuilder) {
			if(!document) document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			upImage = [[document performSelector:@selector(documentImageNamed:) withObject:[upImageName stringByDeletingPathExtension]] retain];
			if(!upImage) {
				if(!vertical) path = [gdKitIBBundle pathForResource:@"scale_three_button_icon_horizontal" ofType:@"png"];
				else path = [gdKitIBBundle pathForResource:@"scale_three_button_icon_vertical" ofType:@"png"];
				if([fileManager fileExistsAtPath:path]) upImage = [[NSImage alloc] initWithContentsOfFile:path];
			}
		}
	}
	if(downImageNameChanged || changedOrientation) {
		changedOrientation = false;
		downImageNameChanged = false;
		GDRelease(downImage);
		downImage = [[NSImage imageNamed:downImageName] retain];
		if(!downImage && isInInterfaceBuilder) {
			if(!document) document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			downImage = [[document performSelector:@selector(documentImageNamed:) withObject:[downImageName stringByDeletingPathExtension]] retain];
			if(!downImage) {
				if(!vertical) path = [gdKitIBBundle pathForResource:@"scale_three_button_icon_horizontal_down" ofType:@"png"];
				else path = [gdKitIBBundle pathForResource:@"scale_three_button_icon_vertical_down" ofType:@"png"];
				if([fileManager fileExistsAtPath:path]) downImage = [[NSImage alloc] initWithContentsOfFile:path];
			}
		}
	}
	if(!upImage && !downImage) {
		reslice = false;
		resliceUp = false;
		resliceDown = false;
		downImageNameChanged = false;
		upImageNameChanged = false;
		return;
	}
	if((resliceDown || reslice || lastDownSlicedImage != downImage) && downImage) {
		GDRelease(downSlices);
		downSlices = [sliceImageForDrawThree(downImage,sliceSize,vertical,false) retain];
		lastDownSlicedImage = downImage;
	}
	if((resliceUp || reslice || lastUpSlicedImage != upImage) && upImage) {
		GDRelease(upSlices);
		upSlices = [sliceImageForDrawThree(upImage,sliceSize,vertical,false) retain];
		lastUpSlicedImage = upImage;
	}
	sourceSlices = nil;
	reslice = false;
	if([self isHighlighted] && downSlices) sourceSlices = downSlices;
	if([self isHighlighted] && (!downImage || !downSlices) && upSlices) sourceSlices = upSlices;
	if(![self isHighlighted] && upSlices) sourceSlices = upSlices;
	if(![self isHighlighted] && (!upSlices || !upImage)) sourceSlices = nil;
	if(!sourceSlices || [sourceSlices count] < 3) return;
	NSDrawThreePartImage(frame,[sourceSlices objectAtIndex:0],[sourceSlices objectAtIndex:1],[sourceSlices objectAtIndex:2],vertical,NSCompositeSourceOver,1,[controlView isFlipped]);
}

- (void) dealloc {
	GDRelease(gdKitIBBundle);
	GDRelease(upImageName);
	GDRelease(downImageName);
	GDRelease(upSlices);
	GDRelease(downSlices);
	GDRelease(upImage);
	GDRelease(downImage);
	document = nil;
	sourceSlices = nil;
	fileManager = nil;
	lastUpSlicedImage = nil;
	lastDownSlicedImage = nil;
	sliceSizeWidth = 0;
	sliceSizeHeight = 0;
	IBDocument = 0;
	isInInterfaceBuilder = false;
	decoding = false;
	reslice = false;
	resliceUp = false;
	resliceDown = false;
	upImageNameChanged = false;
	downImageNameChanged = false;
	changedOrientation = false;
	sliceSize = NSZeroSize;
	[super dealloc];
}

@end
