//
//  ViewController.m
//  DrawExample
//
//  Created by Вороненко Константин Михайлович on 04.05.2026.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *canvas;
@property (assign, nonatomic) CGPoint lastPoint;
@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.lastPoint = [touch locationInView:self.canvas];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.canvas];

    UIGraphicsBeginImageContext(self.canvas.frame.size);
    CGRect drawRect = CGRectMake(0, 0, self.canvas.frame.size.width, self.canvas.frame.size.height);
    [self.canvas.image drawInRect:drawRect];

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextSetRGBStrokeColor(ctx, 1.0f, 0.0f, 0.0f, 1.0f);
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(ctx, currentPoint.x, currentPoint.y);
    CGContextStrokePath(ctx);

    self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.lastPoint = currentPoint;
}

@end
