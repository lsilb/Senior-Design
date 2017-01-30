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
@property (weak, nonatomic) IBOutlet UITextField *school;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *repeatPassword;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.warningLabel.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addToDBWithPennKey:(NSString *)email
                 Firstname:(NSString *)firstname
                  Lastname:(NSString *)lastname
                    School:(NSString *)school
                  Password:(NSString *)password {
    if (email.length && firstname.length && lastname.length && school.length && password.length) {
        FIRDatabaseReference *ref = [[FIRDatabase database] reference];
        [[[[ref child:@"users"] child:email] child:@"firstname"] setValue:firstname];
        [[[[ref child:@"users"] child:email] child:@"lastname"] setValue:lastname];
        [[[[ref child:@"users"] child:email] child:@"school"] setValue:school];
        [[[[ref child:@"users"] child:email] child:@"password"] setValue:password];
    } else {
        self.warningLabel.hidden = NO;
    }
}

-(IBAction)signUpButtonClicked:(id)sender
{
    if (_email.text.length && _firstName.text.length && _lastName.text.length && _school.text.length &&_password.text.length && _repeatPassword.text.length) {
        if ([_password.text isEqualToString:_repeatPassword.text]) {
            [self addToDBWithPennKey:_email.text Firstname:_firstName.text Lastname:_lastName.text School:_school.text Password:_password.text];
            [self performSegueWithIdentifier:@"signUpSegue" sender:nil];
        } else {
            self.warningLabel.text = @"Passwords don't match";
            self.warningLabel.hidden = NO;
        }
    } else {
        self.warningLabel.text = @"There is a missing field!";
        self.warningLabel.hidden = NO;
    }
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
