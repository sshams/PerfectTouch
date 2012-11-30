//
//  Animations.m
//  Muizz
//
//  Created by Saad Shams on 4/2/11.
//  Copyright 2011 muizz.com. All rights reserved.
//

#import "Animations.h"


@implementation Animations

#pragma mark - Animate views with frames and alpha

+ (void)animateViewTo:(UIView *)view frame:(CGRect)frame alpha:(CGFloat)alpha duration:(NSTimeInterval)duration 
                delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector {
    
    [UIView animateWithDuration:duration delay:delay options:options 
                     animations:^{
                        view.frame = frame;
                        view.alpha = alpha;
                     }
                     completion:^(BOOL finished) {
                         if(delegate){
                             NSTimer *timer = [[NSTimer scheduledTimerWithTimeInterval:0 target:delegate selector:selector userInfo:nil repeats:NO] retain];
                             [timer release];
                         }
                     }
     ];  
}

+ (void)animateViewFrom:(UIView *)view frame:(CGRect)frame alpha:(CGFloat)alpha duration:(NSTimeInterval)duration
                delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector {
    
    CGRect frameOriginal = view.frame;
    CGFloat alphaOriginal = view.alpha;
    
    view.frame = frame;
    view.alpha = alpha;
    
    [UIView animateWithDuration:duration delay:delay options:options 
                     animations:^{
                         view.frame = frameOriginal;
                         view.alpha = alphaOriginal;
                     }
                     completion:^(BOOL finished) {
                         if(delegate){
                             NSTimer *timer = [[NSTimer scheduledTimerWithTimeInterval:0 target:delegate selector:selector userInfo:nil repeats:NO] retain];
                             [timer release];
                         }
                     }
     ];
}

+ (void)animateViewsTo:(NSArray *)objects frames:(CGRect *)frames alpha:(CGFloat)alpha duration:(NSTimeInterval)duration 
                 delay:(NSTimeInterval)delay stagger:(NSTimeInterval)stagger options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector {
    
    int count = [objects count];
    
    for (int i=0; i<count; i++) {
        UIView *view = [objects objectAtIndex:i];
        [Animations animateViewTo:view frame:frames[i] alpha:alpha duration:duration delay:delay + (i * stagger) options:options  delegate:(i == count-1) ? delegate : nil selector:selector];
    }
}

+ (void)animateViewsFrom:(NSArray *)objects frames:(CGRect *)frames alpha:(CGFloat)alpha duration:(NSTimeInterval)duration  
                   delay:(NSTimeInterval)delay stagger:(NSTimeInterval)stagger options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector {
    
    int count = [objects count];
    
    for (int i=0; i<count; i++) {
        UIView *view = [objects objectAtIndex:i];
        [Animations animateViewFrom:view frame:frames[i] alpha:alpha duration:duration delay:delay + (i * stagger) options:options delegate:(i == count-1) ? delegate : nil selector:selector];
    }
}

#pragma mark - Animate views with coordinates, dimensions and alpha

+ (void)animateViewTo:(UIView *)view x:(int)x y:(int)y width:(int)width height:(int)height relative:(BOOL)relative alpha:(CGFloat)alpha 
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector {
    
    CGRect frame;
    
    if(relative){
        frame = CGRectMake(view.frame.origin.x + x, view.frame.origin.y + y, view.frame.size.width + width, view.frame.size.height + height);
    } else {
        frame = CGRectMake(x, y, width, height);
    }
    
    [UIView animateWithDuration:duration delay:delay options:options 
                     animations:^{
                         view.frame = frame;
                         view.alpha = alpha;
                     }
                     completion:^(BOOL finished) {
                         if(delegate){
                             NSTimer *timer = [[NSTimer scheduledTimerWithTimeInterval:0 target:delegate selector:selector userInfo:nil repeats:NO] retain];
                             [timer release];
                         }
                     }
     ];  
}

+ (void)animateViewFrom:(UIView *)view x:(int)x y:(int)y width:(int)width height:(int)height relative:(BOOL)relative alpha:(CGFloat)alpha 
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector {
    
    CGRect frameOriginal = view.frame;
    CGFloat alphaOriginal = view.alpha;
    
    CGRect frame;
    
    if(relative){
        frame = CGRectMake(view.frame.origin.x + x, view.frame.origin.y + y, view.frame.size.width + width, view.frame.size.height + height);
    } else {
        frame = CGRectMake(x, y, width, height);
    }
    
    view.frame = frame;
    view.alpha = alpha;
    
    [UIView animateWithDuration:duration delay:delay options:options 
                     animations:^{
                         view.frame = frameOriginal;
                         view.alpha = alphaOriginal;
                     }
                     completion:^(BOOL finished) {
                         if(delegate){
                             NSTimer *timer = [[NSTimer scheduledTimerWithTimeInterval:0 target:delegate selector:selector userInfo:nil repeats:NO] retain];
                             [timer release];
                         }
                     }
     ];
}

+ (void)animateViewsTo:(NSArray *)objects  x:(int)x y:(int)y width:(int)width height:(int)height relative:(BOOL)relative alpha:(CGFloat)alpha    
                duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay stagger:(NSTimeInterval)stagger options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector {
    
    UIView *view;
    int count = [objects count];
    
    for(int i=0; i<count; i++){
        view = ((UIView *)[objects objectAtIndex:i]);
        [Animations animateViewTo:view x:x y:y width:width height:height relative:relative alpha:alpha duration:duration delay:delay + (i * stagger) options:options delegate:(i == count-1) ? delegate : nil selector:selector];
    }
}

+ (void)animateViewsFrom:(NSArray *)objects  x:(int)x y:(int)y width:(int)width height:(int)height relative:(BOOL)relative alpha:(CGFloat)alpha
        duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay stagger:(NSTimeInterval)stagger options:(UIViewAnimationOptions)options delegate:(id)delegate selector:(SEL)selector {
    
    UIView *view;
    int count = [objects count];
    
    for(int i=0; i<count; i++){
        view = ((UIView *)[objects objectAtIndex:i]);
        [Animations animateViewFrom:view x:x y:y width:width height:height relative:relative alpha:alpha duration:duration delay:delay + (i * stagger) options:options  delegate:(i == count-1) ? delegate : nil selector:selector];
    }
}

@end
