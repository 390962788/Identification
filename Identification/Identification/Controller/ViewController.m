//
//  ViewController.m
//  Identification
//
//  Created by 郭奕增 on 2017/6/1.
//  Copyright © 2017年 郭奕增. All rights reserved.
//

#import "ViewController.h"
#import "DataBaseHelper.h"
#import "sqlite3.h"
#import "UserService.h"
#import "User.h"
@interface ViewController ()

@end

@implementation ViewController

sqlite3 *database;
UserService *userService;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    database = [DataBaseHelper openDataBase];
    userService = [[UserService alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getIDNumByPhoneNum:(id)sender {
    NSString *phoneNum = _tfPhoneNum.text;
    if (phoneNum == nil) {
        
        return;
    }
    
    User *user = [userService getIDNumByPhoneNum:phoneNum andDataBase:database];
    _lbIDNum.text = user.card_code;
}

-(void)viewDidUnload{
    [DataBaseHelper closeDataBase:database];
}
@end
