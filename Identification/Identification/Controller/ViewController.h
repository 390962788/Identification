//
//  ViewController.h
//  Identification
//
//  Created by 郭奕增 on 2017/6/1.
//  Copyright © 2017年 郭奕增. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tfPhoneNum;
@property (weak, nonatomic) IBOutlet UILabel *lbIDNum;
@property (weak, nonatomic) IBOutlet UIButton *btQuery;
- (IBAction)getIDNumByPhoneNum:(id)sender;

@end

