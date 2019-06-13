//
//  ViewController.m
//  GlowHockey
//
//  Created by karthi on 2/25/17.
//  Copyright © 2017 tringapps. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end
float oldX, oldY;
BOOL dragging;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.ballView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    self.paddleView = [[UIView alloc] initWithFrame:CGRectMake(200, 700, 100, 20)];
    self.goal = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, 50, 50)];
    self.goal.backgroundColor = [UIColor greenColor];
    self.ballView.backgroundColor = [UIColor orangeColor];
    self.ballView.layer.cornerRadius = 25.0;
    self.ballView.layer.borderColor = [UIColor blackColor].CGColor;
    self.ballView.layer.borderWidth = 0.0;
    self.paddleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.ballView];
    [self.view addSubview:self.paddleView];
    [self.view addSubview:self.goal];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.pusher = [[UIPushBehavior alloc] initWithItems:@[self.ballView]
                                                   mode:UIPushBehaviorModeInstantaneous];
    self.pusher.pushDirection = CGVectorMake(0.5, 1.0);
    self.pusher.active = YES;
    [self.animator addBehavior:self.pusher];
    self.collider = [[UICollisionBehavior alloc] initWithItems:@[self.ballView, self.paddleView]];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collider];
    //remove rotation
    self.ballDynamicProperties = [[UIDynamicItemBehavior alloc] initWithItems:@[self.ballView]];
    self.ballDynamicProperties.allowsRotation = NO;
    [self.animator addBehavior:self.ballDynamicProperties];
    
    self.paddleDynamicProperties = [[UIDynamicItemBehavior alloc] initWithItems:@[self.paddleView]];
    self.paddleDynamicProperties.allowsRotation = NO;
    [self.animator addBehavior:self.paddleDynamicProperties];
    
    // Heavy paddle
    self.paddleDynamicProperties.density = 1000.0f;
    
    // Better collisions, no friction
    self.ballDynamicProperties.elasticity = 1.0;
    self.ballDynamicProperties.friction = 0.0;
    self.ballDynamicProperties.resistance = 0.0;
    
    //self.paddleView.center =  [ locationInView:self.view];
    [self.animator updateItemUsingCurrentState:self.paddleView];
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    self.paddleCenterPoint = _paddleView.center;
    CGFloat yPoint = self.paddleCenterPoint.y;
    CGFloat xPoint = self.paddleCenterPoint.x;
    CGPoint paddleCenter = CGPointMake(touchLocation.x, touchLocation.y);
    
    self.paddleView.center = paddleCenter;
    [self.animator updateItemUsingCurrentState:self.paddleView];
    if((_ballView.frame.origin.x == self.view.frame.size.width/2) && (_ballView.frame.origin.y == 50)){
        _ballView.backgroundColor = [UIColor blueColor];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
