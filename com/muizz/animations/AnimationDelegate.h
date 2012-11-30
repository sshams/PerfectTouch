//
//  AnimationDelegate.h
//  Muizz
//
//  Created by Saad Shams on 4/2/11.
//  Copyright 2011 muizz.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol AnimationDelegate <NSObject>

@required
- (void)animateIn;
- (void)animateInDidComplete;
- (void)animateOut;
- (void)animateOutDidComplete;
- (void)reset;
@optional
- (void)transitionIn;
- (void)transitionInDidComplete;
- (void)transitionOut;
- (void)transitionOutDidComplete;

@end
