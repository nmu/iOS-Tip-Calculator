//
//  SettingsViewController.m
//  Tip-Calculator
//
//  Created by Ni Mu on 12/19/13.
//  Copyright (c) 2013 Ni Mu. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
- (IBAction)changeDefaultTipPercent:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipPercentPreference = [defaults integerForKey:@"tipPercentPreference"];
    [self.defaultTipControl setSelectedSegmentIndex:tipPercentPreference];
}

- (IBAction)changeDefaultTipPercent:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"tipPercentPreference"];
    [defaults synchronize];
}
@end
