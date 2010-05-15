
#import <InterfaceBuilderKit/InterfaceBuilderKit.h>
#import <GDKit/GDKit.h>
#import "GDGradientBoxViewInspector.h"

@implementation GDGradientBoxView (Additions)

- (void) ibPopulateKeyPaths:(NSMutableDictionary *) keyPaths {
	[super ibPopulateKeyPaths:keyPaths];
	[[keyPaths objectForKey:IBAttributeKeyPaths] addObjectsFromArray:[NSArray arrayWithObjects:@"color1",@"color2",@"angle",nil]];
}

- (void) ibPopulateAttributeInspectorClasses:(NSMutableArray *) classes {
	[super ibPopulateAttributeInspectorClasses:classes];
	[classes addObject:[GDGradientBoxViewInspector class]];
}

@end
