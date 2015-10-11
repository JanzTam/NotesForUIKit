//
//  ViewController.m
//  Dynamics
//
//  Created by tangjianzhuo on 15/10/11.
//  Copyright © 2015年 JanzTam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIDynamicAnimator * dyna;//需设置成全局实例，不然会被释放，代码不生效
    
    NSMutableArray * arrOfItems;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrOfItems = [[NSMutableArray alloc] init];
    
    [self addBall];
}

- (void)addBall{
    UIImageView * ball = [[UIImageView alloc] init];
    ball.image = [UIImage imageNamed:@"ball"];
    ball.frame = CGRectMake(100, 40, 80, 80);
    [self.view addSubview:ball];
    
    UIImageView *ball2 = [[UIImageView alloc] init];
    ball2.image = [UIImage imageNamed:@"ball"];
    ball2.frame = CGRectMake(70, 140, 50, 50);
    [self.view addSubview:ball2];
    
    UIImageView * ball3 = [[UIImageView alloc] init];
    ball3.image = [UIImage imageNamed:@"ball"];
    ball3.frame = CGRectMake(170, 200, 50, 50);
    [self.view addSubview:ball3];
    
    UIImageView * ball4 = [[UIImageView alloc] init];
    ball4.image = [UIImage imageNamed:@"ball"];
    ball4.frame = CGRectMake(220, 40, 70, 70);
    [self.view addSubview:ball4];
    
    UIImageView * ball5 = [[UIImageView alloc] init];
    ball5.image = [UIImage imageNamed:@"ball"];
    ball5.frame = CGRectMake(220, 200, 50, 50);
    [self.view addSubview:ball5];
    
    [arrOfItems addObjectsFromArray:@[ball,ball2,ball3,ball4,ball5]];
    [self addDyna];
}

- (void)addDyna {
    dyna = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior * gb = [[UIGravityBehavior alloc] initWithItems:arrOfItems];
    [gb setGravityDirection:CGVectorMake(0.0f, 0.5f)];
    
    UICollisionBehavior * colliB = [[UICollisionBehavior alloc] initWithItems:arrOfItems];
    [colliB setCollisionMode:UICollisionBehaviorModeEverything];
    colliB.translatesReferenceBoundsIntoBoundary = YES;//添加重力触碰边界，不然会一直往下掉
    
    UIDynamicItemBehavior* propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:arrOfItems];
    propertiesBehavior.elasticity = 1.0f;
    propertiesBehavior.allowsRotation = NO;
    propertiesBehavior.angularResistance = 0.0f;
    propertiesBehavior.density = 3.0f;
    propertiesBehavior.friction = 0.5f;
    propertiesBehavior.resistance = 0.5f;
    
    [dyna addBehavior:colliB];
    [dyna addBehavior:gb];
    [dyna addBehavior:propertiesBehavior];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addBall];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
