//
//  DataBaseHelper.m
//  Identification
//
//  Created by 郭奕增 on 2017/6/1.
//  Copyright © 2017年 郭奕增. All rights reserved.
//

#import "DataBaseHelper.h"
#import "sqlite3.h"
//数据库帮助类
@implementation DataBaseHelper

//打开数据库
+(sqlite3 *)openDataBase{
    sqlite3 *database = nil;
    NSString *dbDir = @"DataBase";
    NSString *dbName = @"shenfenzheng.db";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取沙盒目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取Document目录
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //获取数据库保存的目录
    NSString *dataBasePath = [documentsDirectory stringByAppendingPathComponent:dbDir];
    //目录是否存在
    BOOL isDBDirExist = [fileManager fileExistsAtPath:dataBasePath];
    BOOL isDBFileExist = false;
    NSString *dbFilePath = nil;
    //如果不存在就新建目录
    if (!isDBDirExist) {
        [fileManager createDirectoryAtPath:dataBasePath withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        dbFilePath = [dataBasePath stringByAppendingPathComponent:dbName];
        isDBFileExist = [fileManager fileExistsAtPath:dbFilePath];
    }
    //获取项目中DataBase文件中的数据库文件
    NSString *defaultPath = [[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:dbDir] stringByAppendingPathComponent:dbName];
    //是否存在
    BOOL isDefaultDirExist = [fileManager fileExistsAtPath:defaultPath];
    
    BOOL isSuccess = false;
    NSError* error=nil;
    //如果原数据库文件存在，复制文件到沙盒的DataBase目录中
    if (isDefaultDirExist && !isDBFileExist) {
        isSuccess = [fileManager copyItemAtPath:defaultPath toPath:dbFilePath error:&error];
        NSLog(@"复制数据库失败,%@",error);
    } else{
        isSuccess = true;
    }
    //如果复制成功或者已经存在，打开数据库
    if (isSuccess) {
        //调用sqlite3的库，打开数据库
        int databaseResult = sqlite3_open([dbFilePath UTF8String], &database);
        //返回是否打开成功
        if (databaseResult == SQLITE_OK) {
            NSLog(@"打开数据库成功");
        } else{
            NSLog(@"打开数据库失败");
        }

    }
    return database;
    
}

//关闭数据库
+(void)closeDataBase:(sqlite3 *) database{
    if (database != nil) {
        //关闭数据库
        int databaseResult = sqlite3_close(database);
        if (databaseResult == SQLITE_OK) {
            NSLog(@"关闭数据库成功");
        } else{
            NSLog(@"关闭数据库失败");
        }
        database = nil;
    }
}
@end
