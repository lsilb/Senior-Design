//
//  ScannedSellingViewController.h
//  textBookworm
//
//  Created by Lauren Silberberg on 11/30/16.
//  Copyright © 2016 Lauren Silberberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScannedSellingViewController : UIViewController

@property (strong, nonatomic) NSString *ISBN;

@property (weak, nonatomic) IBOutlet UILabel *ISBNLabel;

@end
