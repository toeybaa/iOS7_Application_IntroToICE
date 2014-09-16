//
//  shootViewController.m
//  FUNASSYI
//
//  Created by Peth on 15/09/2014.
//  Copyright (c) 2014 Peth. All rights reserved.
//

#import "shootViewController.h"

@interface shootViewController (){
    int score;
    int seconds;
    NSTimer *timer;

}

@end

@implementation shootViewController
@synthesize hitLabel;
@synthesize nonCritLabel;
@synthesize scoreplus;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //Change image เมื่อกระสุนชน
    if(scoreplus.hidden == YES)
    {
        scoreplus.hidden = NO;
    }
    else
    {
        scoreplus.hidden = YES;
    }
    if(nonCritLabel.hidden == YES)
    {
        nonCritLabel.hidden = NO;
    }
    else
    {
       nonCritLabel.hidden = YES;
    }
    if(hitLabel.hidden == YES)
    {
        hitLabel.hidden = NO;
    }
    else
    {
        hitLabel.hidden = YES;
    }
	// Do any additional setup after loading the view, typically from a nib.
    
    self.timeLabel.text = @"N/A";
    self.scoreLabel.text = @"N/A";
    
}
- (IBAction)startBpressed:(id)sender {
    [self setupGame];
}


-(void)setupGame {
    
    //Initialize
    seconds = 30;
    score = 0;
    
    //Set Label
    _timeLabel.text = [NSString stringWithFormat:@"%i", seconds];
    _scoreLabel.text = [NSString stringWithFormat:@"%i", score];
    
    //Set Timer
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(elapsedTime) userInfo:nil repeats:YES];
}

-(void)elapsedTime {
    
    seconds--;
    _timeLabel.text = [NSString stringWithFormat:@"%i", seconds];
    
    //Time runs out
    if (seconds == 0) {
        [timer invalidate];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over!" message:[NSString stringWithFormat:@"Your Final Score is %i !", score] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
        
        
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    // Step 1 - Create a new peaball image
    UIImage *peaImage = [UIImage imageNamed:@"star"];
    UIImageView *pea = [[UIImageView alloc] initWithImage:peaImage];
    [pea setFrame:CGRectMake(12, 210, 35, 35)];
    
    
    [self.view addSubview:pea];
    
    // Step 2 - Use the in-built animation methods by Apple to animate our pea
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationCurveEaseIn animations:^{
        
        [pea setFrame:CGRectMake(149, 47, 35, 35)];
        
    } completion:^(BOOL finished) {
        
        // Step 3 - Change the pea image when the animation completes
        [pea setFrame:CGRectMake(134, 40, 66, 50)];
        [pea setImage:[UIImage imageNamed:@"starcrash"]];
        
        
        
        // To Do : Increment the score
        if(nonCritLabel.hidden == YES)
        {
            nonCritLabel.hidden = NO;
            scoreplus.hidden =NO;
        }
        else
        {
            nonCritLabel.hidden = YES;
            scoreplus.hidden = NO;
        }
        if(nonCritLabel.hidden == YES)
        {
            hitLabel.hidden = NO;
            scoreplus.hidden=NO;
        }
        else
        {
            hitLabel.hidden = YES;
            scoreplus.hidden=NO;
        }
       
        //บวกคะแนน
        score++;
        _scoreLabel.text = [NSString stringWithFormat:@"%i", score];
        
        
    }];
    
}
@end
