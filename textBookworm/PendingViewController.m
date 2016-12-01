//
//  PendingViewController.m
//  textBookworm
//
//  Created by Lauren Silberberg on 11/30/16.
//  Copyright © 2016 Lauren Silberberg. All rights reserved.
//

#import "PendingViewController.h"

@interface PendingViewController ()

@end

@implementation PendingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToUpload:(id)sender {
    NSLog(@"Here");
    [self performSegueWithIdentifier:@"backtouploads" sender:self];
    
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
