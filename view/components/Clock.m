//
//  Clock.m
//  PerfectTouch
//
//  Created by Saad Shams on 5/3/11.
//  All rights reserved.
//

#import "Clock.h"
#import "Animations.h"


@implementation Clock

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)transitionIn {
    [Animations animateViewFrom:self.view x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.75 delay:0 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
}

- (void)start1 {
    counter = 1;
    timer = [[NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(update) userInfo:nil repeats:YES] retain];
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)update {
    if(counter <= 178){
        UIImage *image;
        
        if(counter < 10){
            image = [UIImage imageNamed:[NSString stringWithFormat:@"clock000%d.png", counter]];
        } else if(counter < 100){
            image = [UIImage imageNamed:[NSString stringWithFormat:@"clock00%d.png", counter]];
        } else if(counter >= 100){
            image = [UIImage imageNamed:[NSString stringWithFormat:@"clock0%d.png", counter]];
        }
        
        [clock setImage:image];
        counter++;
    } else {
        [self transitionOut];
        [delegate timeOver];
        [timer invalidate];
        [timer release];
        timer = nil;
    }
}

- (void)transitionOut {
    [Animations animateViewTo:self.view x:0 y:0 width:0 height:0 relative:YES alpha:0 duration:.5 delay:1 options:UIViewAnimationCurveEaseOut delegate:nil selector:nil];
}

- (void)reset {
    counter = 1;
    [self.view setAlpha:1];
    [clock setImage:[UIImage imageNamed:@"clock0001.png"]];
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
	return YES;
}

@end
