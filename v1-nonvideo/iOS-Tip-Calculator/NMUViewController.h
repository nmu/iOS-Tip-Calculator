//
//  NMUViewController.h
//  iOS-Tip-Calculator
//
//  Created by Ni Mu on 12/17/13.
//  Copyright (c) 2013 Ni Mu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMUViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *subtotalBill;
@property (weak, nonatomic) IBOutlet UITextField *tipPercent;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalBill;

- (IBAction)onTipPercentEditDidEnd:(id)sender;
- (IBAction)onSubtotalEditDidEnd:(id)sender;
@end
