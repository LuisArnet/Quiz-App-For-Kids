//
//  QuizSevenViewController.m
//  Kids
//
//  Created by SOO on 12/03/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "QuizSevenViewController.h"

@interface QuizSevenViewController (){
    NSArray * problemArray;
    NSArray * firstArray;
    NSArray * secondArray;
    NSArray * thirdArray;
    NSArray * fourArray;
    
    int order;
    AVAudioPlayer *audioPlayer;
    UIAlertView * alert_Correct;
    UIAlertView * alert_Wrong;
    UIAlertView * alert_return;
}

@end

@implementation QuizSevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    order=0;
    problemArray=[[NSArray alloc] initWithObjects:@"2*2+3*3",@"4*2+5*2",@"3*4+2*2",@"2*3+3*2",@"6*2+3*2",nil];
    firstArray=[[NSArray alloc] initWithObjects:@"11",@"16",@"14",@"11",@"17", nil];
    secondArray=[[NSArray alloc] initWithObjects:@"12",@"17",@"15",@"12",@"18", nil];
    thirdArray=[[NSArray alloc] initWithObjects:@"13",@"18",@"16",@"13",@"19", nil];
    fourArray=[[NSArray alloc] initWithObjects:@"14",@"19",@"17",@"14",@"20", nil];
    
    [self display];
}

-(void)display{
    self.lblProblem.text=[problemArray objectAtIndex:order];
    [self.firstBtn setTitle:[firstArray objectAtIndex:order] forState:UIControlStateNormal];
    [self.secondBtn setTitle:[secondArray objectAtIndex:order] forState:UIControlStateNormal];
    [self.thirdBtn setTitle:[thirdArray objectAtIndex:order] forState:UIControlStateNormal];
    [self.fourBtn setTitle:[fourArray objectAtIndex:order] forState:UIControlStateNormal];
    self.lblWrong.text=@"";
}

-(void)playWrong{
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"wrong" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    
    [audioPlayer play];
}

-(void)playCorrect{
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"correct" ofType:@"wav"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    
    [audioPlayer play];
}

- (IBAction)checkActionClicked:(UIButton*)sender {
    
    NSString *resultStr=sender.titleLabel.text;
    
    NSExpression *expressionResult = [NSExpression expressionWithFormat:self.lblProblem.text argumentArray:nil];
    NSNumber *result = [expressionResult expressionValueWithObject:nil context:nil];
    
    if ([resultStr isEqualToString:[NSString stringWithFormat:@"%@",result]]) {
        
        alert_Correct =[[UIAlertView alloc] initWithTitle:@"" message:@"Correct" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alert_Correct.tag=2;
        [self playCorrect];
        [alert_Correct show];
        
        
    }else{
        
        
        order=order+1;
        if (order==1) {
            self.liveoneImg.hidden=YES;
            
            alert_Wrong=[[UIAlertView alloc] initWithTitle:@"" message:@"Try again" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert_Wrong.tag=3;
            [alert_Wrong show];
        }
        if (order==2) {
            self.livetwoImg.hidden=YES;
            
            alert_Wrong=[[UIAlertView alloc] initWithTitle:@"" message:@"Try again" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert_Wrong.tag=3;
            [alert_Wrong show];
        }
        if (order==3) {
            self.livethreeImg.hidden=YES;
            
            alert_return = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                      message:@"You need to start again"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
            alert_return.tag=1;
            [alert_return show];
        }
        
        
        [self playWrong];
        
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (alertView.tag==1) {
        if (buttonIndex == 0) {
            // do something here...
            MainSelectViewController *mainViewCtrl=[[MainSelectViewController alloc] init];
            [self.navigationController pushViewController:mainViewCtrl animated:NO];
        }
    }
    if (alertView.tag==2) {
        if (buttonIndex == 0) {
            // do something here...
            QuizEightViewController *quizViewCtrl=[[QuizEightViewController alloc] init];
            [self.navigationController pushViewController:quizViewCtrl animated:YES];
        }
    }
    if (alertView.tag==3) {
        if (buttonIndex == 0) {
            // do something here...
            [self display];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
