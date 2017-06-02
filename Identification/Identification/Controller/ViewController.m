//
//  ViewController.m
//  Identification
//
//  Created by 郭奕增 on 2017/6/1.
//  Copyright © 2017年 郭奕增. All rights reserved.
//

#import "ViewController.h"
#import "DataBaseHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [DataBaseHelper openDataBase];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
