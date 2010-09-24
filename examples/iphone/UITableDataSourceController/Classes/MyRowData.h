
#import <Foundation/Foundation.h>

@interface MyRowData : NSObject {
	NSString * label;
}

@property (nonatomic,retain) NSString * label;

+ (id) dataWithLabel:(NSString *) aLabel;

@end
