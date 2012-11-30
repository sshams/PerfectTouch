//
//  TouchMediator.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
// All rights reserved.
//

#import "TouchMediator.h"
#import "ApplicationFacade.h"


@implementation TouchMediator

+ (NSString *)NAME {
    return @"TouchMediator";
}

- (Touch *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [TouchMediator NAME];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:Win, Lose, TimeOver, Restart, nil];
}

- (void)handleNotification:(id<INotification>)notification {
    if([[notification name] isEqualToString:Win] || [[notification name] isEqualToString:Lose]){
        [viewComponent stopTimer];
    } else if([[notification name] isEqualToString:TimeOver]){
        [viewComponent resetArrows];
    } else if([[notification name] isEqualToString:Restart]){
        [viewComponent reset];
    }
}

- (void)increment {
    [facade sendNotification:Increment];
}

- (void)startTimer {
    [facade sendNotification:StartTimer];
}

@end
