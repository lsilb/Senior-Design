//
//  ManualSellingViewController.m
//  textBookworm
//
//  Created by Lauren Silberberg on 11/30/16.
//  Copyright © 2016 Lauren Silberberg. All rights reserved.
//

#import "ManualSellingViewController.h"
#import "Firebase.h"

@interface ManualSellingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *bookTitle;
@property (weak, nonatomic) IBOutlet UITextField *authors;
@property (weak, nonatomic) IBOutlet UITextField *edition;
@property (weak, nonatomic) IBOutlet UITextField *isbn;
@property (weak, nonatomic) IBOutlet UITextField *minPrice;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (weak, nonatomic) IBOutlet UILabel *missingFields;

@end

@implementation ManualSellingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.missingFields.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addToDBSelling:(NSString *)ISBN
              MinPrice:(NSString *)minPrice {
    if (_bookTitle.text.length && _authors.text.length && _edition.text.length && _isbn.text.length && _minPrice.text.length) {
        FIRDatabaseReference *ref = [[FIRDatabase database] reference];
        [[[[ref child:@"selling"] child:ISBN] child:@"pennKey"] setValue:minPrice];
    } else {
        self.missingFields.hidden = NO;
    }
}

- (IBAction)sellMyBookPressed:(id)sender {
    NSLog(@"Here");
    if (_bookTitle.text.length && _authors.text.length && _edition.text.length && _isbn.text.length && _minPrice.text.length) {
        [self addToDBSelling:_isbn.text MinPrice:_minPrice.text];
        [self performSegueWithIdentifier:@"sellmybookmanual" sender:nil];
    } else {
        self.missingFields.hidden = NO;
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
