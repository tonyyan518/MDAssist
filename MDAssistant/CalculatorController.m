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
@synthesize arrow;

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
    [self setArrow:nil];
    [super viewDidUnload];
    [self setFirstValue:nil];
    [self setSecondValue:nil];
}

- (void)backgroundTouched {
    [self.firstValue resignFirstResponder];
    [self.secondValue resignFirstResponder];
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait |
            UIInterfaceOrientationMaskPortraitUpsideDown);
}


- (IBAction)valueChanged:(id)sender {
    //as the values of the inputs are changed, change the output image and text accordingly
    
    NSString *labelText;
    NSString *image;
    if (self.firstValue.text.length > 0 & self.secondValue.text.length > 0) {
        double first = self.firstValue.text.doubleValue;
        double second = self.secondValue.text.doubleValue;
        
        NSString *percent = @"%";
        if (first > second) {
            image = @"Arrow-Down-blue-48.png";
            double change = (first - second) / first * 100;
            labelText = [NSString stringWithFormat:@"%.1f%@", change, percent];
        }
        else if (first < second) {
            image = @"Arrow-Up-green-48.png";
            double change = (second - first) / first * 100;
            labelText = [NSString stringWithFormat:@"%.1f%@", change, percent];
        }
    }
    [self.arrow setImage:[UIImage imageNamed:image]];
    self.percentChange.text = labelText;
}

@end
