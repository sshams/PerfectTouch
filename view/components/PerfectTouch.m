//
//  PerfectTouch.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/28/11.
//  All rights reserved.
//

#import "PerfectTouch.h"


@implementation PerfectTouch

@synthesize intro, touch, counter, clock, lose, win;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        intro = [[Intro alloc] init];
        touch = [[Touch alloc] init];
        counter = [[Counter alloc] init];
        clock = [[Clock alloc] init];
        win = [[Win alloc] init];
        lose = [[Lose alloc] init];
        
        [self addIntro];
        //[self addTouch];
    }
    return self;
}

- (void)addIntro {
    [self.view addSubview:intro.view];
    [intro animateIn];
}

- (void)removeIntro {
    [intro.view removeFromSuperview];
    [intro reset];
}

- (void)addTouch {
    [self.view addSubview:touch.view];
    [touch animateIn];
}

- (void)removeTouch {
    [touch.view removeFromSuperview];
    [touch reset];
}

- (void)addCounter {
    [self.view addSubview:counter.view];
    [counter animateIn];
}

- (void)removeCounter {
    [counter.view removeFromSuperview];
    [counter reset];
}

- (void)addClock {
    [self.view addSubview:clock.view];
    [clock transitionIn];
}

- (void)removeClock {
    [clock.view removeFromSuperview];
    [clock reset];
}

- (void)addWin {
    [self.view addSubview:win.view];
    [win animateIn];
}

- (void)removeWin {
    [win.view removeFromSuperview];
    [win reset];
}

- (void)addLose {
    [self.view addSubview:lose.view];
    [lose animateIn];
}

- (void)removeLose {
    [lose.view removeFromSuperview];
    [lose reset];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
