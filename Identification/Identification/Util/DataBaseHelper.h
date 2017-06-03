//
//  DataBaseHelper.h
//  Identification
//
//  Created by 郭奕增 on 2017/6/1.
//  Copyright © 2017年 郭奕增. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface DataBaseHelper : NSObject

+(sqlite3 *)openDataBase;
+(void)closeDataBase:(sqlite3 *)database;
@end
