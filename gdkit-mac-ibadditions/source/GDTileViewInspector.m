
#import "GDTileViewInspector.h"

@implementation GDTileViewInspector

+ (BOOL) supportsMultipleObjectInspection {
	return false;
}

- (NSString *) label {
	return @"Tile View Attributes";
}

- (NSString *) viewNibName {
	return @"TileViewInspector";
}

@end
