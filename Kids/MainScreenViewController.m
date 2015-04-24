//
//  MainScreenViewController.m
//  Kids
//
//  Created by SOO on 24/02/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "MainScreenViewController.h"

@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Make Input Box Image Border Color //
    
    self.inputImage.layer.borderWidth=1;
    self.inputImage.layer.borderColor=[UIColor colorWithRed:88.f/255 green:169.f/255 blue:51.f/255 alpha:1.0f].CGColor;
    
    self.inputImage.layer.cornerRadius=9;
    self.inputImage.layer.masksToBounds=YES;
    
    self.okBtn.layer.cornerRadius=5;
    self.okBtn.layer.masksToBounds=YES;
    
    //-----Hidden Image and show  them after some seconds--------//
    
    //---------- Pooh Image -----------------------//
    self.imagePooh.alpha=0.0f;
    self.imageDonkey.transform = CGAffineTransformMakeTranslation(-15, 0);
    
    //----------Donkey Image ----------------------//
    self.imageDonkey.transform = CGAffineTransformMakeTranslation(0, -95);
    self.imageDonkey.alpha=0.0f;
    
    self.nameTextField.transform = CGAffineTransformMakeTranslation(0, -95);
    self.nameTextField.alpha=0.0f;
    
    self.inputImage.transform = CGAffineTransformMakeTranslation(0, -95);
    self.inputImage.alpha=0.0f;
    
    self.okBtn.transform = CGAffineTransformMakeTranslation(0, -95);
    self.okBtn.alpha=0.0f;
    
    //---------- Tap Gesture ---------------------//
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesClicked)];
    [self.view addGestureRecognizer:tapGes];
    
}

- (void)tapGesClicked {
    
    // ------ Dismiss keyboard after inputing
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.view.transform = CGAffineTransformIdentity;
    } completion:nil];
    [self.view endEditing:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    // At first time ,make moving donkey by giving delay time
    
    [UIView animateWithDuration:1.5 delay:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.imagePooh.alpha = 1.0;
        self.imagePooh.transform = CGAffineTransformIdentity;
    } completion:nil];
    
    [UIView animateWithDuration:3.5 delay:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.imageDonkey.alpha = 1.0;
        self.imageDonkey.transform = CGAffineTransformIdentity;
        
        self.nameTextField.alpha = 1.0;
        self.nameTextField.transform = CGAffineTransformIdentity;
        
        self.okBtn.alpha = 1.0;
        self.okBtn.transform = CGAffineTransformIdentity;
        
        self.inputImage.alpha = 1.0;
        self.inputImage.transform = CGAffineTransformIdentity;

    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Sometime , we can not see inputbox because of keyboard

// So To see inputbox , Move UI to up.
- (IBAction)nameTextFieldBegin:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, -150);
    }];

}

- (IBAction)nameTextFieldEnd:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
}

- (IBAction)okActionClicked:(id)sender {
    
    // If name is not empty string , then move to next MainSelectViewController
    
    if ([self.nameTextField.text isEqualToString:@""]) {
        
    }else{
        
        MainSelectViewController *mainViewCtrl=[[MainSelectViewController alloc] init];
        [self.navigationController pushViewController:mainViewCtrl animated:YES];
    }
   
    
}
@end
