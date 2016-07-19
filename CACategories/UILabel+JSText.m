//
//  UILabel+JSText.m
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import "UILabel+JSText.h"

@implementation UILabel (JSText)

//设置字体和颜色
+ (void)setZSCLabelFontAndColorWithLabel:(UILabel *)label andTextFontSize:(NSInteger)fontSize andColor:(UIColor *)color andRange:(NSRange)range
{
    NSMutableAttributedString*attributedString=[[NSMutableAttributedString alloc]initWithString: label.text];
    NSDictionary*dic=@{
                       NSForegroundColorAttributeName:color,
                       NSFontAttributeName:[UIFont systemFontOfSize:fontSize]
                       };
    [attributedString addAttributes:dic range:range];
    [label setAttributedText:attributedString];
}

//下划线
+ (void)setZSCUnderlineWithLabel:(UILabel *)label andTextFontSize:(NSInteger)fontSize andColor:(UIColor *)color andRange:(NSRange)range
{
    NSMutableAttributedString*attributedString=[[NSMutableAttributedString alloc]initWithString: label.text];
    NSDictionary*dic=@{
                       NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                       NSForegroundColorAttributeName:color,
                       NSFontAttributeName:[UIFont systemFontOfSize:fontSize]
                       };
    [attributedString addAttributes:dic range:range];
    [label setAttributedText:attributedString];
}

//设置删除线
+ (void)setZSCStrickoutWithLabel:(UILabel *)label andTextFontSize:(NSInteger)fontSize andColor:(UIColor *)color andRange:(NSRange)range
{
    NSMutableAttributedString*attributedString=[[NSMutableAttributedString alloc]initWithString: label.text];
    NSDictionary*dic=@{
                       NSStrikethroughStyleAttributeName:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle),
                       NSForegroundColorAttributeName:color,
                       NSFontAttributeName:[UIFont systemFontOfSize:fontSize]
                       };
    [attributedString addAttributes:dic range:range];
    [label setAttributedText:attributedString];
}

//设置两端对齐
+ (void)setZSCNSTextAlignmentJustifiedWithLabel:(UILabel *)label andFirstLineHeadIndent:(CGFloat)width
{
    //设定内容样式
    NSMutableAttributedString * attributedString =
    [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentJustified;
    //首行头缩进
    paragraphStyle.firstLineHeadIndent = width;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          paragraphStyle, NSParagraphStyleAttributeName ,
                          [NSNumber numberWithFloat:0],NSBaselineOffsetAttributeName,
                          nil];
    [attributedString addAttributes:dict range:NSMakeRange(0 , [attributedString length])];
    [label setAttributedText:attributedString];
}

//获取字符串高度
+ (CGFloat)getZSCTextHight:(NSString *)textStr andWidth:(CGFloat)width andTextFontSize:(NSInteger)fontSize
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [textStr boundingRectWithSize:CGSizeMake(width, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.height;
}

//获取字符串宽度
+ (CGFloat)getZSCTextWidth:(NSString *)textStr andHeight:(CGFloat)height andTextFontSize:(NSInteger)fontSize
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [textStr boundingRectWithSize:CGSizeMake(0, height) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.width;
}

//设置Label的行间距
+ (void)setGJSLabelLineSpaceWithLabel:(UILabel *)label andTextLineSpace:(CGFloat)space{
    if (label.text) {
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:label.text];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:space];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [label.text length])];
        [label setAttributedText:attributedString1];
        [label sizeToFit];
        attributedString1 = nil;
        paragraphStyle1 = nil;
    }
}

@end
