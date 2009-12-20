
#import <Foundation/Foundation.h>

#define or ||
#define not !=
#define and &&
#define eq ==
#define is ==

NS_INLINE void GDRelease(id obj) {
	//NSLog(@"retainCount: %@ \t\t %i",obj,[obj retainCount]);
	if(obj != NULL && [obj retainCount]>0)[obj release];
	//NSLog(@"retainCountAfter: %@ \t\t %i",obj,[obj retainCount]);
	obj=NULL;
}
