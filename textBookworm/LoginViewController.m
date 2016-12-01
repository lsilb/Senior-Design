//
//  LoginViewController.m
//  textBookworm
//
//  Created by Lauren Silberberg on 11/28/16.
//  Copyright © 2016 Lauren Silberberg. All rights reserved.
//

#import "LoginViewController.h"
#import "Firebase.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController
- (IBAction)didPressSignUp:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginPressed:(id)sender {
    //DO work for checkin log in
    //NSString *inputtedEmail = self.email.text;
    NSLog(@"Here");
    [self performSegueWithIdentifier:@"login" sender:self];
    
}

- (IBAction)signupPressed:(id)sender {
    NSLog(@"Here");
    [self performSegueWithIdentifier:@"signuppage" sender:self];
    
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
