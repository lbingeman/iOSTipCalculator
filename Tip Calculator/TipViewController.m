//
//  ViewController.m
//  Tip Calculator
//
//  Created by Laura Bingeman on 2017-01-11.
//  Copyright © 2017 Laura Bingeman. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
    
}

- (void)updateValues {
    //Get bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    //compute tip and total
    NSArray *tipValues = @[@(0.15),@(0.2),@(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue]*billAmount;
    float totalAmount = tipAmount + billAmount;
    
    //Update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateUserSettings];
}

- (void)updateUserSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float tipPercentage = [[defaults objectForKey:@"defaultTipAmount"] floatValue];
    NSInteger tipControlSelectedIndex = 0;
    
    if(tipPercentage == 20.0f){
        tipControlSelectedIndex = 1;
    } else if(tipPercentage == 25.0f){
        tipControlSelectedIndex = 2;
    }

    [self.tipControl setSelectedSegmentIndex:tipControlSelectedIndex];
    [self updateValues];
}

@end
