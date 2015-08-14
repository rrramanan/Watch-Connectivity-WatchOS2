//
//  InterfaceController.m
//  WatchDemo1 WatchKit Extension
//
//  Created by MIT on 16/07/15.
//  Copyright © 2015 MIT. All rights reserved.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface InterfaceController() <WCSessionDelegate>

@end


@implementation InterfaceController
NSArray *pickeritems ;
NSArray *pickeritems1 ;
NSArray *pickeritems2 ;
NSArray *alertcatch;
NSArray *alertcatch1;
NSString *str1;
NSString *str2;
NSString *str3;
NSString *strtotal;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    NSLog(@"CONTEXT IS %@",context);
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    NSLog(@"ENTER");
    
   
    
    [_loginLabel1 setHidden:TRUE];
    
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate=self;
        [session activateSession];
        
    }
    NSDictionary *auth = @{@"request":@"login"};
    
    
    [[WCSession defaultSession]sendMessage:auth replyHandler:^(NSDictionary *reply){
        
        
        NSString *str = [NSString stringWithFormat:@"%@",[reply objectForKey:@"response"]];
        
        
        if ([str isEqualToString:@"true"]) {
            
            NSLog(@"replyHandelr ** its TRUE");
            [_loginLabel1 setHidden:TRUE];
            
            
            [_label1 setHidden:FALSE];
            [_label2 setHidden:FALSE];
            [_label3 setHidden:FALSE];
            
            
            
            [_absprop setHidden:FALSE];
            [_resetprop setHidden:FALSE];
            [_submitprop setHidden:FALSE];
            [_timeprop setHidden:FALSE];
            [_dateprop setHidden:FALSE];
            
            
            
        }else{
            NSLog(@"replyHandelr ** its FALSE");
            
            [_loginLabel1 setHidden:FALSE];
            
            
            
            [_label1 setHidden:TRUE];
            [_label2 setHidden:TRUE];
            [_label3 setHidden:TRUE];
            
            
            [_picker1 setHidden:TRUE];
            [_picker2 setHidden:TRUE];
            [_picker3 setHidden:TRUE];
            
            [_absprop setHidden:TRUE];
            [_resetprop setHidden:TRUE];
            [_submitprop setHidden:TRUE];
            [_timeprop setHidden:TRUE];
            [_dateprop setHidden:TRUE];
            
            
        }
        
        
    }
     
                              errorHandler:^(NSError *error){
                                  
                              }];
    

    
   pickeritems = [[NSArray alloc]init];
    pickeritems1 = [[NSArray alloc]init];
    pickeritems2 = [[NSArray alloc]init];
    alertcatch = [[NSArray alloc]init];
    alertcatch1 = [[NSArray alloc]init];
    //  NSMutableArray *items = [[NSMutableArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four", nil];

    //   WKPickerItem *item = [[WKPickerItem alloc] init];
  
    WKPickerItem *iOS = [[WKPickerItem alloc] init];
    iOS.title = @"iOS";
    
    WKPickerItem *macOSX = [[WKPickerItem alloc] init];
    macOSX.title = @"Andriod";
    
    WKPickerItem *watchOS = [[WKPickerItem alloc] init];
    watchOS.title = @"Windows10";
    
    
    //  [_picker setItems:self.pickerItems];
    
    
    //PICKER 2
    
    WKPickerItem *iOS1 = [[WKPickerItem alloc] init];
    iOS1.title = @"Apple";
    
    
    WKPickerItem *macOSX1 = [[WKPickerItem alloc] init];
    macOSX1.title = @"Google";
    
    
    WKPickerItem *watchOS1 = [[WKPickerItem alloc] init];
    watchOS1.title = @"Microsoft";
    
    
    // PICKER 3
    
    WKPickerItem *iOS2 = [[WKPickerItem alloc] init];
    iOS2.title = @"Friday";
    
    
    WKPickerItem *macOSX2 = [[WKPickerItem alloc] init];
    macOSX2.title = @"Saturday";
    
    
    WKPickerItem *watchOS2 = [[WKPickerItem alloc] init];
    watchOS2.title = @"Sunday";
    
    
    pickeritems = @[iOS, macOSX, watchOS];
    pickeritems1 =@[iOS1,macOSX1,watchOS1];
    pickeritems2 =@[iOS2,macOSX2,watchOS2];
    

    
    
    [_picker1 setItems:pickeritems];
    
    
    [_picker2 setItems:pickeritems1];
    
    
    [_picker3 setItems:pickeritems2];
    
    
    
    [_picker1 setHidden:TRUE];
    [_picker2 setHidden:TRUE];
    [_picker3 setHidden:TRUE];
    
   
    
    
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (IBAction)pickerAciton:(NSInteger)value {
    
    
    
    
    WKPickerItem *display = pickeritems[value];
    
 //   [_label1 setText:display.title];
    
    [_dateprop setTitle:display.title];
    
    str1 = display.title;
    NSLog(@"STR 1 %@",str1);
    
    
}
- (IBAction)pickerAction1:(NSInteger)value {
    
    
    
  
    
    WKPickerItem *display1 = pickeritems1[value];
    
  //  [_label2 setText:display1.title];
    
    [_timeprop setTitle:display1.title];
    str2 = display1.title;
    NSLog(@"STR 2 %@",str2);
    
    
}
- (IBAction)pickerAction2:(NSInteger)value {
    
    
    
    

    WKPickerItem *display2 = pickeritems2[value];

  //  [_label3 setText:display2.title];

     [_absprop setTitle:display2.title];
    
    str3 = display2.title;
    NSLog(@"STR 3 %@",str3);
    
    
    
}

