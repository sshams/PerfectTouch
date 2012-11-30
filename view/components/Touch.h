//
//  Touch.h
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"
#import "AudioPlayer.h"

@protocol TouchDelegate <NSObject>

- (void)increment;
- (void)startTimer;

@end

@interface Touch : UIViewController<AnimationDelegate> {
    IBOutletCollection(UIButton) NSArray *objects;
    IBOutlet UIImageView *background;
    
    NSTimer *showTimer;
    NSTimer *hideTimer;
    
    int toShow;
    int toHide;
    float interval;
    BOOL isTimerStarted;
    
    AudioPlayer *audioPlayer;
    
    BOOL buttonsEnabled;
    int random;
    id<TouchDelegate>delegate;
}

@property (nonatomic, retain) IBOutletCollection(UIButton) NSArray *objects;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) id<TouchDelegate>delegate;

- (void)enableButtons;
- (void)startTimer;
- (void)stopTimer;

- (void)showArrow;
- (void)showArrowDidComplete;
- (void)hideArrow;

- (void)increment;
- (void)resetArrows;

@end
