//
//  FlipAnimation.h
//  AnimeationSample
//
//  Created by MURONAKA HIROAKI on 2014/07/08.
//  Copyright (c) 2014年 to-on. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlipAnimation : NSObject

@property(nonatomic, strong) UIView* fromView;
@property(nonatomic, strong) UIView* toView;
@property(nonatomic, readonly) CGFloat duration;
@property(nonatomic, assign) BOOL isRemoveFromViewAfterFlipped;

-(id)initWithDuration:(CGFloat)duration fromView:(UIView*)fromView toView:(UIView*)toView;
-(void)startAnimation;
-(void)stopAnimation;

@end
