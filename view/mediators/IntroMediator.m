//
//  IntroMediator.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
// All rights reserved.
//

#import "IntroMediator.h"
#import "Intro.h"
#import "ApplicationFacade.h"


@implementation IntroMediator

+ (NSString *)NAME {
    return @"IntroMediator";
}

- (Intro *)viewComponent {
    return viewComponent;
}

- (void)initializeMediator {
    self.mediatorName = [IntroMediator NAME];
}

- (void)onRegister {
    [viewComponent setDelegate:self];
}

- (void)next {
    [facade sendNotification:ShowTouch];
}

@end
