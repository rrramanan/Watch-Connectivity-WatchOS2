//
//  ViewController.m
//  WatchDemo1
//
//  Created by MIT on 16/07/15.
//  Copyright © 2015 MIT. All rights reserved.
//

#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface ViewController ()<WCSessionDelegate>

@end

@implementation ViewController
bool checklogin;
NSString *towatch;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([WCSession isSupported]) {
        
        WCSession *session = [WCSession defaultSession];
        session.delegate=self;
        [session activateSession];
    
    }

    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    
    NSString *tfstatus;
    
    
    tfstatus = _tf.text;
    
    
    NSLog(@"tf log ! %@",tfstatus);
    
    
    if ([tfstatus isEqualToString:@"yes"]) {
        
        NSLog(@"STRING MATCH FOUND");
        
        checklogin=TRUE;
        
        NSLog(checklogin ? @"Yes" : @"No");
        
        towatch = [NSString  stringWithFormat:@"%@",checklogin ? @"Yes" : @"No"];
        
        NSLog(@"BOOL IN STRING %@",towatch);
        

        
        NSDictionary *auth = @{@"login":@"true"};
        
        [[WCSession defaultSession]sendMessage:auth replyHandler:^(NSDictionary *reply){
            
        }
                                  errorHandler:^(NSError *error){
                                      
                                  }];

        
        
        
    }else{
        NSLog(@"STRING MATCH NOT^ FOUND");
        
        checklogin =FALSE;
        
        NSLog(checklogin ? @"Yes" : @"No");
        
         towatch = [NSString  stringWithFormat:@"%@",checklogin ? @"Yes" : @"No"];
        
        NSLog(@"BOOL IN STRING NO %@",towatch);
        
        

        
        
        NSDictionary *auth = @{@"login":@"false"};
        
        [[WCSession defaultSession]sendMessage:auth replyHandler:^(NSDictionary *reply){
            
        }
                                  errorHandler:^(NSError *error){
                                      
                                  }];

        
        
    }

   
    

    
    
    
    
}




-(void)session:(nonnull WCSession *)session didReceiveMessage:(nonnull NSDictionary<NSString *,id> *)message replyHandler:(nonnull void (^)(NSDictionary<NSString *,id> * __nonnull))replyHandler{
    
    NSLog(@"did receive !");
    
    
    if ([[message objectForKey:@"request"]isEqualToString:@"login"]) {
        
        NSLog(@"Match");
        
        
        if (checklogin == TRUE) {
            
            NSLog(@"TRUE");

            NSDictionary *truevalue = @{@"response":@"true"};
           
            replyHandler(truevalue);
            
        }else{
            
            NSLog(@"FALSE");

            NSDictionary *falsvalue = @{@"response":@"false"};
            
            replyHandler(falsvalue);
            
        }
        
        
    }//if
    
    
    
}

-(void)session:(nonnull WCSession *)session didReceiveApplicationContext:(nonnull NSDictionary<NSString *,id> *)applicationContext {
    NSLog(@"didReceiveApplicationContext");
    
    
}

- (IBAction)logout:(id)sender {
    
    NSLog(@"Logout button");
    
    checklogin =FALSE;
    
    NSLog(checklogin ? @"Yes" : @"No");
    
    towatch = [NSString  stringWithFormat:@"%@",checklogin ? @"Yes" : @"No"];
    
    NSLog(@"BOOL IN STRING NO %@",towatch);
    
    
        
    
    NSDictionary *auth = @{@"login":@"false"};
    
    [[WCSession defaultSession]sendMessage:auth replyHandler:^(NSDictionary *reply){
        
    }
                              errorHandler:^(NSError *error){
                                  
                              }];
    

    
    
}
@end
