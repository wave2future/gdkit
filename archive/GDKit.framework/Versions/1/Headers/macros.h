
#import <Foundation/Foundation.h>

#define or ||
#define not !=
#define and &&
#define eq ==
#define is ==

NS_INLINE void GDRelease(id obj) {
	{
		if(obj not nil) [obj release];
		obj=nil;
	}
	
}
