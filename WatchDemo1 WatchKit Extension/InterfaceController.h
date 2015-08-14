//
//  InterfaceController.h
//  WatchDemo1 WatchKit Extension
//
//  Created by MIT on 16/07/15.
//  Copyright © 2015 MIT. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfacePicker *picker1;
- (IBAction)pickerAciton:(NSInteger)value;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label1;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label2;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label3;



@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *picker2;
- (IBAction)pickerAction1:(NSInteger)value;


@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *picker3;

- (IBAction)pickerAction2:(NSInteger)value;

- (IBAction)show2;

- (IBAction)show3;

- (IBAction)show4;

- (IBAction)reset;

- (IBAction)submit;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *absprop;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *timeprop;

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *dateprop;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *loginLabel1;

@property (strong, nonatomic) IBOutlet WKInterfaceButton *submitprop;

@property (strong, nonatomic) IBOutlet WKInterfaceButton *resetprop;





@end
