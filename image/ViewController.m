//
//  ViewController.m
//  image
//
//  Created by weifangzou on 17/1/11.
//  Copyright © 2017年 Ttpai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView*imgV1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, 10, 10 )];
    imgV1.image = [UIImage  imageNamed:@"qq"];
    [self.view  addSubview:imgV1];
    
    
    UIImageView*imgV2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, 10,  10 )];
    UIImage*img = [self  compressImageWith:[UIImage  imageNamed:@"qq"] width:250 height:250];
    imgV2.image = img;
    [self.view  addSubview:imgV2];

}
- (UIImage *)compressImageWith:(UIImage *)image width:(float)width height:(float)height
{
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //    [newImage retain];
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
