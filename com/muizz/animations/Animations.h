//
//  Animations.h
//  Muizz
//
//  Created by Saad Shams on 4/2/11.
//  Copyright 2011 muizz.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Animations : NSObject {
    
}

+ (void)animateViewTo:(UIView *)view frame:(CGRect)frame alpha:(CGFloat)alpha 
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector;

+ (void)animateViewFrom:(UIView *)view frame:(CGRect)frame alpha:(CGFloat)alpha 
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector;

+ (void)animateViewsTo:(NSArray *)objects frames:(CGRect *)frames alpha:(CGFloat)alpha
                 duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay stagger:(NSTimeInterval)stagger options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector;

+ (void)animateViewsFrom:(NSArray *)objects frames:(CGRect *)frames alpha:(CGFloat)alpha 
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay stagger:(NSTimeInterval)stagger options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector;

+ (void)animateViewTo:(UIView *)view x:(int)x y:(int)y width:(int)width height:(int)height relative:(BOOL)relative alpha:(CGFloat)alpha 
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector;

+ (void)animateViewFrom:(UIView *)view x:(int)x y:(int)y width:(int)width height:(int)height relative:(BOOL)relative alpha:(CGFloat)alpha
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector;

+ (void)animateViewsTo:(NSArray *)objects x:(int)x y:(int)y width:(int)width height:(int)height relative:(BOOL)relative alpha:(CGFloat)alpha
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay stagger:(NSTimeInterval)stagger options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector;

+ (void)animateViewsFrom:(NSArray *)objects x:(int)x y:(int)y width:(int)width height:(int)height relative:(BOOL)relative alpha:(CGFloat)alpha
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay stagger:(NSTimeInterval)stagger options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector;

@end
