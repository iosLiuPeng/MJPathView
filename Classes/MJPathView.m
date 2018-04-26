//
//  MJPathView.m
//  MJPathView
//
//  Created by 刘鹏 on 2018/4/26.
//  Copyright © 2018年 musjoy. All rights reserved.
//

#import "MJPathView.h"

@implementation MJPathView
#pragma mark - Life Circle
+ (Class)layerClass
{
    return [CAShapeLayer class];
}

#pragma mark - Public
/// 在此方法内绘制路径
- (CGPathRef)pathWithRect:(CGRect)rect
{
    /*
     如果直接画圆（使用UIBezierPath、CGPathRet画线均是），起点总是最右边，所以这里通过有始终点的圆弧，画一整个圆，然后压缩成椭圆
     */
    //中心点
    CGPoint centerPoint = CGPointMake(rect.origin.x + rect.size.width / 2.0, rect.origin.y + rect.size.height / 2.0);
    //x轴压缩、放大比例
    CGFloat sx = 1;
    //y轴压缩、放大比例
    CGFloat sy = rect.size.height / rect.size.width;
    //中心点修正（因为压缩变换会将中心点位置也按比例变化，/(ㄒoㄒ)/~~，所以需要调整）
    CGPoint center = CGPointMake(centerPoint.x / sx, centerPoint.y / sy);
    //半径,这里以矩形的宽为半径
    CGFloat radius = rect.size.width / 2.0;
    //绘制圆
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:(-90 / 180.0 * M_PI) endAngle:(270 / 180.0 * M_PI) clockwise:YES];
    //压缩
    CGAffineTransform transform = CGAffineTransformMakeScale(sx, sy);
    //路径
    CGPathRef path = CGPathCreateCopyByTransformingPath(ovalPath.CGPath, &transform);
    CFAutorelease(path);
    return path;
}

#pragma mark - Overwrite
/**
 将path绘制到视图中
 
 @param rect layer的rect
 */
- (void)drawRect:(CGRect)rect
{
    //绘制路径
    CGPathRef path = [self pathWithRect:self.layer.bounds];
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //配置
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);//设置笔触颜色
    CGContextSetLineWidth(context, 1.0);//设置线条宽度
    //画线
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
}


@end
