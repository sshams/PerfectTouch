//
//  PerfectTouchMediator.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
//  All rights reserved.
//

#import "PerfectTouchMediator.h"
#import "PerfectTouch.h"
#import "ApplicationFacade.h"


@implementation PerfectTouchMediator

+ (NSString *)NAME {
    return @"PerfectTouchMediator";
}

- (PerfectTouch *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [PerfectTouchMediator NAME];
}

- (NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:ShowTouch, Win, Lose, Restart, nil];
}

- (void)handleNotification:(id<INotification>)notification {
    if ([[notification name] isEqualToString:ShowTouch]) {
        [viewComponent removeIntro];
        [viewComponent addTouch];
        [viewComponent addClock];
        [viewComponent addCounter];
    } else if([[notification name] isEqualToString:Win]){
        [viewComponent removeTouch];
        [viewComponent removeClock];
        [viewComponent removeCounter];
        [viewComponent addWin];
    } else if([[notification name] isEqualToString:Lose]){
        [viewComponent removeTouch];
        [viewComponent removeClock];
        [viewComponent removeCounter];
        [viewComponent addLose];
    } else if([[notification name] isEqualToString:Restart]){
        [viewComponent removeWin];
        [viewComponent removeLose];
        [viewComponent addIntro];
    }
}

@end
