//
//  QuizThirteenViewController.m
//  Kids
//
//  Created by SOO on 12/03/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "QuizThirteenViewController.h"

@interface QuizThirteenViewController (){
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
}

@end

@implementation QuizThirteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    order=0;
    topproblemArray=[[NSArray alloc] initWithObjects:@"852+",@"476+",@"524+",@"666+",@"456+",nil];
    underproblemArray=[[NSArray alloc] initWithObjects:@"68",@"66",@"97",@"44",@"78", nil];
    firstArray=[[NSArray alloc] initWithObjects:@"920",@"540",@"621",@"720",@"534", nil];
    secondArray=[[NSArray alloc] initWithObjects:@"921",@"541",@"622",@"721",@"535", nil];
    thirdArray=[[NSArray alloc] initWithObjects:@"922",@"542",@"623",@"722",@"536", nil];
    fourArray=[[NSArray alloc] initWithObjects:@"923",@"543",@"624",@"723",@"537", nil];
    
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
            QuizFourteenViewController *quizViewCtrl=[[QuizFourteenViewController alloc] init];
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
