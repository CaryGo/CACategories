//
//  NSString+JSMethod.h
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSMethod)

/**
 *  判断字符串是否为空
 *
 *  @return bool
 */
-(BOOL)isEmpty;

/**
 *  是不是合法的环信username  数字、字母、下划线
 *  @return
 */
- (BOOL)isValidHXUserName;

//去掉字符串中的空格
- (NSString *)trim;

/**
 *  判断字符串是否有中文
 *
 *  @return bool
 */
- (BOOL)isChinese;

/**
 *  判断字符串中是否包含emoji
 *
 *  @param string 字符串
 *
 *  @return bool
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 *  判断父串中是否包含子串
 *
 *  @param subString 子串
 *
 *  @return bool
 */
- (BOOL)isHaveSubString:(NSString *)subString;

/**
 *  删除子串
 *
 *  @param aString <#aString description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)deleteString:(NSString *)aString;

/**
 *  查询子串在父串中出现的次数
 *
 *  @param string 子串
 *
 *  @return count
 */
- (NSUInteger)checkSubStringAppearCountWithString:(NSString *)string;

/**
 *  过滤字符串
 *
 *  @param input 需要过滤的字符串
 *
 *  @return 结果 string
 */
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;

/**
 *  计算string的size (没有间距)
 *
 *  @param width 宽度
 *  @param font  字体大小
 *
 *  @return size
 */
- (CGSize)boundingRectWithWidth:(CGFloat)width
                           font:(UIFont *)font;

/**
 *  计算string的size
 *
 *  @param width 宽度
 *  @param font  字体大小
 *  @param space 字间距
 *
 *  @return size
 */
- (CGSize)boundingRectWithWidth:(CGFloat)width
                           font:(UIFont *)font
                      lineSpace:(CGFloat)space;

/**
 *  计算string的size
 *
 *  @param size       最大size
 *  @param font       字体大小
 *  @param space      间距
 *
 *  @return size
 */
- (CGSize)boundingRectWithSize:(CGSize)needSize
                          font:(UIFont *)font
                     lineSpace:(CGFloat)space;


/**
 *  计算BMI
 *
 *  @param weight 体重  kg
 *  @param height 身高  cm
 *
 *  @return bmi值
 */
+ (CGFloat)BMIWithWeight:(CGFloat)weight height:(CGFloat)height;

/**
 *  计算体重范围
 *
 *  @param height 身高 cm
 *
 *  @return 体重范围
 */
+ (NSString *)rangeOfBMIWithHeight:(CGFloat)height;

/**
 *  字典转成字符串打印
 *
 *  @param dictionary 字典
 *
 *  @return string
 */
+ (NSString *)getSplitStringWithDictionary:(NSDictionary *)dictionary;

@end
