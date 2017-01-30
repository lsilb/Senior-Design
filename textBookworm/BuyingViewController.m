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
@property (weak, nonatomic) IBOutlet UILabel *missingFields;

@end

@implementation BuyingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.missingFields.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addToDBBuying:(NSString *)bookTitle
             MaxPrice:(NSString *)maxPrice {
    if (_bookTitle.text.length && _authors.text.length && _edition.text.length && _maxPrice.text.length) {
        FIRDatabaseReference *ref = [[FIRDatabase database] reference];
        [[[[ref child:@"buying"] child:bookTitle] child:@"pennKey"] setValue:maxPrice];
    } else {
        self.missingFields.hidden = NO;
    }
}

- (IBAction)findMyBookPressed:(id)sender {
    NSLog(@"Here");
    if (_bookTitle.text.length && _authors.text.length && _edition.text.length && _maxPrice.text.length) {
        [self addToDBBuying:_bookTitle.text MaxPrice:_maxPrice.text];
        [self performSegueWithIdentifier:@"findmemybook" sender:nil];
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
