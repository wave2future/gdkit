
#import "GDScale9View.h"

static int defaultCornerWidth = 7;
static int defaultCornerHeight = 7;

@implementation GDScale9View
@synthesize sourceImageName;
@synthesize sourceImage;
@synthesize cornerSize;
@synthesize cornerSizeWidth;
@synthesize cornerSizeHeight;

+ (void) setDefaultCornerWidth:(int) width {
	defaultCornerWidth = width;
}

+ (void) setDefaultCornerHeight:(int) height {
	defaultCornerHeight = height;
}

+ (int) defaultCornerWidth {
	return defaultCornerWidth;
}

+ (int) defaultCornerHeight {
	return defaultCornerHeight;
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
	if([unarchiver containsValueForKey:@"GDScale9View.sourceImageName"]) [self setSourceImageName:[unarchiver decodeObjectForKey:@"GDScale9View.sourceImageName"]];
	if([unarchiver containsValueForKey:@"GDScale9View.cornerSize.width"]) cornerSize.width = [unarchiver decodeIntegerForKey:@"GDScale9View.cornerSize.width"];
	if([unarchiver containsValueForKey:@"GDScale9View.cornerSize.height"]) cornerSize.height = [unarchiver decodeIntegerForKey:@"GDScale9View.cornerSize.height"];
	if(!sourceImage && sourceImageName) [self setSourceImage:[NSImage imageNamed:sourceImageName]];
	if(cornerSize.width < 1) cornerSize.width = defaultCornerWidth;
	if(cornerSize.height < 1) cornerSize.height = defaultCornerHeight;
	decoding = false;
	imageNameChanged = true;
	reslice = true;
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
	if(cornerSize.width < 1) cornerSize.width = defaultCornerWidth;
	if(cornerSize.height < 1) cornerSize.height = defaultCornerHeight;
	return self;
}

- (void) encodeWithCoder:(NSCoder *) _coder {
	[super encodeWithCoder:_coder];
	NSKeyedArchiver * archiver = (NSKeyedArchiver *)_coder;
	if(sourceImageName) [archiver encodeObject:sourceImageName forKey:@"GDScale9View.sourceImageName"];
	[archiver encodeInteger:cornerSize.width forKey:@"GDScale9View.cornerSize.width"];
	[archiver encodeInteger:cornerSize.height forKey:@"GDScale9View.cornerSize.height"];
}

- (void) setCornerSizeWidth:(float) _width {
	if(_width < 1) return;
	if(cornerSize.width != _width) {
		cornerSize.width = _width;
		reslice = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (float) cornerSizeWidth {
	return cornerSize.width;
}

- (void) setCornerSizeHeight:(float) _height {
	if(_height < 1) return;
	if(cornerSize.height != _height) {
		cornerSize.height = _height;
		reslice = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (float) cornerSizeHeight {
	return cornerSize.height;
}

- (void) setSourceImage:(NSImage *) _image {
	if(_image != sourceImage) {
		[sourceImage release];
		sourceImage = [_image retain];
		reslice = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setSourceImageName:(NSString *) _name {
	if(![sourceImageName isEqual:_name]) {
		[sourceImageName release];
		sourceImageName = [_name copy];
		imageNameChanged = true;
		reslice = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) setCornerSize:(NSSize) _size {
	if(cornerSize.width != _size.width || cornerSize.height != _size.height) {
		cornerSize = _size;
		if(cornerSize.width < 1) cornerSize.width = defaultCornerWidth;
		if(cornerSize.height < 1) cornerSize.height = defaultCornerHeight;
		reslice = true;
		if(!decoding) [self setNeedsDisplay:true];
	}
}

- (void) drawRect:(NSRect) dirtyrect {
	[super drawRect:dirtyrect];
	if(!sourceImage && sourceImageName) sourceImage = [[NSImage imageNamed:sourceImageName] retain];
	if(imageNameChanged) {
		imageNameChanged = false;
		GDRelease(sourceImage);
		sourceImage = [[NSImage imageNamed:sourceImageName] retain];
		if(!sourceImage && isInInterfaceBuilder) {
			if(!document) document = [IBDocument performSelector:@selector(documentForObject:) withObject:self];
			sourceImage = [[document performSelector:@selector(documentImageNamed:) withObject:[sourceImageName stringByDeletingPathExtension]] retain];
			if(!sourceImage) {
				NSString * path = [gdKitIBBundle pathForResource:@"scale_nine_view_icon" ofType:@"png"];
				if([fileManager fileExistsAtPath:path]) sourceImage = [[NSImage alloc] initWithContentsOfFile:path];
			}
		}
	}
	if(!sourceImage) {
		reslice = false;
		return;
	}
	if(reslice || lastSlicedImage != sourceImage || !slices) {
		reslice = false;
		GDRelease(slices);
		slices = [sliceImageForDrawNine(sourceImage,cornerSize) retain];
		lastSlicedImage = sourceImage;
	}
	if(slices) {
		NSDrawNinePartImage([self bounds],[slices objectAtIndex:0],[slices objectAtIndex:1],[slices objectAtIndex:2],
			[slices objectAtIndex:3],[slices objectAtIndex:4],[slices objectAtIndex:5],
			[slices objectAtIndex:6],[slices objectAtIndex:7],[slices objectAtIndex:8],NSCompositeSourceOver,[self alphaValue],[self isFlipped]);
	}
}

- (void) dealloc {
	GDRelease(gdKitIBBundle);
	GDRelease(sourceImageName);
	GDRelease(slices);
	GDRelease(sourceImage);
	cornerSizeWidth = 0;
	cornerSizeHeight = 0;
	document = nil;
	IBDocument = nil;
	lastSlicedImage = nil;
	fileManager = nil;
	cornerSize = NSZeroSize;
	decoding = false;
	imageNameChanged = false;
	reslice = false;
	isInInterfaceBuilder = false;
	[super dealloc];
}

@end
