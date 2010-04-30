/**
 * @file macros.h
 * 
 * Header file that contains macros, and other c definitions.
 */

#import <Foundation/Foundation.h>

#ifndef __cplusplus
	
	/**
	 * OR (||) shortcut.
	 */
	#define or ||

	/**
	 * AND (&&) shortcut.
	 */
	#define and &&
	
	/**
	 * Not (!) shortcut.
	 */
	#define not !

	/**
	 * Equal (==) shortcut.
	 */
	#define eq ==

	/**
	 * Equal (==) shortcut.
	 */
	#define is ==
#endif

/**
 * Not equal (!=) shortcut.
 */
#define neq !=

#ifndef nil
	#ifndef NULL
		/**
		 * Null pointer (void *)0.
		 */
		#define NULL (void *)0
	#endif
	
	/**
	 * Shortcut for NULL.
	 */
	#define nil NULL
#endif

/**
 * Releases and nils out any id object.
 */
#define GDRelease(x) do{ \
	if((x)==nil){break;} \
	[(x) release];(x)=nil;}while(0)
