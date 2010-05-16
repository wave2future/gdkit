
#import <InterfaceBuilderKit/InterfaceBuilderKit.h>
#import <GDKit/GDKit.h>
#import "GDScale3ButtonInspector.h"

@implementation GDScale3Button (Additions)

- (void) ibPopulateKeyPaths:(NSMutableDictionary *) keyPaths {
	[super ibPopulateKeyPaths:keyPaths];
	[[keyPaths objectForKey:IBAttributeKeyPaths] addObjectsFromArray:[NSArray arrayWithObjects:@"vertical",@"upImageName",@"downImageName",@"upImage",@"downImage",@"sliceSizeWidth",@"sliceSizeHeight",nil]];
}

- (void) ibPopulateAttributeInspectorClasses:(NSMutableArray *) classes {
	[super ibPopulateAttributeInspectorClasses:classes];
	[classes addObject:[GDScale3ButtonInspector class]];
}

@end
