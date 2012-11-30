//
//  ApplicationFacade.h
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Facade.h"

#define Startup @"startup"
#define ShowTouch @"showTouch"
#define Increment @"increment"
#define StartTimer @"startTimer"
#define TimeOver @"timeOver"
#define Win @"win"
#define Lose @"lose"
#define Restart @"restart"


@interface ApplicationFacade : Facade {
    
}

+ (ApplicationFacade *)getInstance;
- (void)startup:(id)app;

@end
