//
//  TipViewController.m
//  Tip-Calculator
//
//  Created by Ni Mu on 12/19/13.
//  Copyright (c) 2013 Ni Mu. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

// Constants
@property (nonatomic, strong) NSArray *tipPercents;

// UI Elements
@property (weak, nonatomic) IBOutlet UITextField *subtotalBillTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalBillLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentControl;

// Actions
- (IBAction)onTap:(id)sender;
- (IBAction)calculateTip:(id)sender;

// Other Methods
- (void)onSettingsButton;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
        self.tipPercents = @[@"0.15", @"0.2", @"0.25"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.subtotalBillTextField.keyboardType = UIKeyboardTypeDecimalPad;
    
    UIBarButtonItem *settingsItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    self.navigationItem.rightBarButtonItem = settingsItem;
    
    [self loadDefaultTipPercent];
}

- (void)viewWillAppear:(BOOL)animated {
    [self loadDefaultTipPercent];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)calculateTip:(id)sender {
    float tipDecimal = [self.tipPercents[self.tipPercentControl.selectedSegmentIndex] floatValue];
    
    float baseAmount = [self.subtotalBillTextField.text floatValue];
    
    float tipAmount = baseAmount * tipDecimal;
    float totalAmount = tipAmount + baseAmount;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalBillLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[SettingsViewController new] animated:YES];
}

- (void)loadDefaultTipPercent {
    int tipPercentPreference = [[NSUserDefaults standardUserDefaults] integerForKey:@"tipPercentPreference"];
    [self.tipPercentControl setSelectedSegmentIndex:tipPercentPreference];
}

@end
