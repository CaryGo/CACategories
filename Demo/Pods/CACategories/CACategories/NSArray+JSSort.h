//
//  NSArray+JSSort.h
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JSSort)

/**
 *  根据indexpPath大小按降序排序
 *
 *  @param array 需要排序的数组
 *
 *  @return 排序结果
 */
+ (NSArray *)lowSortArrayWithNSIndexPathArray:(NSArray *)array;
/**
 *  根据indexpPath大小按升序排序
 *
 *  @param array 需要排序的数组
 *
 *  @return 排序结果
 */
+ (NSArray *)upSortArrayWithNSIndexPathArray:(NSArray *)array;

@end
