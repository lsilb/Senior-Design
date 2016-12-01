//
//  BuyingViewController.m
//  textBookworm
//
//  Created by Lauren Silberberg on 11/28/16.
//  Copyright © 2016 Lauren Silberberg. All rights reserved.
//

#import "BuyingViewController.h"
#import "Firebase.h"


@interface BuyingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *bookTitle;
@property (weak, nonatomic) IBOutlet UITextField *authors;
@property (weak, nonatomic) IBOutlet UITextField *edition;
@property (weak, nonatomic) IBOutlet UITextField *maxPrice;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation BuyingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addToDBbooks:(NSString *)bookTitle
             Authors:(NSString *)authors
             Edition:(NSString *)edition
            MaxPrice:(NSString *)maxPrice {
    FIRDatabaseReference *ref = [[FIRDatabase database] reference];
    [[[[ref child:@"books"] child:bookTitle] child:@"authors"] setValue:authors];
    [[[[ref child:@"books"] child:bookTitle] child:@"edition"] setValue:edition];
    // Check if buyingPrices is null; if it is, create an array with the maxPrice,
    // if it isn't, add maxPrice to the existing array
    [[[[ref child:@"books"] child:bookTitle] child:@"buyingPrices"] setValue:maxPrice];
}

- (IBAction)findMyBookPressed:(id)sender {
    NSLog(@"Here");
    [self performSegueWithIdentifier:@"findmwmybook" sender:self];
    
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
