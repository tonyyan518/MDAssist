//
//  CalculatorController.h
//  MDAssistant
//
//  Created by Tony Yan
//

#import <UIKit/UIKit.h>

@interface CalculatorController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstValue;
@property (weak, nonatomic) IBOutlet UITextField *secondValue;
@property (weak, nonatomic) IBOutlet UILabel *percentChange;

@end
