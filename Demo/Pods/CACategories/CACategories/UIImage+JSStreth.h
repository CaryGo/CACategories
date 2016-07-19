//
//  UIImage+JSStreth.h
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JSStreth)

/**
 *  压缩图片 0.5
 *
 *  @param name 图片名称
 *
 *  @return image
 */
+ (UIImage *)resizedImage:(NSString *)name;

/**
 *  压缩图片 （环信的方法）
 *
 *  @param name 图片名称
 *  @param left 宽比
 *  @param top  高比
 *
 *  @return image
 */
+ (UIImage *)resizedImage:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

+(id)strethImageWith:(NSString *)imageName;

/**
 *  压缩图片
 *
 *  @param sourceImage image对象
 *  @param defineWidth 将图片压缩后图片的宽度，高度自动计算
 *
 *  @return image对象
 */
+ (UIImage *) imageCompressWithSourceImage:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

/**
 *  截取图片
 *
 *  @param image 需要截取的图片
 *  @param rect  截取图片的位置
 *
 *  @return 截取后的图片image
 */
+ ( UIImage *)getImageByCuttingImage:( UIImage *)image Rect:( CGRect )rect;

/**
 *  压缩图片
 *
 *  @param image   原图
 *  @param newSize 图片大小
 *
 *  @return image
 */
+ (UIImage*)getCutImage:(UIImage*)image scaledToSize:(CGSize)newSize;

/**
 *  调整image的方向
 *
 *  @param aImage 需要调整的image
 *
 *  @return 调整方向后的image
 */
+ (UIImage *)fixImageOrientation:(UIImage *)aImage;

/**
 *  获取截屏图片
 *
 *  @return image
 */
+ (UIImage *)imageWithScreenshot;

/**
 *  图片转Data
 *
 *  @param image image对象
 *
 *  @return data
 */
+ (NSData *)dataWithImage:(UIImage *)image;

/*
 *	@brief	压缩图片 @Fire
 *
 *	@param 	originImage 	原始图片
 *	@param 	pc 	是否进行像素压缩
 *	@param 	maxPixel 	压缩后长和宽的最大像素；pc=NO时，此参数无效。
 *	@param 	jc 	是否进行JPEG压缩
 *	@param 	maxKB 	图片最大体积，以KB为单位；jc=NO时，此参数无效。
 *
 *	@return	返回图片的NSData
 */
+ (NSData*) compressImage:(UIImage*)originImage PixelCompress:(BOOL)pc MaxPixel:(CGFloat)maxPixel JPEGCompress:(BOOL)jc MaxSize_KB:(CGFloat)maxKB;

/**
 *  判断图片的格式
 *
 *  @param data 二进制流
 *
 *  @return 图片格式
 */
+ (NSString *)typeForImageData:(NSData *)data;

@end

@interface EncodeUtil : NSObject

+ (NSString *)getMD5ForStr:(NSString *)str;
+ (UIImage *)convertImage:(UIImage *)origImage scope:(CGFloat)scope;

@end

