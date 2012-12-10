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


- (IBAction)valueChanged:(id)sender {
    
    if (self.firstValue.text.length > 0 & self.secondValue.text.length > 0) {
        double first = self.firstValue.text.doubleValue;
        double second = self.secondValue.text.doubleValue;
        NSString *labelText;
        NSString *percent = @"%";
        if (first > second) {
            double change = (first - second) / first * 100;
            labelText = [NSString stringWithFormat:@"Decreased %.1f%@", change, percent];
            self.percentChange.text = labelText;
        }
        else if (first < second) {
            double change = (second - first) / first * 100;
            labelText = [NSString stringWithFormat:@"Increased %.1f%@", change, percent];
            self.percentChange.text = labelText;
        }
    }
    else {
        
    }
}

@end
