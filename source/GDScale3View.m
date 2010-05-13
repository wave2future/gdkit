
#import "GDScale3View.h"

static int defaultSliceSizeWidth = 7;
static int defaultSliceSizeHeight = 7;

@implementation GDScale3View
@synthesize vertical;
@synthesize sliceSize;
@synthesize sourceImage;
@synthesize sourceImageName;
@synthesize sliceWidth;
@synthesize sliceHeight;

- (id) initWithCoder:(NSCoder *) _coder {
	if(!(self=[super initWithCoder:_coder])) return nil;
	isInInterfaceBuilder = [self respondsToSelector:@selector(ibPopulateKeyPaths:)];
	NSKeyedUnarchiver * unarchiver = (NSKeyedUnarchiver *)_coder;
	decoding = true;
	if([unarchiver containsValueForKey:@"GDScale3View.sourceImageName"]) [self setSourceImageName:[unarchiver decodeObjectForKey:@"GDScale3View.sourceImageName"]];
	if([unarchiver containsValueForKey:@"GDScale3View.sliceSize.width"]) sliceSize.width = [unarchiver decodeIntegerForKey:@"GDScale3View.sliceSize.width"];
	if([unarchiver containsValueForKey:@"GDScale3View.sliceSize.height"]) sliceSize.height = [unarchiver decodeIntegerForKey:@"GDScale3View.sliceSize.height"];
	if([unarchiver containsValueForKey:@"GDScale3View.vertical"]) vertical = [unarchiver decodeBoolForKey:@"GDScale3View.vertical"];
	if(!sourceImage && sourceImageName) sourceImage = [[NSImage imageNamed:sourceImageName] retain];
	if(sliceSize.width < 1) sliceSize.width = defaultSliceSizeWidth;
	if(sliceSize.height < 1) sliceSize.height = defaultSliceSizeHeight;
	decoding = false;
	reslice = true;
	[self setNeedsDisplay:true];
	return self;
}

- (void) encodeWithCoder:(NSCoder *) _coder {
	[super encodeWithCoder:_coder];
	NSKeyedArchiver * archiver = (NSKeyedArchiver *)_coder;
	if(sourceImageName)[archiver encodeObject:sourceImageName forKey:@"GDScale3View.sourceImageName"];
	[archiver encodeInteger:sliceSize.width forKey:@"GDScale3View.sliceSize.width"];
	[archiver encodeInteger:sliceSize.height forKey:@"GDScale3View.sliceSize.height"];
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
		reslice	= true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) drawRect:(NSRect) dirtyrect {
	[super drawRect:dirtyrect];
	if(!sourceImage && sourceImageName) sourceImage = [[NSImage imageNamed:sourceImageName] retain];
	if(isInInterfaceBuilder) {
		Class IBDocument = NSClassFromString(@"IBDocument");
		id document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
		if(document) {
			if(imageNameChanged) {
				imageNameChanged = false;
				if(sourceImage) [sourceImage release];
				sourceImage = [[document performSelector:@selector(documentImageNamed:) withObject:[sourceImageName stringByDeletingPathExtension]] retain];
			}
			if(!sourceImage) {
				NSBundle * bundle = [NSBundle bundleWithIdentifier:@"com.macendeavor.GDKitMacIBAdditions"];
				NSString * path = [bundle pathForResource:@"scale_three_view_icon_horizontal" ofType:@"png"];
				NSFileManager * fm = [NSFileManager defaultManager];
				if([fm fileExistsAtPath:path]) {
					if(sourceImage) [sourceImage release];
					sourceImage = [[NSImage alloc] initWithContentsOfFile:path];
				}
			}
		}
	}
	if(!sourceImage) {
		reslice = false;
		return;
	}
	if(reslice || !slices) {
		reslice = false;
		[slices release];
		slices = [sliceImageForDrawThree(sourceImage,sliceSize,vertical) retain];
	}
	if(slices) NSDrawThreePartImage([self bounds],[slices objectAtIndex:0],[slices objectAtIndex:1],[slices objectAtIndex:2],vertical,NSCompositeSourceOver,[self alphaValue],[self isFlipped]);
}

- (void) dealloc {
	GDRelease(slices);
	GDRelease(sourceImage);
	GDRelease(sourceImageName);
	sliceSize=NSZeroSize;
	decoding=false;
	vertical=false;
	[super dealloc];
}

@end
