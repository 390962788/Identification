//
//  UserService.m
//  Identification
//
//  Created by 郭奕增 on 2017/6/2.
//  Copyright © 2017年 郭奕增. All rights reserved.
//

#import "UserService.h"
#import "User.h"
#import "sqlite3.h"
#import "DataBaseHelper.h"
@implementation UserService


-(User *)getIDNumByPhoneNum:(NSString *)phoneNum andDataBase:(sqlite3 *)databse{
    
    // 定义SQL文
    sqlite3_stmt *stmt;
    NSString *sql = @"SELECT BILL_ID,CARD_CODE FROM shenfenzheng WHERE BILL_ID=%@";
    NSString *sqlStr = [NSString stringWithFormat:sql, phoneNum];
    if (sqlite3_prepare_v2(databse, [sqlStr UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            char *bill_id = (char*)sqlite3_column_text(stmt, 0);
            NSString *bill_id_str = [[NSString alloc]initWithUTF8String:bill_id];
            
            char *card_code = (char*)sqlite3_column_text(stmt, 1);
            NSString *card_code_str = [[NSString alloc]initWithUTF8String:card_code];
            
            User *user = [[User alloc] init];
            user.bill_id = bill_id_str;
            user.card_code = card_code_str;
            // 释放资源
            sqlite3_finalize(stmt);
            return user;
        }
    }
    return nil;
}
@end
