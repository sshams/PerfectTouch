//
//  PerfectTouch.h
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Intro.h"
#import "Touch.h"
#import "Counter.h"
#import "Win.h"
#import "Lose.h"
#import "Clock.h"


@interface PerfectTouch : UIViewController {
    Intro *intro;
    Touch *touch;
    Counter *counter;
    Clock *clock;
    Win *win;
    Lose *lose;
}

@property (nonatomic, retain) Intro *intro;
@property (nonatomic, retain) Touch *touch;
@property (nonatomic, retain) Counter * counter;
@property (nonatomic, retain) Clock *clock;
@property (nonatomic, retain) Win *win;
@property (nonatomic, retain) Lose *lose;

- (void)addIntro;
- (void)removeIntro;
- (void)addTouch;
- (void)removeTouch;
- (void)addCounter;
- (void)removeCounter;
- (void)addClock;
- (void)removeClock;
- (void)addWin;
- (void)removeWin;
- (void)addLose;
- (void)removeLose;

@end
