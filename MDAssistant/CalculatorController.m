//
//  CalculatorController.m
//  MDAssistant
//
//  Created by Tony Yan
//

#import "CalculatorController.h"

@interface CalculatorController ()

@end

@implementation CalculatorController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstValue.keyboardType = UIKeyboardTypeDecimalPad;
    self.secondValue.keyboardType = UIKeyboardTypeDecimalPad;
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTouched)];
    [self.view addGestureRecognizer:gestureRecognizer];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setFirstValue:nil];
    [self setSecondValue:nil];
}

- (void)backgroundTouched {
    [self.firstValue resignFirstResponder];
    [self.secondValue resignFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
