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
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;

@end

@implementation LoginViewController
- (IBAction)didPressSignUp:(id)sender {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.warningLabel.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginPressed:(id)sender {
    NSLog(@"EMAIL: %@", self.email.text);
    FIRDatabaseReference *ref = [[FIRDatabase database] reference];
    [[ref child:@"users"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        // Get user value
        if (snapshot) {
            NSLog(@"snapshot: %@", snapshot);
            if (snapshot.value[self.email.text]) {
                [self authenticateUser];
            } else {
                NSLog(@"USER NOT FOUND!!!");
                self.warningLabel.hidden = NO;
            }
        } else {
            NSLog(@"No users found.");
            self.warningLabel.hidden = NO;
        }
        
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)authenticateUser {
    FIRDatabaseReference *ref = [[FIRDatabase database] reference];
    [[[ref child:@"users"] child:self.email.text] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        // Get user value
        if (snapshot) {
            [self validatePassword];
        } else {
            NSLog(@"USER NOT FOUND!!!");
            self.warningLabel.hidden = NO;
        }
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)validatePassword {
    FIRDatabaseReference *ref = [[FIRDatabase database] reference];
    [[[ref child:_email.text] child:self.password.text] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [self performSegueWithIdentifier:@"login" sender:self];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
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
