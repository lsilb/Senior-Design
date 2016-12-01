//
//  SignUpViewController.m
//  textBookworm
//
//  Created by Lauren Silberberg on 11/28/16.
//  Copyright © 2016 Lauren Silberberg. All rights reserved.
//

#import "SignUpViewController.h"
#import "Firebase.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *repeatPassword;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    // [self addToDBWithEmail:@"email" Firstname:@"Lauren" Lastname:@"Silberberg" Password:@"password"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addToDBWithEmail:(NSString *)email
               Firstname:(NSString *)firstname
                Lastname:(NSString *)lastname
                Password:(NSString *)password {
    FIRDatabaseReference *ref = [[FIRDatabase database] reference];
    [[[[ref child:@"users"] child:email] child:@"firstname"] setValue:firstname];
    [[[[ref child:@"users"] child:email] child:@"lastname"] setValue:lastname];
    [[[[ref child:@"users"] child:email] child:@"password"] setValue:password];
}

// Need to check if passwords match
-(IBAction)signUpButtonClicked:(id)sender
{
    [self addToDBWithEmail:_email.text Firstname:_firstName.text Lastname:_lastName.text
                      Password:_password.text];
    
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
