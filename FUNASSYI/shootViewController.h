//
//  shootViewController.h
//  FUNASSYI
//
//  Created by Peth on 15/09/2014.
//  Copyright (c) 2014 Peth. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface shootViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreplus;

@property (weak, nonatomic) IBOutlet UIButton *startB;
@property (weak, nonatomic) IBOutlet UILabel *hitLabel;
@property (weak, nonatomic) IBOutlet UILabel *nonCritLabel;

- (IBAction)buttonPressed:(id)sender;

@end
