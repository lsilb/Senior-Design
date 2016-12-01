//
//  ScannerViewController.m
//  textBookworm
//
//  Created by Lauren Silberberg on 11/30/16.
//  Copyright © 2016 Lauren Silberberg. All rights reserved.
//

#import "ScannerViewController.h"
#import "MTBBarcodeScanner.h"
#import "ScannedSellingViewController.h"

@interface ScannerViewController ()

@property MTBBarcodeScanner *scanner;

@end

@implementation ScannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scanner = [[MTBBarcodeScanner alloc] initWithPreviewView:self.view];
    
    [MTBBarcodeScanner requestCameraPermissionWithSuccess:^(BOOL success) {
        if (success) {
            
            NSError *error = nil;
            [self.scanner startScanningWithResultBlock:^(NSArray *codes) {
                AVMetadataMachineReadableCodeObject *code = [codes firstObject];
                NSLog(@"Found code: %@", code.stringValue);
                
                [self.scanner stopScanning];
                
                
                // add segue
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self performSegueWithIdentifier:@"SuccessSegue" sender:code.stringValue];
                });
                
            } error:&error];
            
        } else {
            // The user denied access to the camera
        }
    }];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ScannedSellingViewController class]]) {
        ScannedSellingViewController *destinationController = (ScannedSellingViewController *)segue.destinationViewController;
        [destinationController setISBN:(NSString *)sender];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
