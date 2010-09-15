
#import <InterfaceBuilderKit/InterfaceBuilderKit.h>
#import <GDKit/GDKit.h>
#import "GDScale9ButtonInspector.h"

@implementation GDScale9Button (Additions)

- (void) ibPopulateKeyPaths:(NSMutableDictionary *) keyPaths {
	[super ibPopulateKeyPaths:keyPaths];
	[[keyPaths objectForKey:IBAttributeKeyPaths] addObjectsFromArray:[NSArray arrayWithObjects:@"upImageName",@"downImageName",@"upImage",@"downImage",@"cornerSizeWidth",@"cornerSizeHeight",nil]];
}

- (void) ibPopulateAttributeInspectorClasses:(NSMutableArray *) classes {
	[super ibPopulateAttributeInspectorClasses:classes];
	[classes addObject:[GDScale9ButtonInspector class]];
}

@end