- (IBAction)show2 {
    
    
    
    
   
    
    [_picker1 setHidden:FALSE];
    
    [_picker2 setHidden:TRUE];
    [_picker3 setHidden:TRUE];
    
    
    

}

- (IBAction)show3 {
    
    
  
    
    [_picker2 setHidden:FALSE];
    
    
    [_picker1 setHidden:TRUE];
    [_picker3 setHidden:TRUE];
    
    
}

- (IBAction)show4 {
    
    
    
 
    
    [_picker3 setHidden:FALSE];
    
    [_picker1 setHidden:TRUE];
    [_picker2 setHidden:TRUE];
    
   
    
}

- (IBAction)reset {
    
    
   
    WKAlertAction *action1 = [WKAlertAction actionWithTitle:@"Yes" style:WKAlertActionStyleDefault handler:^(void) {
        
        [self dismissController];
        
    }];
    
    
    WKAlertAction *action2 = [WKAlertAction actionWithTitle:@"No" style:WKAlertActionStyleCancel handler:^(void) {
        
        [self dismissController];
        
    }];
    
    
    
    WKAlertAction *action3 = [WKAlertAction actionWithTitle:@"CANCEL" style:WKAlertActionStyleDestructive handler:^(void) {
        
        [self dismissController];
        
    }];
    
    
    alertcatch = @[action1,action2,action3];
    
    [self presentAlertControllerWithTitle:nil message:@"Action Sheet" preferredStyle:WKAlertControllerStyleActionSheet actions:alertcatch]; //change

 
}

- (IBAction)submit {

   
    
    
    strtotal = @"";
    
    
    strtotal = [NSString stringWithFormat:@"Picker1:%@\nPicker2:\t%@\nPicker3:%@",str1,str2,str3];
    
    
    
    WKAlertAction *action1 = [WKAlertAction actionWithTitle:@"Yes" style:WKAlertActionStyleDefault handler:^(void) {
        
        WKAlertAction *sumbit = [WKAlertAction actionWithTitle:@"Ok" style:WKAlertActionStyleCancel handler:^(void){
            
            [self dismissController];
        }];
        
        alertcatch1 =@[sumbit];
        
        [self presentAlertControllerWithTitle:nil message:@"All Done" preferredStyle:WKAlertControllerStyleAlert actions:alertcatch1];
        
        
    }];
    
    WKAlertAction *action2 = [WKAlertAction actionWithTitle:@"No" style:WKAlertActionStyleCancel handler:^(void) {
        
        [self dismissController];
        
    }];
    
    
    alertcatch = @[action1,action2];
    
    [self presentAlertControllerWithTitle:nil message:strtotal preferredStyle:WKAlertControllerStyleAlert actions:alertcatch]; //change
}


-(void)session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *,id> *)message replyHandler:(nonnull void (^)(NSDictionary<NSString *,id> * __nonnull))replyHandler{
    
     NSLog(@"did receive from parent !");
    
    
    if ([[message objectForKey:@"login"]isEqualToString:@"true"]) {
        
        NSLog(@"Match TRUE from parent ! ");
        
        [_loginLabel1 setHidden:TRUE];
        
        
        [_label1 setHidden:FALSE];
        [_label2 setHidden:FALSE];
        [_label3 setHidden:FALSE];
        
        
        //[_picker1 setHidden:FALSE];
        // [_picker2 setHidden:FALSE];
        // [_picker3 setHidden:FALSE];
        
        [_absprop setHidden:FALSE];
        [_resetprop setHidden:FALSE];
        [_submitprop setHidden:FALSE];
        [_timeprop setHidden:FALSE];
        [_dateprop setHidden:FALSE];
        
        
        
        
    }//if
    
    if ([[message objectForKey:@"login"]isEqualToString:@"false"]) {
        
        NSLog(@"Match FALSE from parent ! ");
        
        
        [_loginLabel1 setHidden:FALSE];
        
        
        
        [_label1 setHidden:TRUE];
        [_label2 setHidden:TRUE];
        [_label3 setHidden:TRUE];
        
        
        [_picker1 setHidden:TRUE];
        [_picker2 setHidden:TRUE];
        [_picker3 setHidden:TRUE];
        
        [_absprop setHidden:TRUE];
        [_resetprop setHidden:TRUE];
        [_submitprop setHidden:TRUE];
        [_timeprop setHidden:TRUE];
        [_dateprop setHidden:TRUE];
        
        
        
    }//if
    
}

@end



