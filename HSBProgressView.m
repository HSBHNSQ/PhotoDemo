//
//  HSBProgressView.m
//  PhotoDemo
//
//  Created by mac mini on 6/7/18.
//  Copyright © 2018年 何少博. All rights reserved.
//

#import "HSBProgressView.h"

@interface HSBProgressView ()

@property (nonatomic,strong) CAShapeLayer * shapeLayer;

@end

@implementation HSBProgressView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

-(CAShapeLayer *)shapeLayer{
    if (_shapeLayer == nil) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        _shapeLayer.strokeColor = [[UIColor whiteColor] CGColor];
        _shapeLayer.opacity = 1;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.lineWidth = 5;
        [_shapeLayer setShadowColor:[UIColor blackColor].CGColor];
        [_shapeLayer setShadowOffset:CGSizeMake(1, 1)];
        [_shapeLayer setShadowOpacity:0.5];
        [_shapeLayer setShadowRadius:2];
        [self.layer addSublayer:_shapeLayer];
    }
    return _shapeLayer;
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = rect.size.width / 2;
    CGFloat start = - M_PI_2;
    CGFloat end = - M_PI_2 + M_PI * 2 * _progress;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    self.shapeLayer.path = path.CGPath;
}

@end
