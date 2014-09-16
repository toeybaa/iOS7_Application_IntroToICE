//
//  TalkPage.h
//  FUNASSYI
//
//  Created by Peth on 15/09/2014.
//  Copyright (c) 2014 Peth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalkPage : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtField;
- (IBAction)talkButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *show;


@end
