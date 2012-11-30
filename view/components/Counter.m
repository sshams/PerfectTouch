//
//  Counter.m
//  PerfectTouch
//
//  Created by Saad Shams on 4/29/11.
//  All rights reserved.
//

#import "Counter.h"
#import "Animations.h"


@implementation Counter

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self reset];
    }
    return self;
}

#pragma mark - AnimationDelegate Methods

- (void)transitionIn {
}

- (void)transitionInDidComplete {
}

- (void)animateIn {
    [Animations animateViewFrom:counterLabel x:0 y:20 width:0 height:0 relative:YES alpha:0 duration:.5 delay:0 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
}

- (void)animateInDidComplete {
    
}

- (void)animateOut {
    
}

- (void)animateOutDidComplete {
    
}

- (void)transitionOut {
    [Animations animateViewTo:self.view x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:1 options:UIViewAnimationCurveEaseOut delegate:self selector:@selector(transitionOutDidComplete)];
}

- (void)transitionOutDidComplete {
    [delegate next:success];
}

- (void)reset {
    counter = 0;
    [counterLabel setText:@"000"];
    [self.view setAlpha:1];
}

#pragma mark - Additional

- (void)increment {
    counter++;
    [counterLabel setText:[self format]];
}

- (void)getResult {
    if(counter >= 25){
        success = YES;
    } else {
        success = NO;
    }
    [self transitionOut];
}

- (NSString *)format {
    if (counter < 10) {
        return [NSString stringWithFormat:@"00%d", counter];
    } else if(counter < 100){
        return [NSString stringWithFormat:@"0%d", counter];
    } else {
        return [NSString stringWithFormat:@"%d", counter];
    }
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
    counterLabel.font = [UIFont fontWithName:@"Eurostile-ExtendedTwo" size:36];
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
	return YES;
}

@end
