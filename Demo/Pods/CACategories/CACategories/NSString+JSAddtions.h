//
//  NSString+JSAddtions.h
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSAddtions)

/**
 *  字典转json
 *
 *  @param dictionary 字典
 *
 *  @return string
 */
+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
/**
 *  数组转json
 *
 *  @param array 数组
 *
 *  @return string
 */
+(NSString *) jsonStringWithArray:(NSArray *)array;

+(NSString *) jsonStringWithString:(NSString *) string;

+(NSString *) jsonStringWithObject:(id) object;

@end
