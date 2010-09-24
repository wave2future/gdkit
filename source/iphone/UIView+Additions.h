
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * @file UIView+Additions.h
 *
 * Header file for UIView+Additions.
 */

/**
 * @class UIView
 *
 * Category additions to UIView.
 */

/**
 * Category additions for UIView.
 */
@interface UIView (Additions)

/**
 * Finds the first responder and tells it to resign, typically
 * you can call this method on the app's window.
 */
- (BOOL) findAndResignFirstResonder;

@end
