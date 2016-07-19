//
//  NSDateFormatter+JSCategory.h
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (JSCategory)
+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/
@end
