//
//  NMUViewController.m
//  iOS-Tip-Calculator
//
//  Created by Ni Mu on 12/17/13.
//  Copyright (c) 2013 Ni Mu. All rights reserved.
//

#import "NMUViewController.h"

@interface NMUViewController ()
- (void)calculateTip;
- (void)dismissKeyboard;
@end

@implementation NMUViewController

- (void)viewDidLoad
{
    _subtotalBill.keyboardType = UIKeyboardTypeDecimalPad;
    _tipPercent.keyboardType = UIKeyboardTypeDecimalPad;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTipPercentEditDidEnd:(id)sender {
    [self calculateTip];
}

- (IBAction)onSubtotalEditDidEnd:(id)sender {
    [self calculateTip];
}

- (void)calculateTip {
    float baseAmount = [self.subtotalBill.text floatValue];
    float tipDecimal = [self.tipPercent.text floatValue] * 0.01;
    
    float tipAmount = baseAmount * tipDecimal;
    float totalAmount = baseAmount + tipAmount;
    
    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalBill.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)dismissKeyboard {
    [_subtotalBill resignFirstResponder];
    [_tipPercent resignFirstResponder];
}
@end
