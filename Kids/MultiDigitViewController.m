//
//  MultiDigitViewController.m
//  Kids
//
//  Created by SOO on 04/03/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "MultiDigitViewController.h"

@interface MultiDigitViewController (){
    UIImageView *tempIV;
    
    int temp_check;
    int trashId;
    NSString *temp;
    
    NSString *operator;
    int operator_check;
    
    NSMutableArray *topMissArray;
    NSMutableArray *topValueArray;
    
    NSMutableArray *underMissArray;
    NSMutableArray *underValueArray;
}

@end

@implementation MultiDigitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.oneImage setUserInteractionEnabled:YES];
    
    tempIV = [[UIImageView alloc] init];
    [tempIV setFrame:CGRectMake(0, 300, 50, 50)];
    [tempIV setTag:500];
    [tempIV setUserInteractionEnabled:NO];
    [self.view addSubview:tempIV];
    
    //-----------------------------------------------//
    
    [self.zeroImage setUserInteractionEnabled:YES];
    [self.oneImage setUserInteractionEnabled:YES];
    [self.twoImage setUserInteractionEnabled:YES];
    [self.threeImage setUserInteractionEnabled:YES];
    [self.fourImage setUserInteractionEnabled:YES];
    [self.fiveImage setUserInteractionEnabled:YES];
    [self.sixImage setUserInteractionEnabled:YES];
    [self.sevenImage setUserInteractionEnabled:YES];
    [self.eightImage setUserInteractionEnabled:YES];
    [self.nineImage setUserInteractionEnabled:YES];
    [self.plusImage setUserInteractionEnabled:YES];
    [self.minusImage setUserInteractionEnabled:YES];
    [self.multiImage setUserInteractionEnabled:YES];
    [self.divideImage setUserInteractionEnabled:YES];
    
    //----------------------------------------------//
    
    [self.topOneImage setUserInteractionEnabled:YES];
    [self.topTwoImage setUserInteractionEnabled:YES];
    [self.topThreeImage setUserInteractionEnabled:YES];
    [self.topFourImage setUserInteractionEnabled:YES];
    [self.topFiveImage setUserInteractionEnabled:YES];
    
    [self.underOneImage setUserInteractionEnabled:YES];
    [self.underTwoImage setUserInteractionEnabled:YES];
    [self.underThreeImage setUserInteractionEnabled:YES];
    [self.underFourImage setUserInteractionEnabled:YES];
    [self.underFiveImage setUserInteractionEnabled:YES];
    
    //----------------------------------------------//
    
    [self.operatorImage setUserInteractionEnabled:YES];
    
    //----------------------------------------------//
    
    temp_check=0;
    trashId=0;
    operator_check=0;
    operator=@"";
    
    //---------- Array Init Set -------------------//
    topMissArray=[[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0", nil];
    topValueArray=[[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"", nil];
    
    underMissArray=[[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0", nil];
    underValueArray=[[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"",@"", nil];
}

-(void)displayResult{
    
    NSString *topString, *underString;
    
    topString=[[NSString alloc] init];
    underString=[[NSString alloc] init];
    topString=@"";
    underString=@"";
    //----------------------------------------------------------//
    int top = 0;
    for (int i=0; i<5; i++) {
        if (![[topMissArray objectAtIndex:i] isEqualToString:@"0"]) {
            top=top+1;
        }
    }
    //---------------------------------------------------------//
    int under=0;
    for (int j=0; j<5; j++) {
        if (![[underMissArray objectAtIndex:j] isEqualToString:@"0"]) {
            under=under+1;
        }
    }
    //---------------------------------------------------------//
    
    for (int m=0; m<4; m++) {
        if ([[topValueArray objectAtIndex:m] isEqualToString:@""]) {
            if (m==3) {
                if (![[topValueArray objectAtIndex:4] isEqualToString:@""]) {
                    topString=[topString stringByAppendingString:[topValueArray objectAtIndex:m+1]];
                }
            }
        }else{
            if ([[topValueArray objectAtIndex:m+1] isEqualToString:@""]) {
                self.lblResult.text=@"";
                topString=@"";
                m=10;
            }else{
                topString=[topString stringByAppendingString:[topValueArray objectAtIndex:m]];
                if (m==3) {
                    if (![[topValueArray objectAtIndex:4] isEqualToString:@""]) {
                        topString=[topString stringByAppendingString:[topValueArray objectAtIndex:m+1]];
                    }
                }
            }
        }
    }
    
    //---------------------------------------------------------//
    
    for (int n=0; n<4; n++) {
        if ([[underValueArray objectAtIndex:n] isEqualToString:@""]) {
            if (n==3) {
                if (![[underValueArray objectAtIndex:4] isEqualToString:@""]) {
                    underString=[underString stringByAppendingString:[underValueArray objectAtIndex:n+1]];
                }
            }
        }else{
            if ([[underValueArray objectAtIndex:n+1] isEqualToString:@""]) {
                self.lblResult.text=@"";
                underString=@"";
                n=10;
            }else{
                
                underString=[underString stringByAppendingString:[underValueArray objectAtIndex:n]];
                if (n==3) {
                    if (![[underValueArray objectAtIndex:4] isEqualToString:@""]) {
                        underString=[underString stringByAppendingString:[underValueArray objectAtIndex:n+1]];
                    }
                }
                
            }
        }
    }
    
    //----------------------------------------------------------//
    if ([operator isEqualToString:@""]) {
        self.lblResult.text=@"No Operator";
    }else{
        
    // //   if (top>0) {
          //  self.lblResult.text=@"Missing Digits";
        //}else{
       //     if (under>0) {
       //         self.lblResult.text=@"Missing Digits";
                
      //      }else{
                if ((![topString isEqualToString:@""]) && (![underString isEqualToString:@""]) ){
                    
                    //----------- Display Totol Result -------------------//
                    
                    int topValue=[topString intValue];
                    int underValue=[underString intValue];
                    
                    int total=0;
                    if ([operator isEqualToString:@"+"]) {
                        total=topValue+underValue;
                    }
                    if ([operator isEqualToString:@"-"]) {
                        total=topValue-underValue;
                    }
                    if ([operator isEqualToString:@"*"]) {
                        total=topValue*underValue;
                    }
                    if ([operator isEqualToString:@"/"]) {
                        total=topValue/underValue;
                    }
                    self.lblResult.text=[NSString stringWithFormat:@"%d",total];
                    //----------------------------------------------------//
                }else{
                    self.lblResult.text=@"";
                }
          //  }
       //}
    
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
  
    if([[touch view] tag] == 1)
    {
        [tempIV setImage:self.zeroImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"0";
    }
    
    if([[touch view] tag] == 2)
    {
        [tempIV setImage:self.oneImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"1";
    }
    
    if([[touch view] tag] == 3)
    {
        [tempIV setImage:self.twoImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"2";
    }
    
    if([[touch view] tag] == 4)
    {
        [tempIV setImage:self.threeImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"3";
    }
    
    if([[touch view] tag] == 5)
    {
        [tempIV setImage:self.fourImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"4";
    }
    
    if([[touch view] tag] == 6)
    {
        [tempIV setImage:self.fiveImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"5";
    }
    
    if([[touch view] tag] == 7)
    {
        [tempIV setImage:self.sixImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"6";
    }
    
    if([[touch view] tag] == 8)
    {
        [tempIV setImage:self.sevenImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"7";
    }
    
    if([[touch view] tag] == 9)
    {
        [tempIV setImage:self.eightImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"8";
    }
    
    if([[touch view] tag] == 10)
    {
        [tempIV setImage:self.nineImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=1;
        temp=@"9";
    }
    
    if([[touch view] tag] == 11)
    {
        [tempIV setImage:self.plusImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=2;
        temp=@"+";
    }
    
    if([[touch view] tag] == 12)
    {
        [tempIV setImage:self.minusImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=2;
        temp=@"-";
    }
    
    if([[touch view] tag] == 13)
    {
        [tempIV setImage:self.multiImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=2;
        temp=@"*";
    }
    
    if([[touch view] tag] == 14)
    {
        [tempIV setImage:self.divideImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        
        temp_check=2;
        temp=@"/";
    }
    
    //--------------- Trash --------------------------//
    
    
    
    if([[touch view] tag] == 101)
    {
        if (![[topValueArray objectAtIndex:0] isEqualToString:@""]) {
            [tempIV setImage:self.topOneImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.topOneImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=11;
            
            temp=[topValueArray objectAtIndex:0];
            [topValueArray setObject:@"" atIndexedSubscript:0];
            [topMissArray setObject:@"1" atIndexedSubscript:0];
        }
        
        
    }
    if([[touch view] tag] == 102)
    {
        if (![[topValueArray objectAtIndex:1] isEqualToString:@""]) {
            
            [tempIV setImage:self.topTwoImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.topTwoImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=12;
            
            temp=[topValueArray objectAtIndex:1];
            [topValueArray setObject:@"" atIndexedSubscript:1];
            [topMissArray setObject:@"1" atIndexedSubscript:1];
            
        }
    }
    if([[touch view] tag] == 103)
    {
        if (![[topValueArray objectAtIndex:2] isEqualToString:@""]) {
            [tempIV setImage:self.topThreeImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.topThreeImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=13;
            
            temp=[topValueArray objectAtIndex:2];
            [topValueArray setObject:@"" atIndexedSubscript:2];
            [topMissArray setObject:@"1" atIndexedSubscript:2];
        }
    }
    if([[touch view] tag] == 104)
    {
        if (![[topValueArray objectAtIndex:3] isEqualToString:@""]) {
            [tempIV setImage:self.topFourImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.topFourImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=14;
            
            temp=[topValueArray objectAtIndex:3];
            [topValueArray setObject:@"" atIndexedSubscript:3];
            [topMissArray setObject:@"1" atIndexedSubscript:3];
        }
        
        
    }
    if([[touch view] tag] == 105)
    {
        if (![[topValueArray objectAtIndex:4] isEqualToString:@""]) {
            [tempIV setImage:self.topFiveImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.topFiveImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=15;
            
            temp=[topValueArray objectAtIndex:4];
            [topValueArray setObject:@"" atIndexedSubscript:4];
            [topMissArray setObject:@"1" atIndexedSubscript:4];


        }
        
    }
    
    if([[touch view] tag] == 201)
    {
        if (![[underValueArray objectAtIndex:0] isEqualToString:@""]) {
            [tempIV setImage:self.underOneImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.underOneImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=21;
            
            temp=[underValueArray objectAtIndex:0];
            [underValueArray setObject:@"" atIndexedSubscript:0];
            [underMissArray setObject:@"1" atIndexedSubscript:0];

        }
        
    }
    if([[touch view] tag] == 202)
    {
        if (![[underValueArray objectAtIndex:1] isEqualToString:@""]) {
            [tempIV setImage:self.underTwoImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.underTwoImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=22;
            
            temp=[underValueArray objectAtIndex:1];
            [underValueArray setObject:@"" atIndexedSubscript:1];
            [underMissArray setObject:@"1" atIndexedSubscript:1];
        }
        
        
    }
    if([[touch view] tag] == 203)
    {
        if (![[underValueArray objectAtIndex:2] isEqualToString:@""]) {
            [tempIV setImage:self.underThreeImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.underThreeImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=23;
            
            temp=[underValueArray objectAtIndex:2];
            [underValueArray setObject:@"" atIndexedSubscript:2];
            [underMissArray setObject:@"1" atIndexedSubscript:2];
        }
        
       
    }
    if([[touch view] tag] == 204)
    {
        if (![[underValueArray objectAtIndex:3] isEqualToString:@""]) {
            [tempIV setImage:self.underFourImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.underFourImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=24;
            
            temp=[underValueArray objectAtIndex:3];
            [underValueArray setObject:@"" atIndexedSubscript:3];
            [underMissArray setObject:@"1" atIndexedSubscript:3];
        }
        
        
    }
    if([[touch view] tag] == 205)
    {
        if (![[underValueArray objectAtIndex:4] isEqualToString:@""]) {
            [tempIV setImage:self.underFiveImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.underFiveImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=25;
            
            temp=[underValueArray objectAtIndex:4];
            [underValueArray setObject:@"" atIndexedSubscript:4];
            [underMissArray setObject:@"1" atIndexedSubscript:4];
        }
        
        
    }
    if([[touch view] tag] == 300)
    {
        if (![operator isEqualToString:@""]) {
            [tempIV setImage:self.operatorImage.image];
            [tempIV setCenter:[touch locationInView:self.view]];
            [tempIV setUserInteractionEnabled:YES];
            
            self.operatorImage.image=[UIImage imageNamed:@"button.png"];
            
            temp_check=3;
            trashId=30;
            
            temp=operator;
            operator=@"";
    
            operator_check=1;
        }
        
        
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if (temp_check==1) {
        [tempIV setCenter:[touch locationInView:self.view]];
    }
    
    if (temp_check==2) {
        [tempIV setCenter:[touch locationInView:self.view]];
    }
    if (temp_check==3) {
        [tempIV setCenter:[touch locationInView:self.view]];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if (temp_check==1) {
        
        if(CGRectContainsPoint(self.topOneImage.frame, [touch locationInView:self.view]))
        {
            if ([[topValueArray objectAtIndex:0] isEqualToString:@""]) {
                self.topOneImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:0];
                [topMissArray setObject:@"0" atIndexedSubscript:0];
                
                [self displayResult];
            }
            
        }
        if(CGRectContainsPoint(self.topTwoImage.frame, [touch locationInView:self.view]))
        {
            if ([[topValueArray objectAtIndex:1] isEqualToString:@""]) {
                self.topTwoImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:1];
                [topMissArray setObject:@"0" atIndexedSubscript:1];
                
                [self displayResult];
            }
        }
        if(CGRectContainsPoint(self.topThreeImage.frame, [touch locationInView:self.view]))
        {
            if ([[topValueArray objectAtIndex:2] isEqualToString:@""]) {
                self.topThreeImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:2];
                [topMissArray setObject:@"0" atIndexedSubscript:2];
                
                [self displayResult];
            }
        }
        if(CGRectContainsPoint(self.topFourImage.frame, [touch locationInView:self.view]))
        {
            if ([[topValueArray objectAtIndex:3] isEqualToString:@""]) {
                self.topFourImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:3];
                [topMissArray setObject:@"0" atIndexedSubscript:3];
                
                [self displayResult];
            }
        }
        if(CGRectContainsPoint(self.topFiveImage.frame, [touch locationInView:self.view]))
        {
            if ([[topValueArray objectAtIndex:4] isEqualToString:@""]) {
                self.topFiveImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:4];
                [topMissArray setObject:@"0" atIndexedSubscript:4];
                
                [self displayResult];
            }
        }
        
        if(CGRectContainsPoint(self.underOneImage.frame, [touch locationInView:self.view]))
        {
            if ([[underValueArray objectAtIndex:0] isEqualToString:@""]) {
                self.underOneImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:0];
                [underMissArray setObject:@"0" atIndexedSubscript:0];
                
                [self displayResult];
            }
        }
        if(CGRectContainsPoint(self.underTwoImage.frame, [touch locationInView:self.view]))
        {
            if ([[underValueArray objectAtIndex:1] isEqualToString:@""]) {
                self.underTwoImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:1];
                [underMissArray setObject:@"0" atIndexedSubscript:1];
                
                [self displayResult];
            }
        }
        if(CGRectContainsPoint(self.underThreeImage.frame, [touch locationInView:self.view]))
        {
            if ([[underValueArray objectAtIndex:2] isEqualToString:@""]) {
                self.underThreeImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:2];
                [underMissArray setObject:@"0" atIndexedSubscript:2];
                
                [self displayResult];
            }
        }
        if(CGRectContainsPoint(self.underFourImage.frame, [touch locationInView:self.view]))
        {
            if ([[underValueArray objectAtIndex:3] isEqualToString:@""]) {
                self.underFourImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:3];
                [underMissArray setObject:@"0" atIndexedSubscript:3];
                
                [self displayResult];
            }
        }
        if(CGRectContainsPoint(self.underFiveImage.frame, [touch locationInView:self.view]))
        {
            if ([[underValueArray objectAtIndex:4] isEqualToString:@""]) {
                self.underFiveImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:4];
                [underMissArray setObject:@"0" atIndexedSubscript:4];
                
                [self displayResult];
            }
        }
        
    }
    if (temp_check==2) {
        
        if(CGRectContainsPoint(self.operatorImage.frame, [touch locationInView:self.view]))
        {
            if ([operator isEqualToString:@""]) {
                
                self.operatorImage.image=tempIV.image;
                operator=temp;
                operator_check=0;
                
                [self displayResult];
            }
            
        }
    }
    
    //----------------------- Trash ---------------------------------//
    
    if (temp_check==3) {
        
        //------------- Top Line ------------------//
        
        if (trashId==11) {
            
            if(CGRectContainsPoint(self.topOneImage.frame, [touch locationInView:self.view]))
            {
                self.topOneImage.image=tempIV.image;
                
                [topValueArray setObject:temp atIndexedSubscript:0];
                [topMissArray setObject:@"0" atIndexedSubscript:0];
                
                [self displayResult];
                
            }else{
                [topMissArray setObject:@"0" atIndexedSubscript:0];
                [self displayResult];
            }
            
        }
        
        if (trashId==12) {
            
            if(CGRectContainsPoint(self.topTwoImage.frame, [touch locationInView:self.view]))
            {
                self.topTwoImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:1];
                [topMissArray setObject:@"0" atIndexedSubscript:1];
                
                [self displayResult];
                
            }else{
                
                if ([[topValueArray objectAtIndex:0] isEqualToString:@""]) {
                    
                    [topMissArray setObject:@"0" atIndexedSubscript:1];
                     [topValueArray setObject:@"" atIndexedSubscript:1];
                    [self displayResult];
                }
            }
        }
        
        if (trashId==13) {
            
            if(CGRectContainsPoint(self.topThreeImage.frame, [touch locationInView:self.view]))
            {
                self.topThreeImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:2];
                [topMissArray setObject:@"0" atIndexedSubscript:2];
                
                [self displayResult];
                
            }else{
                
                if (([[topValueArray objectAtIndex:0] isEqualToString:@""]) && ([[topValueArray objectAtIndex:1] isEqualToString:@""])) {
                    
                    [topMissArray setObject:@"0" atIndexedSubscript:2];
                    [topValueArray setObject:@"" atIndexedSubscript:2];
                    [self displayResult];
                }
                
            }
        }
        
        if (trashId==14) {
            
            if(CGRectContainsPoint(self.topFourImage.frame, [touch locationInView:self.view]))
            {
                self.topFourImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:3];
                [topMissArray setObject:@"0" atIndexedSubscript:3];
                
                [self displayResult];
                
            }else{
                
                if (([[topValueArray objectAtIndex:0] isEqualToString:@""]) && ([[topValueArray objectAtIndex:1] isEqualToString:@""]) && ([[topValueArray objectAtIndex:2] isEqualToString:@""])) {
                    
                    [topMissArray setObject:@"0" atIndexedSubscript:3];
                    [topValueArray setObject:@"" atIndexedSubscript:3];
                    [self displayResult];
                }
                
            }
        }
        
        if (trashId==15) {
            
            if(CGRectContainsPoint(self.topFiveImage.frame, [touch locationInView:self.view]))
            {
                self.topFiveImage.image=tempIV.image;
                [topValueArray setObject:temp atIndexedSubscript:4];
                [topMissArray setObject:@"0" atIndexedSubscript:4];
                
                [self displayResult];
                
            }else{
                
                if (([[topValueArray objectAtIndex:0] isEqualToString:@""]) && ([[topValueArray objectAtIndex:1] isEqualToString:@""]) && ([[topValueArray objectAtIndex:2] isEqualToString:@""]) && ([[topValueArray objectAtIndex:3] isEqualToString:@""])) {
                    
                    [topMissArray setObject:@"0" atIndexedSubscript:4];
                    [topValueArray setObject:@"" atIndexedSubscript:4];
                    [self displayResult];
                }

            }
        }
        
        //--------------- Under Line ------------------//
        
        if (trashId==21) {
            
            if(CGRectContainsPoint(self.underOneImage.frame, [touch locationInView:self.view]))
            {
                self.underOneImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:0];
                [underMissArray setObject:@"0" atIndexedSubscript:0];
                
                [self displayResult];
                
            }else{
                [underMissArray setObject:@"0" atIndexedSubscript:0];
            }
        }
        
        if (trashId==22) {
            
            if(CGRectContainsPoint(self.underTwoImage.frame, [touch locationInView:self.view]))
            {
                self.underTwoImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:1];
                [underMissArray setObject:@"0" atIndexedSubscript:1];
                
                [self displayResult];
                
            }else{
                if ([[underValueArray objectAtIndex:0] isEqualToString:@""]) {
                    [underValueArray setObject:@"" atIndexedSubscript:1];
                    [underMissArray setObject:@"0" atIndexedSubscript:1];
                    [self displayResult];
                }
            }
        }
        
        if (trashId==23) {
            
            if(CGRectContainsPoint(self.underThreeImage.frame, [touch locationInView:self.view]))
            {
                self.underThreeImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:2];
                [underMissArray setObject:@"0" atIndexedSubscript:2];
                
                [self displayResult];
                
            }else{
                if (([[underValueArray objectAtIndex:0] isEqualToString:@""]) && ([[underValueArray objectAtIndex:1] isEqualToString:@""])) {
                    
                    [underValueArray setObject:@"" atIndexedSubscript:2];
                    [underMissArray setObject:@"0" atIndexedSubscript:2];
                    
                    [self displayResult];
                }
            }
        }
        
        if (trashId==24) {
            
            if(CGRectContainsPoint(self.underFourImage.frame, [touch locationInView:self.view]))
            {
                self.underFourImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:3];
                [underMissArray setObject:@"0" atIndexedSubscript:3];
                
                [self displayResult];
                
            }else{
                
                if (([[underValueArray objectAtIndex:0] isEqualToString:@""]) && ([[underValueArray objectAtIndex:1] isEqualToString:@""]) && ([[underValueArray objectAtIndex:2] isEqualToString:@""])){
                    
                    [underValueArray setObject:@"" atIndexedSubscript:3];
                    [underMissArray setObject:@"0" atIndexedSubscript:3];
                    
                    [self displayResult];
            }
        }
        
        if (trashId==25) {
            
            if(CGRectContainsPoint(self.underFiveImage.frame, [touch locationInView:self.view]))
            {
                self.underFiveImage.image=tempIV.image;
                [underValueArray setObject:temp atIndexedSubscript:4];
                [underMissArray setObject:@"0" atIndexedSubscript:4];
                
                [self displayResult];
                
            }else{
                if (([[underValueArray objectAtIndex:0] isEqualToString:@""]) && ([[underValueArray objectAtIndex:1] isEqualToString:@""]) && ([[underValueArray objectAtIndex:2] isEqualToString:@""]) && ([[underValueArray objectAtIndex:3] isEqualToString:@""])){
                    
                    [underValueArray setObject:@"" atIndexedSubscript:4];
                    [underMissArray setObject:@"0" atIndexedSubscript:4];
                    
                    [self displayResult];
                    
                }
            }
        }
        
        //----------- Operator ------------------------//
        
        if (trashId==30) {
            
            if(CGRectContainsPoint(self.operatorImage.frame, [touch locationInView:self.view]))
            {
                self.operatorImage.image=tempIV.image;
                operator=temp;
                [self displayResult];
            }else{
                self.lblResult.text=@"";
            }
        }
    }
    }
    temp=@"";
    trashId=0;
    temp_check=0;
    [tempIV setImage:[UIImage imageNamed:@""]];
    [tempIV setUserInteractionEnabled:NO];
    
}

- (IBAction)backActionClicked:(id)sender{
    LearnSelectViewController *learnViewCtrl=[[LearnSelectViewController alloc] init];
    [self.navigationController pushViewController:learnViewCtrl animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
