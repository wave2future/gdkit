
#import <InterfaceBuilderKit/InterfaceBuilderKit.h>
#import <GDKit/GDKit.h>
#import "GDScale9ViewInspector.h"

@implementation GDScale9View (Additions)

- (void) ibPopulateKeyPaths:(NSMutableDictionary *) keyPaths {
	[super ibPopulateKeyPaths:keyPaths];
	[[keyPaths objectForKey:IBAttributeKeyPaths] addObjectsFromArray:[NSArray arrayWithObjects:@"sourceImage",@"sourceImageName",@"cornerSize",@"cornerSizeWidth",@"cornerSizeHeight",nil]];
}

- (void) ibPopulateAttributeInspectorClasses:(NSMutableArray *) classes {
	[super ibPopulateAttributeInspectorClasses:classes];
	[classes addObject:[GDScale9ViewInspector class]];
}

@end
