//
//  LearnSelectViewController.m
//  Kids
//
//  Created by SOO on 24/02/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "LearnSelectViewController.h"

@interface LearnSelectViewController ()

@end

@implementation LearnSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //------ Same methods like previous screens
    
    self.learnTitle.transform = CGAffineTransformMakeTranslation(-30,0);
    self.learnTitle.alpha=0.0f;
    
    self.singleBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.singleBtn.layer.borderWidth=3;
    self.singleBtn.layer.cornerRadius=9;
    self.singleBtn.layer.masksToBounds=YES;
    self.singleBtn.transform = CGAffineTransformMakeTranslation(0,-10);
    self.singleBtn.alpha=0.0f;
    
    
    //------ Same methods like previous screens
    self.multiBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.multiBtn.layer.borderWidth=3;
    self.multiBtn.layer.cornerRadius=9;
    self.multiBtn.layer.masksToBounds=YES;
    self.multiBtn.transform = CGAffineTransformMakeTranslation(0,-10);
    self.multiBtn.alpha=0.0f;
}

-(void)viewWillAppear:(BOOL)animated{
    
    //------ Same methods like previous screens
    
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.learnTitle.alpha = 1.0;
        self.learnTitle.transform = CGAffineTransformIdentity;
    } completion:nil];
    [UIView animateWithDuration:1 delay:1.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.singleBtn.alpha = 1.0;
        self.singleBtn.transform = CGAffineTransformIdentity;
    } completion:nil];
    
    [UIView animateWithDuration:1 delay:1.8 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.multiBtn.alpha = 1.0;
        self.multiBtn.transform = CGAffineTransformIdentity;
    } completion:nil];
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)multiActionClicked:(id)sender {
    MultiDigitViewController *multiViewCtrl=[[MultiDigitViewController alloc] init];
    [self.navigationController pushViewController:multiViewCtrl animated:YES];
}

- (IBAction)singleActionClicked:(id)sender {
    SingleDigitViewController *singleViewCtrl=[[SingleDigitViewController alloc] init];
    [self.navigationController pushViewController:singleViewCtrl animated:YES];
}

- (IBAction)backActionClicked:(id)sender {
    MainSelectViewController *mainViewCtrl=[[MainSelectViewController alloc] init];
    [self.navigationController pushViewController:mainViewCtrl animated:NO];
}
@end
