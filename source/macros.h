
#import <Foundation/Foundation.h>

/**
 * @file macros.h
 * 
 * Header file that contains macros, and other c definitions.
 */

#define or ||
#define not !=
#define and &&
#define eq ==
#define is ==

/**
 * Releases and nil's out any id object.
 */
NS_INLINE void GDRelease(id obj) {
	//NSLog(@"retainCount: %@ \t\t %i",obj,[obj retainCount]);
	if(obj != NULL && [obj retainCount]>0)[obj release];
	//NSLog(@"retainCountAfter: %@ \t\t %i",obj,[obj retainCount]);
	obj=NULL;
}
