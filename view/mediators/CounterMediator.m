//
//  CounterMediator.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/29/11.
//  All rights reserved.
//

#import "CounterMediator.h"
#import "Counter.h"
#import "ApplicationFacade.h"


@implementation CounterMediator

+ (NSString *)NAME {
    return @"CounterMediator";
}

- (Counter *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [CounterMediator NAME];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (NSArray *)listNotificationInterests {
    return [NSArray arrayWithObjects:Increment, TimeOver, Restart, nil];
}

- (void)handleNotification:(id<INotification>)notification {
    if([[notification name] isEqualToString:Increment]){
        [viewComponent increment];
    } else if([[notification name] isEqualToString:TimeOver]){
        [viewComponent getResult];
    } else if([[notification name] isEqualToString:Restart]){
        [viewComponent reset];
    }
}

- (void)next:(BOOL)result {
    if(result){
        [facade sendNotification:Win];
    } else {
        [facade sendNotification:Lose];
    }
}

@end
