//
//  MJPathView.h
//  MJPathView
//
//  Created by 刘鹏 on 2018/4/26.
//  Copyright © 2018年 musjoy. All rights reserved.
//  动画路径，可以在xib上设置动画的路径

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface MJPathView : UIView
@property (nonatomic, assign) IBInspectable CGFloat angle;//角度
@property (nonatomic, strong) IBInspectable UIColor *lineColor;//线颜色

/// 返回路径xs
- (CGPathRef)pathWithRect:(CGRect)rect;
@end
