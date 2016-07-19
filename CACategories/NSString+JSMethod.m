//
//  NSString+JSMethod.m
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//


#import "NSString+JSMethod.h"

@implementation NSString (JSMethod)

- (BOOL)isValidHXUserName{
    NSString *regex = @"^[0-9a-zA-Z_]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:self] == YES)
    {
        return YES;
    }
    return NO;
}

-(BOOL)isEmpty{
    if (![self isEqual:[NSNull null]] && self && [self trim].length > 0 && self != nil) {
        return NO;
    }
    return YES;
}
- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)isChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (NSString *)deleteString:(NSString *)aString{
    if ([self isHaveSubString:aString]) {
        return [self stringByReplacingOccurrencesOfString:aString withString:@""];
    }
    return self;
}

- (BOOL)isHaveSubString:(NSString *)subString{
    BOOL isHave = NO;
    if (self) {
        if ([self rangeOfString:subString].location != NSNotFound) {
            isHave = YES;
        }
    }
    return isHave;
}

- (NSUInteger)checkSubStringAppearCountWithString:(NSString *)string{
    NSUInteger count = 0;
    if (self) {
        if (self.length >= string.length) {
            for (int i = 0; i < self.length - string.length + 1; i++) {
                
                if ([[self substringWithRange:NSMakeRange(i, string.length)] isEqualToString:string]) {
                    count++;
                }
            }
        }
    }
    return count;
}

+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString*
    outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                             NULL, /* allocator */
                                                                             (__bridge CFStringRef)input,
                                                                             NULL, /* charactersToLeaveUnescaped */
                                                                             (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                             kCFStringEncodingUTF8);
    return outputStr;
}

+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block NSInteger returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

- (CGSize)boundingRectWithWidth:(CGFloat)width font:(UIFont *)font
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize retSize;
    if (IOS7_OR_LATER) {
        retSize = [self boundingRectWithSize:CGSizeMake(width, 0)
                                            options:\
                          NSStringDrawingTruncatesLastVisibleLine |
                          NSStringDrawingUsesLineFragmentOrigin |
                          NSStringDrawingUsesFontLeading
                                         attributes:attribute
                                            context:nil].size;
    }else{
//        retSize  = [self sizeWithFont:font constrainedToSize:CGSizeMake(width, 0) lineBreakMode:NSLineBreakByCharWrapping];
    }
    return retSize;
}

- (CGSize)boundingRectWithWidth:(CGFloat)width font:(UIFont *)font lineSpace:(CGFloat)space{
    CGSize textBlockMinSize = {width, 0};
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];//调整行间距
    
    CGSize size = [self boundingRectWithSize:textBlockMinSize options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{
                                               NSFontAttributeName:font,
                                               NSParagraphStyleAttributeName:paragraphStyle
                                               }
                                     context:nil].size;
    paragraphStyle = nil;
    return size;
}

- (CGSize)boundingRectWithSize:(CGSize)needSize
                          font:(UIFont *)font
                     lineSpace:(CGFloat)space{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];//调整行间距
    CGSize size = [self boundingRectWithSize:needSize options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle
                                               }
                                     context:nil].size;
    paragraphStyle = nil;
    return size;
}

+ (CGFloat)BMIWithWeight:(CGFloat)weight height:(CGFloat)height{
    //将身高转换成m
    //体质指数（BMI）=体重（kg）÷身高^2（m）
    height = height*0.01;
    CGFloat BMI = weight/(height*height);
    return BMI;
}

+ (NSString *)rangeOfBMIWithHeight:(CGFloat)height{
    height = height*0.01;
    /**
     *  过轻：低于18.5
     正常：18.5-24.99
     过重：25-28
     肥胖：28-32
     非常肥胖, 高于32
     */
    CGFloat min = 18.5 * (height * height);
    CGFloat max = 24.99 * (height * height);
    NSString * result = [NSString stringWithFormat:@"%.1f-%.1fkg",min,max];
    return result;
}

+ (NSString *)getSplitStringWithDictionary:(NSDictionary *)dictionary{
    NSMutableString *string=[NSMutableString string];
    if (dictionary) {
        NSArray *arr = [dictionary allKeys];
        arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            NSComparisonResult result = [obj1 compare:obj2];
            return result == NSOrderedDescending;
        }];
        
        //0.4 通过数组的每个值，将字典中的键值对打印出来
        for(id obj in arr){
            if ([obj isKindOfClass:[NSString class]]) {
                NSString * str = (NSString *)obj;
                [string appendString:[NSString stringWithFormat:@"%@=%@\n",str,dictionary[str]]];
            }
        }
    }
    return string;
}

@end
