
#import <InterfaceBuilderKit/InterfaceBuilderKit.h>
#import <GDKit/GDKit.h>
#import "GDScale3ViewInspector.h"

@implementation GDScale3View (Additions)

- (void) ibPopulateKeyPaths:(NSMutableDictionary *) keyPaths {
	[super ibPopulateKeyPaths:keyPaths];
	[[keyPaths objectForKey:IBAttributeKeyPaths] addObjectsFromArray:[NSArray arrayWithObjects:@"vertical",@"horizontal",@"sourceImageName",@"sourceImage",@"sliceSize",@"sliceWidth",@"sliceHeight",nil]];
}

- (void) ibPopulateAttributeInspectorClasses:(NSMutableArray *) classes {
	[super ibPopulateAttributeInspectorClasses:classes];
	[classes addObject:[GDScale3ViewInspector class]];
}

@end
