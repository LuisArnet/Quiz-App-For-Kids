//
//  SingleDigitViewController.h
//  Kids
//
//  Created by SOO on 24/02/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstants.h"

@interface SingleDigitViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *poohImage;
- (IBAction)backActionClicked:(id)sender;

//------- Number -----------------//

@property (weak, nonatomic) IBOutlet UIImageView *zeroImage;
@property (weak, nonatomic) IBOutlet UIImageView *oneImage;
@property (weak, nonatomic) IBOutlet UIImageView *twoImage;
@property (weak, nonatomic) IBOutlet UIImageView *threeImage;
@property (weak, nonatomic) IBOutlet UIImageView *fourImage;
@property (weak, nonatomic) IBOutlet UIImageView *fiveImage;
@property (weak, nonatomic) IBOutlet UIImageView *sixImage;
@property (weak, nonatomic) IBOutlet UIImageView *sevenImage;
@property (weak, nonatomic) IBOutlet UIImageView *eightImage;
@property (weak, nonatomic) IBOutlet UIImageView *nineImage;
@property (weak, nonatomic) IBOutlet UIImageView *plusImage;
@property (weak, nonatomic) IBOutlet UIImageView *minusImage;
@property (weak, nonatomic) IBOutlet UIImageView *multiImage;
@property (weak, nonatomic) IBOutlet UIImageView *divideImage;


//-------- Display Digits and Operators --------//

@property (weak, nonatomic) IBOutlet UIImageView *displayOneImage;
@property (weak, nonatomic) IBOutlet UIImageView *displayTwoImage;
@property (weak, nonatomic) IBOutlet UIImageView *displayThreeImage;
@property (weak, nonatomic) IBOutlet UIImageView *displayFourImage;
@property (weak, nonatomic) IBOutlet UIImageView *displayFiveImage;
@property (weak, nonatomic) IBOutlet UIImageView *displaySixImage;
@property (weak, nonatomic) IBOutlet UIImageView *displaySevenImage;
@property (weak, nonatomic) IBOutlet UIImageView *displayEightImage;
@property (weak, nonatomic) IBOutlet UIImageView *displayNineImage;
@property (weak, nonatomic) IBOutlet UIImageView *displayTenImage;
@property (weak, nonatomic) IBOutlet UIImageView *displayElevenImage;

//--------- Display ---------------------//

@property (weak, nonatomic) IBOutlet UILabel *lblDisplayResult;

@end
