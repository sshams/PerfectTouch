//
//  Lose.h
//  PerfectTouch
//
//  Created by Saad Shams on 4/30/11.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationDelegate.h"
#import "ResultDelegate.h"
#import "AudioPlayer.h"


@interface Lose : UIViewController<AnimationDelegate, ResultDelegate> {
    IBOutletCollection(id) NSArray *objects;
    NSString *name;
    AudioPlayer *audioPlayer;
    id<ResultDelegate>delegate;
}

@property (nonatomic, retain) IBOutletCollection(id) NSArray *objects;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) id<ResultDelegate>delegate;

@end
