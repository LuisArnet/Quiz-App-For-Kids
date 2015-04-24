//
//  QuizFifteenViewController.m
//  Kids
//
//  Created by SOO on 12/03/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "QuizFifteenViewController.h"

@interface QuizFifteenViewController (){
    NSArray * topproblemArray;
    NSArray * underproblemArray;
    NSArray * firstArray;
    NSArray * secondArray;
    NSArray * thirdArray;
    NSArray * fourArray;
    
    int order;
    AVAudioPlayer *audioPlayer;
    UIAlertView * alert_Correct;
    UIAlertView * alert_Wrong;
    UIAlertView * alert_return;
    UIAlertView * alert_con;
}

@end

@implementation QuizFifteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    order=0;
    topproblemArray=[[NSArray alloc] initWithObjects:@"768*",@"678*",@"897*",@"789*",@"987*",nil];
    underproblemArray=[[NSArray alloc] initWithObjects:@"96",@"59",@"67",@"67",@"76", nil];
    firstArray=[[NSArray alloc] initWithObjects:@"73728",@"40000",@"60098",@"52862",@"75011", nil];
    secondArray=[[NSArray alloc] initWithObjects:@"73729",@"40001",@"60097",@"52861",@"75012", nil];
    thirdArray=[[NSArray alloc] initWithObjects:@"73727",@"40002",@"60096",@"52863",@"75013", nil];
    fourArray=[[NSArray alloc] initWithObjects:@"73730",@"40003",@"60099",@"52864",@"75014", nil];
    self.backBtn.hidden=YES;
    [self display];
}
-(void)display{
    self.lblProblemtop.text=[topproblemArray objectAtIndex:order];
    self.lblProblemunder.text=[underproblemArray objectAtIndex:order];
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

-(void)playCon{
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"didit" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    
    [audioPlayer play];
}

- (IBAction)backActionClicked:(id)sender {
    MainSelectViewController *mainViewCtrl=[[MainSelectViewController alloc] init];
    [self.navigationController pushViewController:mainViewCtrl animated:NO];
}

- (IBAction)checkActionClicked:(UIButton*)sender {
    
    NSString *resultStr=sender.titleLabel.text;
    
    NSString *expression =[[NSString alloc] init];
    expression=@"";
    expression=[expression stringByAppendingString:[topproblemArray objectAtIndex:order]];
    expression=[expression stringByAppendingString:[underproblemArray objectAtIndex:order]];
    NSLog(@"%@",expression);
    NSExpression *expressionResult = [NSExpression expressionWithFormat:expression argumentArray:nil];
    NSNumber *result = [expressionResult expressionValueWithObject:nil context:nil];
    
    if ([resultStr isEqualToString:[NSString stringWithFormat:@"%@",result]]) {
        
        [self playCon];
        alert_con=[[UIAlertView alloc] initWithTitle:@"Conguratulations!" message:@"You did it!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alert_con.tag=4;
        [alert_con show];
        
        
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
            
            
        }
    }
    if (alertView.tag==3) {
        if (buttonIndex == 0) {
            // do something here...
            [self display];
        }
    }
    if (alertView.tag==4) {
        if (buttonIndex == 0) {
            // do something here...
            MainSelectViewController *mainViewCtrl=[[MainSelectViewController alloc] init];
            [self.navigationController pushViewController:mainViewCtrl animated:NO];
            
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
