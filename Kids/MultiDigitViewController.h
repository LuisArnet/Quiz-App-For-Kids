//
//  MultiDigitViewController.h
//  Kids
//
//  Created by SOO on 04/03/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstants.h"

@interface MultiDigitViewController : UIViewController
- (IBAction)backActionClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *topOneImage;
@property (weak, nonatomic) IBOutlet UIImageView *topTwoImage;
@property (weak, nonatomic) IBOutlet UIImageView *topThreeImage;
@property (weak, nonatomic) IBOutlet UIImageView *topFourImage;
@property (weak, nonatomic) IBOutlet UIImageView *topFiveImage;

@property (weak, nonatomic) IBOutlet UIImageView *underOneImage;
@property (weak, nonatomic) IBOutlet UIImageView *underTwoImage;
@property (weak, nonatomic) IBOutlet UIImageView *underThreeImage;
@property (weak, nonatomic) IBOutlet UIImageView *underFourImage;
@property (weak, nonatomic) IBOutlet UIImageView *underFiveImage;

@property (weak, nonatomic) IBOutlet UIImageView *operatorImage;

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

@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end
