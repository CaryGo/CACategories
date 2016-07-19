//
//  NSArray+JSSort.m
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import "NSArray+JSSort.h"

@implementation NSArray (JSSort)

+ (NSArray *)lowSortArrayWithNSIndexPathArray:(NSArray *)array{
    NSMutableArray * deleteArray = [NSMutableArray arrayWithArray:array];
    for (int i = 0; i< deleteArray.count; i++) {//对数组进排序  删除cell是根据
        for (int j = 0; j < deleteArray.count - i - 1; j++) {
            NSIndexPath * deleteIndexPath1 = deleteArray[j];
            NSIndexPath * deleteIndexPath2 = deleteArray[j + 1];
            if (deleteIndexPath1.row < deleteIndexPath2.row) {
                NSIndexPath * deleteIndexPath;
                deleteIndexPath = deleteArray[j];
                deleteArray[j] = deleteArray[j + 1];
                deleteArray[j + 1] = deleteIndexPath;
            }
        }
    }
    return deleteArray;
}

+ (NSArray *)upSortArrayWithNSIndexPathArray:(NSArray *)array{
    NSMutableArray * deleteArray = [NSMutableArray arrayWithArray:array];
    for (int i = 0; i< deleteArray.count; i++) {//对数组进排序  删除cell是根据
        for (int j = 0; j < deleteArray.count - i - 1; j++) {
            NSIndexPath * deleteIndexPath1 = deleteArray[j];
            NSIndexPath * deleteIndexPath2 = deleteArray[j + 1];
            if (deleteIndexPath1.row > deleteIndexPath2.row) {
                NSIndexPath * deleteIndexPath;
                deleteIndexPath = deleteArray[j];
                deleteArray[j] = deleteArray[j + 1];
                deleteArray[j + 1] = deleteIndexPath;
            }
        }
    }
    return deleteArray;
}

@end
