//
//  UserService.h
//  Identification
//
//  Created by 郭奕增 on 2017/6/2.
//  Copyright © 2017年 郭奕增. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "sqlite3.h"
@interface UserService : NSObject

-(User *)getIDNumByPhoneNum:(NSString *)phoneNum andDataBase:(sqlite3 *)databse;
@end
