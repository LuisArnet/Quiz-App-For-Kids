//
//  QuizOneViewController.m
//  Kids
//
//  Created by SOO on 10/03/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "QuizOneViewController.h"

@interface QuizOneViewController (){
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

@implementation QuizOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    order=0;
    problemArray=[[NSArray alloc] initWithObjects:@"3+6",@"4+2",@"4+5",@"2+6",@"7+1",nil];
    firstArray=[[NSArray alloc] initWithObjects:@"7",@"3",@"9",@"5",@"7", nil];
    secondArray=[[NSArray alloc] initWithObjects:@"8",@"4",@"10",@"6",@"8", nil];
    thirdArray=[[NSArray alloc] initWithObjects:@"9",@"5",@"11",@"7",@"9", nil];
    fourArray=[[NSArray alloc] initWithObjects:@"10",@"6",@"12",@"8",@"10", nil];

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            QuizTwoViewController *quizViewCtrl=[[QuizTwoViewController alloc] init];
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

@end
