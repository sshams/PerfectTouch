//
//  Intro.h
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"
#import "AudioPlayer.h"

@protocol IntroDelegate <NSObject>

- (void)next;

@end

@interface Intro : UIViewController<AnimationDelegate> {
    IBOutletCollection(id) NSArray *objects;
    AudioPlayer *audioPlayer;
    id<IntroDelegate>delegate;
}

@property (nonatomic, retain) IBOutletCollection(id) NSArray *objects;
@property (nonatomic, retain) id<IntroDelegate>delegate;

- (IBAction)next;

@end
