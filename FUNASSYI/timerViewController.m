//
//  timerViewController.m
//  FUNASSYI
//
//  Created by Peth on 15/09/2014.
//  Copyright (c) 2014 Peth. All rights reserved.
//

#import "timerViewController.h"

@interface timerViewController ()

@end

@implementation timerViewController{
    bool start;
    NSTimeInterval time;
}

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
    self.display.text = @"mm:ss:ms";
    start = false;
	// Do any additional setup after loading the view, typically from a nib.
}
- (void) update{
    if(start == false){
        return;
    }
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elaspedTime = currentTime-time;
    int minutes =(int)(elaspedTime/60.0);
    elaspedTime-=minutes*60;
    int second = (int)(elaspedTime);
    elaspedTime-=second;
    int flac = (int)(elaspedTime*10.0);
    self.display.text = [NSString stringWithFormat:@"%02u:%02u:%u",minutes,second,flac];
    [self performSelector:@selector(update) withObject:self afterDelay:0.1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Press:(id)sender {
    if(start == false){
        start = true;
        time = [NSDate timeIntervalSinceReferenceDate];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        [self update];
    }else{
        start = false;
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    }
}

@end
