
#import <Cocoa/Cocoa.h>
#import <GDKit/GDKit.h>

@interface TViewController : GDViewController {
	IBOutlet GDBaseView * customView;
}

@property (retain,nonatomic) IBOutlet GDBaseView * customView;

- (void) showCustomView;

@end
