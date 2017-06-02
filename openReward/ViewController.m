//
//  ViewController.m
//  openReward
//
//  Created by 瓮守玉 on 2017/6/1.
//  Copyright © 2017年 ranhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UILabel *textLbl;
@property(nonatomic,strong)UIImageView *coatingImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
     [self.view addSubview:self.textLbl];
     [self.view addSubview:self.coatingImg];
    
    
}

-(UILabel*)textLbl{

    if (_textLbl==nil ) {
        _textLbl=[[UILabel alloc]init];
        _textLbl.text=@"谢谢惠顾!";
        _textLbl.frame=CGRectMake(100, 200, 200, 100);
        _textLbl.textAlignment=NSTextAlignmentCenter;
        
    }
    return _textLbl;
}

-(UIImageView *)coatingImg{

    if (_coatingImg==nil) {
        _coatingImg=[[UIImageView alloc]init];
        _coatingImg.image=[UIImage imageNamed:@"photo.jpg"];
        _coatingImg.frame=self.textLbl.frame;
       
        
    }
    return _coatingImg;
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{

    // 触摸任意位置
    UITouch *touch = touches.anyObject;
    // 触摸位置在图片上的坐标
    CGPoint cententPoint = [touch locationInView:self.coatingImg];
    // 设置清除点的大小
    CGRect  rect = CGRectMake(cententPoint.x, cententPoint.y, 20, 20);
    // 默认是去创建一个透明的视图
    UIGraphicsBeginImageContextWithOptions(self.coatingImg.bounds.size, NO, 0);
    // 获取上下文(画板)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 把imageView的layer映射到上下文中
    [self.coatingImg.layer renderInContext:ref];
    // 清除划过的区域
    CGContextClearRect(ref, rect);
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图片的画板, (意味着图片在上下文中消失)
    UIGraphicsEndImageContext();
    self.coatingImg.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
