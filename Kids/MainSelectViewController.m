//
//  MainSelectViewController.m
//  Kids
//
//  Created by SOO on 24/02/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "MainSelectViewController.h"

@interface MainSelectViewController ()

@end

@implementation MainSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    // Make White Border Color of buttons ------------------//
    
    self.learnBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.learnBtn.layer.borderWidth=3;
    self.learnBtn.layer.cornerRadius=9;
    self.learnBtn.layer.masksToBounds=YES;
    self.learnBtn.transform = CGAffineTransformMakeTranslation(0,-10);
    self.learnBtn.alpha=0.0f;
    
    // Make White Border Color of buttons ------------------//
    
    self.quizBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.quizBtn.layer.borderWidth=3;
    self.quizBtn.layer.cornerRadius=9;
    self.quizBtn.layer.masksToBounds=YES;
    self.quizBtn.transform = CGAffineTransformMakeTranslation(0,-10);
    self.quizBtn.alpha=0.0f;
   
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    // ------ make Animation Buttons ------------//
    // ----- First time ViewDidLoad (Alpha:0) , Here Alpha 1.0
    
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.learnBtn.alpha = 1.0;
        self.learnBtn.transform = CGAffineTransformIdentity;
    } completion:nil];
    
    [UIView animateWithDuration:1 delay:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.quizBtn.alpha = 1.0;
        self.quizBtn.transform = CGAffineTransformIdentity;
    } completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)learnActionClicked:(id)sender {
    //If User Click LearnButton , then Move to Learn Screen
    
    LearnSelectViewController *learnViewCtrl=[[LearnSelectViewController alloc] init];
    [self.navigationController pushViewController:learnViewCtrl animated:YES];
}

- (IBAction)quizActionClicked:(id)sender {
    //If User click Quiz button ,Move to Quiz Screen
    
    QuizOneViewController * quizViewCtrl=[[QuizOneViewController alloc] init];
    [self.navigationController pushViewController:quizViewCtrl animated:YES];
}
@end
