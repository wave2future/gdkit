
#import "GDScale3View.h"

static int defaultSliceSizeWidth = 7;
static int defaultSliceSizeHeight = 7;

@implementation GDScale3View
@synthesize vertical;
@synthesize horizontal;
@synthesize sliceSize;
@synthesize sourceImage;
@synthesize sourceImageName;
@synthesize sliceWidth;
@synthesize sliceHeight;

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

- (id) initWithCoder:(NSCoder *) _coder {
	if(!(self=[super initWithCoder:_coder])) return nil;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	IBDocument = NSClassFromString(@"IBDocument");
	document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
	gdKitIBBundle = [[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"] retain];
	fileManager = [NSFileManager defaultManager];
	NSKeyedUnarchiver * unarchiver = (NSKeyedUnarchiver *)_coder;
	decoding = true;
	if([unarchiver containsValueForKey:@"GDScale3View.sourceImageName"]) [self setSourceImageName:[unarchiver decodeObjectForKey:@"GDScale3View.sourceImageName"]];
	if([unarchiver containsValueForKey:@"GDScale3View.sliceSize.width"]) sliceSize.width = [unarchiver decodeIntegerForKey:@"GDScale3View.sliceSize.width"];
	if([unarchiver containsValueForKey:@"GDScale3View.sliceSize.height"]) sliceSize.height = [unarchiver decodeIntegerForKey:@"GDScale3View.sliceSize.height"];
	if([unarchiver containsValueForKey:@"GDScale3View.vertical"]) vertical = [unarchiver decodeBoolForKey:@"GDScale3View.vertical"];
	if([unarchiver containsValueForKey:@"GDScale3View.horizontal"]) horizontal = [unarchiver decodeBoolForKey:@"GDScale3View.horizontal"];
	if(!sourceImage && sourceImageName) sourceImage = [[NSImage imageNamed:sourceImageName] retain];
	if(sliceSize.width < 1) sliceSize.width = defaultSliceSizeWidth;
	if(sliceSize.height < 1) sliceSize.height = defaultSliceSizeHeight;
	decoding = false;
	reslice = true;
	imageNameChanged = true;
	[self setNeedsDisplay:true];
	return self;
}

- (id) initWithFrame:(NSRect) framerect {
	if(!(self=[super initWithFrame:framerect])) return nil;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	IBDocument = NSClassFromString(@"IBDocument");
	document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
	gdKitIBBundle = [[NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"] retain];
	fileManager = [NSFileManager defaultManager];
	if(sliceSize.width < 1) sliceSize.width = defaultSliceSizeWidth;
	if(sliceSize.height < 1) sliceSize.height = defaultSliceSizeHeight;
	return self;
}

- (void) encodeWithCoder:(NSCoder *) _coder {
	[super encodeWithCoder:_coder];
	NSKeyedArchiver * archiver = (NSKeyedArchiver *)_coder;
	if(sourceImageName)[archiver encodeObject:sourceImageName forKey:@"GDScale3View.sourceImageName"];
	[archiver encodeInteger:sliceSize.width forKey:@"GDScale3View.sliceSize.width"];
	[archiver encodeInteger:sliceSize.height forKey:@"GDScale3View.sliceSize.height"];
	[archiver encodeBool:horizontal forKey:@"GDScale3View.horizontal"];
	[archiver encodeBool:vertical forKey:@"GDScale3View.vertical"];
}

- (float) sliceWidth {
	return sliceSize.width;
}

- (void) setSliceWidth:(float) _width {
	if(sliceSize.width != _width) {
		sliceSize.width = _width;
		reslice	= true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (float) sliceHeight {
	return sliceSize.height;
}

- (void) setSliceHeight:(float) _height {
	if(sliceSize.height != _height) {
		sliceSize.height = _height;
		reslice	= true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setSourceImage:(NSImage *) _image {
	if(sourceImage != _image) {
		[sourceImage release];
		sourceImage = [_image retain];
		reslice	= true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setSourceImageName:(NSString *) _name {
	if(![sourceImageName isEqual:_name]) {
		[sourceImageName release];
		sourceImageName = [_name copy];
		imageNameChanged = true;
		reslice	= true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setSliceSize:(NSSize) _size {
	if(sliceSize.width != _size.width || sliceSize.height != _size.height) {
		sliceSize = _size;
		if(sliceSize.width < 1) sliceSize.width = defaultSliceSizeWidth;
		if(sliceSize.height < 1) sliceSize.height = defaultSliceSizeHeight;
		reslice=true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setVertical:(Boolean) _vertical {
	if(vertical != _vertical) {
		vertical = _vertical;
		if(!vertical) horizontal = true;
		else horizontal = false;
		reslice	= true;
		changedOrienation = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setHorizontal:(Boolean) _horizontal {
	if(horizontal != _horizontal) {
		horizontal = _horizontal;
		if(!horizontal) vertical = true;
		else vertical = false;
		reslice = true;
		changedOrienation = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) drawRect:(NSRect) dirtyrect {
	[super drawRect:dirtyrect];
	NSString * path;
	if(!sourceImage && sourceImageName) sourceImage = [[NSImage imageNamed:sourceImageName] retain];
	if(imageNameChanged || changedOrienation) {
		changedOrienation = false;
		imageNameChanged = false;
		GDRelease(sourceImage);
		sourceImage = [[NSImage imageNamed:sourceImageName] retain];
		if(!sourceImage && isInInterfaceBuilder) {
			if(!document) document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			sourceImage = [[document performSelector:@selector(documentImageNamed:) withObject:[sourceImageName stringByDeletingPathExtension]] retain];
			if(!sourceImage) {
				if(!vertical) path = [gdKitIBBundle pathForResource:@"scale_three_view_icon_horizontal_large" ofType:@"png"];
				else path = [gdKitIBBundle pathForResource:@"scale_three_view_icon_vertical_large" ofType:@"png"];
				if([fileManager fileExistsAtPath:path]) sourceImage = [[NSImage alloc] initWithContentsOfFile:path];
			}
		}
	}
	if(!sourceImage) {
		reslice = false;
		imageNameChanged = false;
		return;
	}
	if(reslice || lastSlicedImage != sourceImage || !slices) {
		reslice = false;
		[slices release];
		slices = [sliceImageForDrawThree(sourceImage,sliceSize,vertical,false) retain];
		lastSlicedImage = sourceImage;
	}
	if(slices) NSDrawThreePartImage([self bounds],[slices objectAtIndex:0],[slices objectAtIndex:1],[slices objectAtIndex:2],vertical,NSCompositeSourceOver,[self alphaValue],[self isFlipped]);
}

- (void) dealloc {
	GDRelease(gdKitIBBundle);
	GDRelease(slices);
	GDRelease(sourceImage);
	GDRelease(sourceImageName);
	sliceWidth = 0;
	sliceHeight = 0;
	document = nil;
	IBDocument = nil;
	lastSlicedImage = nil;
	fileManager = nil;
	decoding = false;
	vertical = false;
	reslice = false;
	isInInterfaceBuilder = false;
	imageNameChanged = false;
	changedOrienation = false;
	sliceSize = NSZeroSize;
	[super dealloc];
}

@end
