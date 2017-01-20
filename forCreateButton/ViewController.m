//
//  ViewController.m
//  forCreateButton
//
//  Created by hydom on 2017/1/20.
//  Copyright © 2017年 Liu. All rights reserved.
//

#import "ViewController.h"
#define SCREERN_W [UIScreen mainScreen].bounds.size.width
#define SCREERN_H [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITextFieldDelegate>
{
    UIView *view;
    NSMutableArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建添加button视图
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 65, SCREERN_W,SCREERN_H-100)];
    contentView.backgroundColor = [UIColor grayColor];
    NSArray *arrays = @[@"说好的红包呢",@"红包",@"说好的",@"包",@"哦多克",@"没有红包了吗",@"只有一分钱怎么办",@"恭喜发财",@"怒怒怒uunu",@"是滴是滴",@"蹦下嘎啦嘎"];
    array = [NSMutableArray array];
    //创建button
    for (int i = 0; i < arrays.count; i ++)
    {
        NSString *name = arrays[i];
        static UIButton *recordBtn =nil;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.borderWidth = 1.0;
        btn.layer.borderColor = [UIColor whiteColor].CGColor;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 4;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        CGRect rect = [name boundingRectWithSize:CGSizeMake(SCREERN_W, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil];
        if (i == 0)
        {
            btn.frame =CGRectMake(10, 10, rect.size.width, rect.size.height);
        }
        else{
            CGFloat yuWidth = SCREERN_W - 25-recordBtn.frame.origin.x -recordBtn.frame.size.width;
            if (yuWidth >= rect.size.width) {
                btn.frame =CGRectMake(recordBtn.frame.origin.x +recordBtn.frame.size.width + 10, recordBtn.frame.origin.y, rect.size.width, rect.size.height);
            }else{
                btn.frame =CGRectMake(10, recordBtn.frame.origin.y+recordBtn.frame.size.height+10, rect.size.width, rect.size.height);
            }
        }
        [btn setTitle:name forState:UIControlStateNormal];
        [contentView addSubview:btn];
        recordBtn = btn;
        recordBtn.tag = 100+i;
        [recordBtn addTarget:self action:@selector(respondsToSelct:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
    }
    [self.view addSubview:contentView];
    
    
}
#pragma mark-- 选择单个
- (void)respondsToSelct:(UIButton*)sender{
    
    for (UIButton *btn in array) {
        
        if (sender.tag == btn.tag) {
            
            btn.selected = YES;
            [btn setBackgroundColor:[UIColor orangeColor]];
            
        } else {
            btn.selected = NO;
            [btn setBackgroundColor:[UIColor clearColor]];
        }
        
    }
}



@end
