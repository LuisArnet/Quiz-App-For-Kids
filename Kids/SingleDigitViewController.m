//
//  SingleDigitViewController.m
//  Kids
//
//  Created by SOO on 24/02/15.
//  Copyright (c) 2015 SOO. All rights reserved.
//

#import "SingleDigitViewController.h"

@interface SingleDigitViewController (){
    UIImageView *tempIV;
    UIImageView *trashIV;
    
    // ----- To check Correct Select ------ Avoid non-Number and operater selection ---------//
    int temp_Check;
    int trashId;
    
    //------- Check Missing Digits ------------//
    
    NSMutableArray *missArray;
    NSMutableArray *operatorArray;
    
    //-- Check Number or Operator ----------//
    
    int check;
    
    
    
    //------- Expression ---------------//
    
    NSString * expression;
    
    //----- Temp ------------//
    NSString *temp;
    NSString *trashTemp;
    
    NSString * numberOne;
    NSString * numberTwo;
    NSString * numberThree;
    NSString * numberFour;
    NSString * numberFive;
    NSString * numberSix;
    
    NSString * operatorOne;
    NSString * operatorTwo;
    NSString * operatorThree;
    NSString * operatorFour;
    NSString * operatorFive;
}

@end

@implementation SingleDigitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    temp_Check=0;
    trashId=0;
    check=0;
    
    
    missArray=[[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    operatorArray=[[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0", nil];
    
    
    expression=@"";
    
    numberOne=@"";
    numberTwo=@"";
    numberThree=@"";
    numberFour=@"";
    numberFive=@"";
    numberSix=@"";
    
    operatorOne=@"";
    operatorTwo=@"";
    operatorThree=@"";
    operatorFour=@"";
    operatorFive=@"";
    
    trashTemp=@"";
    
    // Do any additional setup after loading the view from its nib.
    self.poohImage.layer.cornerRadius=10;
    self.poohImage.layer.masksToBounds=YES;
    
    //At moving time , to keep image ,make tempIV
    
    tempIV = [[UIImageView alloc] init];
    [tempIV setFrame:CGRectMake(0, 300, 50, 50)];
    [tempIV setTag:122];
    [tempIV setUserInteractionEnabled:NO];
    [self.view addSubview:tempIV];
    
    trashIV = [[UIImageView alloc] init];
    [trashIV setFrame:CGRectMake(0, 300, 50, 50)];
    [trashIV setTag:123];
    [trashIV setUserInteractionEnabled:NO];
    [self.view addSubview:trashIV];
    
    
    // Allow User Touch Action in UIVIew
    
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
    
    [self.displayOneImage setUserInteractionEnabled:YES];
    [self.displayTwoImage setUserInteractionEnabled:YES];
    [self.displayThreeImage setUserInteractionEnabled:YES];
    [self.displayFourImage setUserInteractionEnabled:YES];
    [self.displayFiveImage setUserInteractionEnabled:YES];
    [self.displaySixImage setUserInteractionEnabled:YES];
    [self.displaySevenImage setUserInteractionEnabled:YES];
    [self.displayEightImage setUserInteractionEnabled:YES];
    [self.displayNineImage setUserInteractionEnabled:YES];
    [self.displayTenImage setUserInteractionEnabled:YES];
    [self.displayElevenImage setUserInteractionEnabled:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    //---------------------------------------------------//
    
    // Please see Xib file , we made zero button 's tag 100
    
    if([[touch view] tag] == 100)
    {
        [tempIV setImage:self.zeroImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        temp_Check=1;
        [tempIV setUserInteractionEnabled:YES];
        check=1;
        temp=@"0";
    }
    if([[touch view] tag] == 101)
    {
        [tempIV setImage:self.oneImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"1";
    }
    if([[touch view] tag] == 102)
    {
        [tempIV setImage:self.twoImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"2";
    }
    if([[touch view] tag] == 103)
    {
        [tempIV setImage:self.threeImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"3";
    }
    if([[touch view] tag] == 104)
    {
        [tempIV setImage:self.fourImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"4";
    }
    if([[touch view] tag] == 105)
    {
        [tempIV setImage:self.fiveImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"5";
    }
    if([[touch view] tag] == 106)
    {
        [tempIV setImage:self.sixImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"6";
    }
    if([[touch view] tag] == 107)
    {
        [tempIV setImage:self.sevenImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"7";
    }
    if([[touch view] tag] == 108)
    {
        [tempIV setImage:self.eightImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"8";
    }
    if([[touch view] tag] == 109)
    {
        [tempIV setImage:self.nineImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=1;
        temp=@"9";
    }
    if([[touch view] tag] == 110)
    {
        [tempIV setImage:self.plusImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
        check=2;
        temp=@"+";
    }
    if([[touch view] tag] == 111)
    {
        [tempIV setImage:self.minusImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
         check=2;
        temp=@"-";
    }
    if([[touch view] tag] == 112)
    {
        [tempIV setImage:self.multiImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
         check=2;
        temp=@"*";
    }
    if([[touch view] tag] == 113)
    {
        [tempIV setImage:self.divideImage.image];
        [tempIV setCenter:[touch locationInView:self.view]];
        [tempIV setUserInteractionEnabled:YES];
        temp_Check=1;
         check=2;
        temp=@"/";
    }
    
    
    //---------- Remove Numbers and Operators --------------//
    
    if (![numberOne isEqualToString:@""]) {
        if([[touch view] tag] == 1)
        {
            [trashIV setImage:self.displayOneImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayOneImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=1;
            trashTemp=numberOne;
            numberOne=@"";
            [missArray setObject:@"1" atIndexedSubscript:0];
        }
    }
    if (![operatorOne isEqualToString:@""]) {
        if([[touch view] tag] == 2)
        {
            [trashIV setImage:self.displayTwoImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayTwoImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=2;
            trashTemp=operatorOne;
            operatorOne=@"";
            [missArray setObject:@"1" atIndexedSubscript:1];
        }
    }
    if (![numberTwo isEqualToString:@""]) {
        if([[touch view] tag] == 3)
        {
            [trashIV setImage:self.displayThreeImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayThreeImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=3;
            trashTemp=numberTwo;
            numberTwo=@"";
            [missArray setObject:@"1" atIndexedSubscript:2];
        }
    }
    if (![operatorTwo isEqualToString:@""]) {
        if([[touch view] tag] == 4)
        {
            [trashIV setImage:self.displayFourImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayFourImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=4;
            trashTemp=operatorTwo;
            operatorTwo=@"";
            [missArray setObject:@"1" atIndexedSubscript:3];
        }
    }
    if (![numberThree isEqualToString:@""]) {
        if([[touch view] tag] == 5)
        {
            [trashIV setImage:self.displayFiveImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayFiveImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=5;
            trashTemp=numberThree;
            numberThree=@"";
            [missArray setObject:@"1" atIndexedSubscript:4];
        }
    }
    if (![operatorThree isEqualToString:@""]) {
        if([[touch view] tag] == 6)
        {
            [trashIV setImage:self.displaySixImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displaySixImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=6;
            trashTemp=operatorThree;
            operatorThree=@"";
            [missArray setObject:@"1" atIndexedSubscript:5];
        }
    }
    if (![numberFour isEqualToString:@""]) {
        if([[touch view] tag] == 7)
        {
            [trashIV setImage:self.displaySevenImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displaySevenImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=7;
            trashTemp=numberFour;
            numberFour=@"";
            [missArray setObject:@"1" atIndexedSubscript:6];
        }
    }
    if (![operatorFour isEqualToString:@""]) {
        if([[touch view] tag] == 8)
        {
            [trashIV setImage:self.displayEightImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayEightImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=8;
            trashTemp=operatorFour;
            operatorFour=@"";
            [missArray setObject:@"1" atIndexedSubscript:7];
        }
    }
    if (![numberFive isEqualToString:@""]) {
        if([[touch view] tag] == 9)
        {
            [trashIV setImage:self.displayNineImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayNineImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=9;
            trashTemp=numberFive;
            numberFive=@"";
            [missArray setObject:@"1" atIndexedSubscript:8];
        }
    }
    if (![operatorFive isEqualToString:@""]) {
        if([[touch view] tag] == 10)
        {
            [trashIV setImage:self.displayTenImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayTenImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=10;
            trashTemp=operatorFive;
            operatorFive=@"";
            [missArray setObject:@"1" atIndexedSubscript:9];
        }
    }
    if (![numberSix isEqualToString:@""]) {
        if([[touch view] tag] == 11)
        {
            [trashIV setImage:self.displayElevenImage.image];
            [trashIV setCenter:[touch locationInView:self.view]];
            [trashIV setUserInteractionEnabled:YES];
            self.displayElevenImage.image=[UIImage imageNamed:@"button.png"];
            temp_Check=2;
            trashId=11;
            trashTemp=numberSix;
            numberSix=@"";
            [missArray setObject:@"1" atIndexedSubscript:10];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (temp_Check==1) {
        [tempIV setCenter:[touch locationInView:self.view]];
    }
    if (temp_Check==2) {
        [trashIV setCenter:[touch locationInView:self.view]];
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    //------------- Input Numbers and Operator -------------------------//
    
    if (temp_Check==1) {
        [tempIV setCenter:[touch locationInView:self.view]];
        
        //---------- Put Numbers into Expression ------------------//
        if (check==1) {
            if(CGRectContainsPoint(self.displayOneImage.frame, [touch locationInView:self.view]))
            {
                if ([numberOne isEqualToString:@""]) {
                    [self.displayOneImage setImage:tempIV.image];
                    numberOne=temp;
                    
                    if ([[missArray objectAtIndex:0] isEqualToString:@"1"]) {
                        [missArray setObject:@"0" atIndexedSubscript:0];
                    }
                    int test=0;
                    for (int i=0; i<11; i++) {
                        if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                            test=test+1;
                        }
                    }
                    if (test>0) {
                        self.lblDisplayResult.text=@"Missing Digit!";
                    }else{
                        self.lblDisplayResult.text=@"";
                        int operator=0;
                        for (int j=0; j<5; j++) {
                            if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                operator=operator+1;
                            }
                        }
                        if (operator==0) {
                            [self displayResult];
                        }
                    }
                    
                   
                }else{
                    self.lblDisplayResult.text=@"Already Exist!";
                }
                
            }
            
            if(CGRectContainsPoint(self.displayThreeImage.frame, [touch locationInView:self.view]))
            {
                if ([numberTwo isEqualToString:@""]) {
                    [self.displayThreeImage setImage:tempIV.image];
                    numberTwo=temp;
                    if (![operatorOne isEqualToString:@""]) {
                        [operatorArray setObject:@"0" atIndexedSubscript:0];
                        
                        if ([[missArray objectAtIndex:2] isEqualToString:@"1"]) {
                            [missArray setObject:@"0" atIndexedSubscript:2];
                        }
                        int test=0;
                        for (int i=0; i<11; i++) {
                            if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                                test=test+1;
                            }
                        }
                        if (test>0) {
                            self.lblDisplayResult.text=@"Missing Digit!";
                        }else{
                            self.lblDisplayResult.text=@"";
                            int operator=0;
                            for (int j=0; j<5; j++) {
                                if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                    operator=operator+1;
                                }
                            }
                            if (operator==0) {
                                [self displayResult];
                            }
                        }
                        
                    }else{
                        NSLog(@"Missing Opeator");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        numberTwo=@"";
                        self.displayThreeImage.image=[UIImage imageNamed:@"button.png"];
                    }

                }else{
                     self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
            }
            
            if(CGRectContainsPoint(self.displayFiveImage.frame, [touch locationInView:self.view]))
            {
                if ([numberThree isEqualToString:@""]) {
                    [self.displayFiveImage setImage:tempIV.image];
                    numberThree=temp;
                    if (![operatorTwo isEqualToString:@""]) {
                        [operatorArray setObject:@"0" atIndexedSubscript:1];
                        if ([[missArray objectAtIndex:4] isEqualToString:@"1"]) {
                            [missArray setObject:@"0" atIndexedSubscript:4];
                        }
                        int test=0;
                        for (int i=0; i<11; i++) {
                            if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                                test=test+1;
                            }
                        }
                        if (test>0) {
                            self.lblDisplayResult.text=@"Missing Digit!";
                        }else{
                            self.lblDisplayResult.text=@"";
                            int operator=0;
                            for (int j=0; j<5; j++) {
                                if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                    operator=operator+1;
                                }
                            }
                            if (operator==0) {
                                [self displayResult];
                            }
                        }
                        
                    }else{
                        NSLog(@"Missing Opeator");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        numberThree=@"";
                        self.displayFiveImage.image=[UIImage imageNamed:@"button.png"];
                    }

                }else{
                    self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
            }
            
            if(CGRectContainsPoint(self.displaySevenImage.frame, [touch locationInView:self.view]))
            {
                if ([numberFour isEqualToString:@""]) {
                    [self.displaySevenImage setImage:tempIV.image];
                    numberFour=temp;
                    if (![operatorThree isEqualToString:@""]) {
                        [operatorArray setObject:@"0" atIndexedSubscript:2];
                        if ([[missArray objectAtIndex:6] isEqualToString:@"1"]) {
                            [missArray setObject:@"0" atIndexedSubscript:6];
                        }
                        int test=0;
                        for (int i=0; i<11; i++) {
                            if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                                test=test+1;
                            }
                        }
                        if (test>0) {
                            self.lblDisplayResult.text=@"Missing Digit!";
                        }else{
                            self.lblDisplayResult.text=@"";
                            int operator=0;
                            for (int j=0; j<5; j++) {
                                if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                    operator=operator+1;
                                }
                            }
                            if (operator==0) {
                                [self displayResult];
                            }
                        }
                        
                    }else{
                        NSLog(@"Missing Opeator");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        numberFour=@"";
                        self.displaySevenImage.image=[UIImage imageNamed:@"button.png"];
                    }
                }else{
                    self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
               
            }
            
            if(CGRectContainsPoint(self.displayNineImage.frame, [touch locationInView:self.view]))
            {
                if ([numberFive isEqualToString:@""]) {
                    [self.displayNineImage setImage:tempIV.image];
                    numberFive=temp;
                    if (![operatorFour isEqualToString:@""]) {
                        [operatorArray setObject:@"0" atIndexedSubscript:3];
                        if ([[missArray objectAtIndex:8] isEqualToString:@"1"]) {
                            [missArray setObject:@"0" atIndexedSubscript:8];
                        }
                        int test=0;
                        for (int i=0; i<11; i++) {
                            if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                                test=test+1;
                            }
                        }
                        if (test>0) {
                            self.lblDisplayResult.text=@"Missing Digit!";
                        }else{
                            self.lblDisplayResult.text=@"";
                            int operator=0;
                            for (int j=0; j<5; j++) {
                                if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                    operator=operator+1;
                                }
                            }
                            if (operator==0) {
                                [self displayResult];
                            }
                        }
                        
                    }else{
                        NSLog(@"Missing Opeator");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        numberFive=@"";
                        self.displayNineImage.image=[UIImage imageNamed:@"button.png"];
                    }
                }else{
                    self.lblDisplayResult.text=@"Already Exist!";

                }
                
                
                
            }
            
            if(CGRectContainsPoint(self.displayElevenImage.frame, [touch locationInView:self.view]))
            {
                if ([numberSix isEqualToString:@""]) {
                    [self.displayElevenImage setImage:tempIV.image];
                    numberSix=temp;
                    if (![operatorFive isEqualToString:@""]) {
                        [operatorArray setObject:@"0" atIndexedSubscript:4];
                        if ([[missArray objectAtIndex:10] isEqualToString:@"1"]) {
                            [missArray setObject:@"0" atIndexedSubscript:10];
                        }
                        int test=0;
                        for (int i=0; i<11; i++) {
                            if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                                test=test+1;
                            }
                        }
                        if (test>0) {
                            self.lblDisplayResult.text=@"Missing Digit!";
                        }else{
                            self.lblDisplayResult.text=@"";
                            int operator=0;
                            for (int j=0; j<5; j++) {
                                if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                    operator=operator+1;
                                }
                            }
                            if (operator==0) {
                                [self displayResult];
                            }
                        }
                        
                    }else{
                        NSLog(@"Missing Opeator");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        numberSix=@"";
                        self.displayElevenImage.image=[UIImage imageNamed:@"button.png"];
                    }
                }else{
                    self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
                
            }
        }
        

        
        //------------ Put Operators into Expression ----------------//
        
        if (check==2) {
            if(CGRectContainsPoint(self.displayTwoImage.frame, [touch locationInView:self.view]))
            {
                if ([operatorOne isEqualToString:@""]) {
                    [self.displayTwoImage setImage:tempIV.image];
                    operatorOne=temp;
                    if ([numberOne isEqualToString:@""]) {
                        NSLog(@"Uncorrect Expression");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        operatorOne=@"";
                        self.displayTwoImage.image=[UIImage imageNamed:@"button.png"];
                    }
                    
                    if ([[missArray objectAtIndex:1] isEqualToString:@"1"]) {
                        [missArray setObject:@"0" atIndexedSubscript:1];
                    }
                    int test=0;
                    for (int i=0; i<11; i++) {
                        if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                            test=test+1;
                        }
                    }
                    if (test>0) {
                        self.lblDisplayResult.text=@"Missing Digit!";
                    }else{
                        self.lblDisplayResult.text=@"";
                        if ([numberTwo isEqualToString:@""]) {
                            [operatorArray setObject:@"1" atIndexedSubscript:0];
                            self.lblDisplayResult.text=@"";
                        }else{
                            int operator=0;
                            for (int j=0; j<5; j++) {
                                if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                    operator=operator+1;
                                }
                            }
                            if (operator==0) {
                                [self displayResult];
                            }
                            
                        }
                    }
                    
                }else{
                    self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
                
            }
            
            if(CGRectContainsPoint(self.displayFourImage.frame, [touch locationInView:self.view]))
            {
                if ([operatorTwo isEqualToString:@""]) {
                    [self.displayFourImage setImage:tempIV.image];
                    operatorTwo=temp;
                    if ([numberTwo isEqualToString:@""]) {
                        NSLog(@"Uncorrect Expression");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        operatorTwo=@"";
                        self.displayFourImage.image=[UIImage imageNamed:@"button.png"];
                    }
                    
                    if ([[missArray objectAtIndex:3] isEqualToString:@"1"]) {
                        [missArray setObject:@"0" atIndexedSubscript:3];
                    }
                    int test=0;
                    for (int i=0; i<11; i++) {
                        if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                            test=test+1;
                        }
                    }
                    if (test>0) {
                        self.lblDisplayResult.text=@"Missing Digit!";
                    }else{
                        self.lblDisplayResult.text=@"";
                        if ([numberThree isEqualToString:@""]) {
                            [operatorArray setObject:@"1" atIndexedSubscript:1];
                            self.lblDisplayResult.text=@"";
                        }else{
                            if ([numberTwo isEqualToString:@""]) {
                                [operatorArray setObject:@"1" atIndexedSubscript:0];
                            }else{
                                int operator=0;
                                for (int j=0; j<5; j++) {
                                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                        operator=operator+1;
                                    }
                                }
                                if (operator==0) {
                                    [self displayResult];
                                }
                                
                            }
                        }
                    }
                    
                }else{
                    self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
            }
            
            if(CGRectContainsPoint(self.displaySixImage.frame, [touch locationInView:self.view]))
            {
                if ([operatorThree isEqualToString:@""]) {
                    [self.displaySixImage setImage:tempIV.image];
                    operatorThree=temp;
                    if ([numberThree isEqualToString:@""]) {
                        NSLog(@"Uncorrect Expression");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        operatorThree=@"";
                        self.displaySixImage.image=[UIImage imageNamed:@"button.png"];
                    }
                    
                    if ([[missArray objectAtIndex:5] isEqualToString:@"1"]) {
                        [missArray setObject:@"0" atIndexedSubscript:5];
                    }
                    int test=0;
                    for (int i=0; i<11; i++) {
                        if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                            test=test+1;
                        }
                    }
                    if (test>0) {
                        self.lblDisplayResult.text=@"Missing Digit!";
                    }else{
                        self.lblDisplayResult.text=@"";
                        if ([numberFour isEqualToString:@""]) {
                            [operatorArray setObject:@"1" atIndexedSubscript:2];
                            self.lblDisplayResult.text=@"";
                        }else{
                            if ([numberThree isEqualToString:@""]) {
                                [operatorArray setObject:@"1" atIndexedSubscript:1];
                            }else{
                                int operator=0;
                                for (int j=0; j<5; j++) {
                                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                        operator=operator+1;
                                    }
                                }
                                if (operator==0) {
                                    [self displayResult];
                                }
                                
                            }
                        }
                    }
                    
                }else{
                    self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
            }
            
            if(CGRectContainsPoint(self.displayEightImage.frame, [touch locationInView:self.view]))
            {
                if ([operatorFour isEqualToString:@""]) {
                    [self.displayEightImage setImage:tempIV.image];
                    operatorFour=temp;
                    if ([numberFour isEqualToString:@""]) {
                        NSLog(@"Uncorrect Expression");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        operatorFour=@"";
                        self.displayEightImage.image=[UIImage imageNamed:@"button.png"];
                    }
                    
                    if ([[missArray objectAtIndex:7] isEqualToString:@"1"]) {
                        [missArray setObject:@"0" atIndexedSubscript:7];
                    }
                    int test=0;
                    for (int i=0; i<11; i++) {
                        if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                            test=test+1;
                        }
                    }
                    if (test>0) {
                        self.lblDisplayResult.text=@"Missing Digit!";
                    }else{
                        self.lblDisplayResult.text=@"";
                        if ([numberFive isEqualToString:@""]) {
                            [operatorArray setObject:@"1" atIndexedSubscript:3];
                            self.lblDisplayResult.text=@"";
                        }else{
                            if ([numberFour isEqualToString:@""]) {
                                [operatorArray setObject:@"1" atIndexedSubscript:2];
                            }else{
                                int operator=0;
                                for (int j=0; j<5; j++) {
                                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                        operator=operator+1;
                                    }
                                }
                                if (operator==0) {
                                    [self displayResult];
                                }
                                
                            }
                        }
                    }
                    
                }else{
                    self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
            }
            
            if(CGRectContainsPoint(self.displayTenImage.frame, [touch locationInView:self.view]))
            {
                if ([operatorFive isEqualToString:@""]) {
                    [self.displayTenImage setImage:tempIV.image];
                    operatorFive=temp;
                    if ([numberFive isEqualToString:@""]) {
                        NSLog(@"Uncorrect Expression");
                        self.lblDisplayResult.text=@"Uncorrect Expression!";
                        operatorFive=@"";
                        self.displayTenImage.image=[UIImage imageNamed:@"button.png"];
                    }
                    
                    if ([[missArray objectAtIndex:9] isEqualToString:@"1"]) {
                        [missArray setObject:@"0" atIndexedSubscript:9];
                    }
                    int test=0;
                    for (int i=0; i<11; i++) {
                        if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                            test=test+1;
                        }
                    }
                    if (test>0) {
                        self.lblDisplayResult.text=@"Missing Digit!";
                    }else{
                        self.lblDisplayResult.text=@"";
                        if ([numberSix isEqualToString:@""]) {
                            [operatorArray setObject:@"1" atIndexedSubscript:4];
                        }else{
                            if ([numberFive isEqualToString:@""]) {
                                [operatorArray setObject:@"1" atIndexedSubscript:3];
                                self.lblDisplayResult.text=@"";
                            }else{
                                int operator=0;
                                for (int j=0; j<5; j++) {
                                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                                        operator=operator+1;
                                    }
                                }
                                if (operator==0) {
                                    [self displayResult];
                                }
                                
                            }
                        }
                    }
                    
                }else{
                     self.lblDisplayResult.text=@"Already Exist!";
                }
                
                
            }
        }
        
        //-------------- Move Numbers and Operators into Trash -------------//
        
        
        
    }
    if (temp_Check==2) {
        [trashIV setCenter:[touch locationInView:self.view]];
        if (trashId==1) {
            if(CGRectContainsPoint(self.displayOneImage.frame, [touch locationInView:self.view]))
            {
                self.displayOneImage.image=trashIV.image;
                numberOne=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:0];
                
                self.lblDisplayResult.text=@"";
                
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
            }else{
                self.lblDisplayResult.text=@"";
            }
            
        }
        if (trashId==2) {
            if(CGRectContainsPoint(self.displayTwoImage.frame, [touch locationInView:self.view]))
            {
                self.displayTwoImage.image=trashIV.image;
                operatorOne=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:1];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
               
            }else{
                if (([numberFive isEqualToString:@""])&&([operatorFive isEqualToString:@""])&&([numberSix isEqualToString:@""])&&([operatorFour isEqualToString:@""])&&([numberFour isEqualToString:@""])&&([operatorThree isEqualToString:@""])&&([numberThree isEqualToString:@""])&&([operatorTwo isEqualToString:@""])&&([numberTwo isEqualToString:@""])) {
                    [missArray setObject:@"0" atIndexedSubscript:1];
                    [missArray setObject:@"0" atIndexedSubscript:2];
                    [missArray setObject:@"0" atIndexedSubscript:3];
                    [missArray setObject:@"0" atIndexedSubscript:4];
                    [missArray setObject:@"0" atIndexedSubscript:5];
                    [missArray setObject:@"0" atIndexedSubscript:6];
                    [missArray setObject:@"0" atIndexedSubscript:7];
                    [missArray setObject:@"0" atIndexedSubscript:8];
                    [missArray setObject:@"0" atIndexedSubscript:9];
                    [missArray setObject:@"0" atIndexedSubscript:10];
                    [operatorArray setObject:@"0" atIndexedSubscript:0];
                     [operatorArray setObject:@"0" atIndexedSubscript:1];
                     [operatorArray setObject:@"0" atIndexedSubscript:2];
                     [operatorArray setObject:@"0" atIndexedSubscript:3];
                     [operatorArray setObject:@"0" atIndexedSubscript:4];
                    [self displayResult];
                }else{
                    self.lblDisplayResult.text=@"";
                }
            }
            
        }
        if (trashId==3) {
            if(CGRectContainsPoint(self.displayThreeImage.frame, [touch locationInView:self.view]))
            {
                self.displayThreeImage.image=trashIV.image;
                numberTwo=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:2];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                
                NSLog(@"miss=%d,operator=%d",miss,operator);
                
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
                
            }else{
                self.lblDisplayResult.text=@"";
            }
            
        }
        if (trashId==4) {
            if(CGRectContainsPoint(self.displayFourImage.frame, [touch locationInView:self.view]))
            {
                self.displayFourImage.image=trashIV.image;
                operatorTwo=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:3];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
                
            }else{
                if (([numberFive isEqualToString:@""])&&([operatorFive isEqualToString:@""])&&([numberSix isEqualToString:@""])&&([operatorFour isEqualToString:@""])&&([numberFour isEqualToString:@""])&&([operatorThree isEqualToString:@""])&&([numberThree isEqualToString:@""])) {
                    [missArray setObject:@"0" atIndexedSubscript:3];
                    [missArray setObject:@"0" atIndexedSubscript:4];
                    [missArray setObject:@"0" atIndexedSubscript:5];
                    [missArray setObject:@"0" atIndexedSubscript:6];
                    [missArray setObject:@"0" atIndexedSubscript:7];
                    [missArray setObject:@"0" atIndexedSubscript:8];
                    [missArray setObject:@"0" atIndexedSubscript:9];
                    [missArray setObject:@"0" atIndexedSubscript:10];
                    
                    
                    [operatorArray setObject:@"0" atIndexedSubscript:1];
                    [operatorArray setObject:@"0" atIndexedSubscript:2];
                    [operatorArray setObject:@"0" atIndexedSubscript:3];
                    [operatorArray setObject:@"0" atIndexedSubscript:4];
                    
                    [self displayResult];
                }else{
                    self.lblDisplayResult.text=@"";
                }
            }
            
        }
        if (trashId==5) {
            if(CGRectContainsPoint(self.displayFiveImage.frame, [touch locationInView:self.view]))
            {
                self.displayFiveImage.image=trashIV.image;
                numberThree=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:4];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
                
            }else{
                self.lblDisplayResult.text=@"";
            }
            
        }
        if (trashId==6) {
            if(CGRectContainsPoint(self.displaySixImage.frame, [touch locationInView:self.view]))
            {
                self.displaySixImage.image=trashIV.image;
                operatorThree=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:5];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
               
            }else{
                if (([numberFive isEqualToString:@""])&&([operatorFive isEqualToString:@""])&&([numberSix isEqualToString:@""])&&([operatorFour isEqualToString:@""])&&([numberFour isEqualToString:@""])) {
                    [missArray setObject:@"0" atIndexedSubscript:5];
                    [missArray setObject:@"0" atIndexedSubscript:6];
                    [missArray setObject:@"0" atIndexedSubscript:7];
                    [missArray setObject:@"0" atIndexedSubscript:8];
                    [missArray setObject:@"0" atIndexedSubscript:9];
                    [missArray setObject:@"0" atIndexedSubscript:10];
                    
                    [operatorArray setObject:@"0" atIndexedSubscript:2];
                    [operatorArray setObject:@"0" atIndexedSubscript:3];
                    [operatorArray setObject:@"0" atIndexedSubscript:4];
                    [self displayResult];
                }else{
                    self.lblDisplayResult.text=@"";
                }
            }
            
        }
        if (trashId==7) {
            if(CGRectContainsPoint(self.displaySevenImage.frame, [touch locationInView:self.view]))
            {
                self.displaySevenImage.image=trashIV.image;
                numberFour=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:6];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
            }else{
                self.lblDisplayResult.text=@"";
            }
            
        }
        if (trashId==8) {
            if(CGRectContainsPoint(self.displayEightImage.frame, [touch locationInView:self.view]))
            {
                self.displayEightImage.image=trashIV.image;
                operatorFour=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:7];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
                
            }else{
                if (([numberFive isEqualToString:@""])&&([operatorFive isEqualToString:@""])&&([numberSix isEqualToString:@""])) {
                    [missArray setObject:@"0" atIndexedSubscript:7];
                    [missArray setObject:@"0" atIndexedSubscript:8];
                    [missArray setObject:@"0" atIndexedSubscript:9];
                    [missArray setObject:@"0" atIndexedSubscript:10];
                    
                    [operatorArray setObject:@"0" atIndexedSubscript:3];
                    [operatorArray setObject:@"0" atIndexedSubscript:4];
                    [self displayResult];
                }else{
                    self.lblDisplayResult.text=@"";
                }
            }
            
        }
        if (trashId==9) {
            if(CGRectContainsPoint(self.displayNineImage.frame, [touch locationInView:self.view]))
            {
                self.displayNineImage.image=trashIV.image;
                numberFive=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:8];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
            }else{
                self.lblDisplayResult.text=@"";
            }
            
        }
        if (trashId==10) {
            if(CGRectContainsPoint(self.displayTenImage.frame, [touch locationInView:self.view]))
            {
                self.displayTenImage.image=trashIV.image;
                operatorFive=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:9];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
                
            }else{
                if ([numberSix isEqualToString:@""]) {
                    [operatorArray setObject:@"0" atIndexedSubscript:5];
                    [missArray setObject:@"0" atIndexedSubscript:9];
                    [missArray setObject:@"0" atIndexedSubscript:10];
                    [self displayResult];
                }else{
                    self.lblDisplayResult.text=@"";
                }
            }
            
        }
        if (trashId==11) {
            if(CGRectContainsPoint(self.displayElevenImage.frame, [touch locationInView:self.view]))
            {
                self.displayElevenImage.image=trashIV.image;
                numberSix=trashTemp;
                [missArray setObject:@"0" atIndexedSubscript:10];
                self.lblDisplayResult.text=@"";
                int miss=0;
                int operator=0;
                for (int i=0; i<11; i++) {
                    if ([[missArray objectAtIndex:i] isEqualToString:@"1"]) {
                        miss=miss+1;
                    }
                }
                for (int j=0; j<5; j++) {
                    if ([[operatorArray objectAtIndex:j] isEqualToString:@"1"]) {
                        operator=operator+1;
                    }
                }
                if ((miss==0)&&(operator==0)) {
                    [self displayResult];
                }
               
            }else{
                [missArray setObject:@"0" atIndexedSubscript:10];
            }
            
        }
    }
    
    // Remove image from dragable view
    [tempIV setImage:[UIImage imageNamed:@""]];
    [tempIV setUserInteractionEnabled:NO];
    
    [trashIV setImage:[UIImage imageNamed:@""]];
    [trashIV setUserInteractionEnabled:NO];
    
    temp_Check=0;
    trashId=0;
    check=0;
    trashTemp=@"";

}

-(void)displayResult{
    expression=@"";
    expression=[expression stringByAppendingString:numberOne];
    expression=[expression stringByAppendingString:operatorOne];
    expression=[expression stringByAppendingString:numberTwo];
    expression=[expression stringByAppendingString:operatorTwo];
    expression=[expression stringByAppendingString:numberThree];
    expression=[expression stringByAppendingString:operatorThree];
    expression=[expression stringByAppendingString:numberFour];
    expression=[expression stringByAppendingString:operatorFour];
    expression=[expression stringByAppendingString:numberFive];
    expression=[expression stringByAppendingString:operatorFive];
    expression=[expression stringByAppendingString:numberSix];
    
    if ([expression containsString:@"/0"]) {
        self.lblDisplayResult.text=@"Can not Divide by 0";
    }else{
        NSExpression *expressionResult = [NSExpression expressionWithFormat:expression argumentArray:nil];
        NSNumber *result = [expressionResult expressionValueWithObject:nil context:nil];
        
        NSLog(@"%@",expression);
        NSLog(@"%@",result);
        self.lblDisplayResult.text=[NSString stringWithFormat:@"%@",result];
    }
    
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backActionClicked:(id)sender {
    LearnSelectViewController *learnViewCtrl=[[LearnSelectViewController alloc] init];
    [self.navigationController pushViewController:learnViewCtrl animated:NO];
}
@end
