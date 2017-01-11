//
//  SettingsViewController.m
//  Tip Calculator
//
//  Created by Laura Bingeman on 2017-01-11.
//  Copyright © 2017 Laura Bingeman. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *defaultTipSlider;
@property (weak, nonatomic) IBOutlet UILabel *defaultTipLabel;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.defaultTipSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    self.defaultTipLabel.text = [NSString stringWithFormat:@"%0.1f%%",self.defaultTipSlider.value];
    self.title = @"Settings";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChanged:(UISlider *)sender {
    [self.defaultTipSlider setValue:((int)((self.defaultTipSlider.value+2.5)/5)*5) animated:NO];
    [self updateTipAmount];
}

- (void)updateTipAmount {
    self.defaultTipLabel.text = [NSString stringWithFormat:@"%0.1f%%",self.defaultTipSlider.value];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithFloat:self.defaultTipSlider.value] forKey:@"defaultTipAmount"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    [self loadPreviousSettings];
}

- (void)loadPreviousSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float tipPercentage = [[defaults objectForKey:@"defaultTipAmount"] floatValue];
    NSLog(@"%f",tipPercentage);
    [self.defaultTipSlider setValue:tipPercentage];
    [self updateTipAmount];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
