//
//  ClockMediator.m
//  PerfectTouch
//
//  Created by Saad Shams on 5/3/11.
//  All rights reserved.
//

#import "ClockMediator.h"
#import "Clock.h"
#import "ApplicationFacade.h"


@implementation ClockMediator

+ (NSString *)NAME {
    return @"ClockMediator";
}

- (Clock *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [ClockMediator NAME];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:StartTimer, Restart, nil];
}

- (void)handleNotification:(id<INotification>)notification {
    if([[notification name] isEqualToString:StartTimer]){
        [viewComponent start1];
    } else if([[notification name] isEqualToString:Restart]){
        [viewComponent reset];
    }
}

- (void)timeOver {
    [facade sendNotification:TimeOver];
}

@end
