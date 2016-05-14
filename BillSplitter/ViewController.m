//
//  ViewController.m
//  BillSplitter
//
//  Created by Rosalyn Kingsmill on 2016-05-14.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberPeople;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTextField];
    [self setUpSlider];
    

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpTextField {
    
    self.textField.placeholder = @"Enter Bill Amount";
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.returnKeyType = UIReturnKeyDone;
    
}

-(void)setUpSlider {
    [self.slider setMinimumValue:2];
    [self.slider setMaximumValue:8];
    
}
- (IBAction)calculateSplitAmount:(id)sender {
    
    NSString* input = self.textField.text;
    NSDecimalNumber *decimal = [NSDecimalNumber decimalNumberWithString:input];
    
    int sliderInt = (int) self.slider.value;
//    NSString *displayPeople = [NSString stringWithFormat:@"%i", sliderInt];
//    self.labelNumberPeople.text = displayPeople;
    NSDecimalNumber *sliderDecimal = [[NSDecimalNumber alloc] initWithInt:sliderInt];
    NSDecimalNumber *output = [decimal decimalNumberByDividingBy:sliderDecimal];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    NSString *stringLabel = [formatter stringFromNumber:output];
    self.label.text = stringLabel;
    
}


- (IBAction)sliderMoved:(id)sender {
    
    //display slider information
    int sliderInt = (int) self.slider.value;
    NSString *displayPeople = [NSString stringWithFormat:@"%i", sliderInt];
    self.labelNumberPeople.text = displayPeople;
    
}


@end
