//
//  LearnSelectViewController.h
//  Kids
//
//  Created by SOO on 24/02/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstants.h"

@interface LearnSelectViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *learnTitle;
@property (weak, nonatomic) IBOutlet UIButton *singleBtn;

@property (weak, nonatomic) IBOutlet UIButton *multiBtn;

- (IBAction)singleActionClicked:(id)sender;
- (IBAction)backActionClicked:(id)sender;

@end
