//
//  Clock.h
//  PerfectTouch
//
//  Created by Saad Shams on 5/3/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClockDelegate <NSObject>

- (void)timeOver;

@end


@interface Clock : UIViewController {
    IBOutlet UIImageView *clock;
    NSTimer *timer;
    int counter;
    id<ClockDelegate>delegate;
}

@property (nonatomic, retain)id<ClockDelegate>delegate;

- (void)start1;
- (void)update;
- (void)transitionIn;
- (void)transitionOut;
- (void)reset;

@end
