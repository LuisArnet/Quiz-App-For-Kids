//
//  MainScreenViewController.h
//  Kids
//
//  Created by SOO on 24/02/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstants.h"

@interface MainScreenViewController : UIViewController<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *inputImage;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageDonkey;
@property (weak, nonatomic) IBOutlet UIImageView *imagePooh;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)nameTextFieldBegin:(id)sender;
- (IBAction)nameTextFieldEnd:(id)sender;
- (IBAction)okActionClicked:(id)sender;

@end
