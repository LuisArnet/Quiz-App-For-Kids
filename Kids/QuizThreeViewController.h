//
//  QuizThreeViewController.h
//  Kids
//
//  Created by SOO on 12/03/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstants.h"

@interface QuizThreeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *liveoneImg;
@property (weak, nonatomic) IBOutlet UIImageView *livetwoImg;
@property (weak, nonatomic) IBOutlet UIImageView *livethreeImg;


- (IBAction)checkActionClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblProblem;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;

@property (weak, nonatomic) IBOutlet UILabel *lblWrong;

@end
