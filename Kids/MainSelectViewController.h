//
//  MainSelectViewController.h
//  Kids
//
//  Created by SOO on 24/02/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstants.h"

@interface MainSelectViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *learnBtn;
@property (weak, nonatomic) IBOutlet UIButton *quizBtn;
- (IBAction)learnActionClicked:(id)sender;
- (IBAction)quizActionClicked:(id)sender;

@end
