//
//  ResultMediator.m
//  PerfectTouch
//
//  Created by Saad Shams on 5/3/11.
//  All rights reserved.
//

#import "ResultMediator.h"
#import "ApplicationFacade.h"


@implementation ResultMediator

+ (NSString *)NAME {
    return @"ResultMediator";
}

- (id<ResultDelegate>)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [[ResultMediator NAME] stringByAppendingString:[viewComponent name]];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (void)restart {
    [facade sendNotification:Restart];
}

@end
