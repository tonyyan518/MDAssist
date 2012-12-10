//
//  SecondViewController.h
//  MDAssistant
//
//  Created by Tony Yan
//

#import <UIKit/UIKit.h>

@interface SettingsController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *uniqueIDText;
@property (weak, nonatomic) IBOutlet UITextField *cellNumberText;
@property (weak, nonatomic) IBOutlet UITextField *pagerNumberText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *securityText;
@property (weak, nonatomic) IBOutlet UIScrollView *inputScroll;

- (IBAction)textfieldReturn:(id)sender;
- (IBAction)saveData:(id)sender;

@end
