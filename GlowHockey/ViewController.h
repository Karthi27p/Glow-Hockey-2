//
//  ViewController.h
//  GlowHockey
//
//  Created by karthi on 2/25/17.
//  Copyright © 2017 tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollisionBehaviorDelegate>


@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (nonatomic, strong) UIView *ballView;

@property (nonatomic, strong) UIView *paddleView;

@property (nonatomic, strong) UIView *goal;

@property (nonatomic, strong) UIPushBehavior *pusher;

@property (nonatomic, strong) UICollisionBehavior *collider;

@property (nonatomic, strong) UIDynamicItemBehavior *ballDynamicProperties;

@property (nonatomic, strong) UIDynamicItemBehavior *paddleDynamicProperties;

@property (nonatomic) CGPoint paddleCenterPoint;

@end
