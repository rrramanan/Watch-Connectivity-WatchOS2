//
//  ViewController.h
//  WatchDemo1
//
//  Created by MIT on 16/07/15.
//  Copyright © 2015 MIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *tf;

- (IBAction)login:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *loginprop;

- (IBAction)logout:(id)sender;



@end

