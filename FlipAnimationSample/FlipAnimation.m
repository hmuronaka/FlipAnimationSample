//
//  FlipAnimation.m
//  AnimeationSample
//
//  Created by MURONAKA HIROAKI on 2014/07/08.
//  Copyright (c) 2014年 to-on. All rights reserved.
//

#import "FlipAnimation.h"

@implementation FlipAnimation

-(id)initWithDuration:(CGFloat)duration fromView:(UIView*)fromView toView:(UIView*)toView {
    self = [super init];
    if( self ) {
        _duration = duration;
        _fromView = fromView;
        _toView = toView;
        _isRemoveFromViewAfterFlipped = YES;
    }
    return self;
}

-(void)startAnimation {
    
    UIView* superView = self.fromView.superview;
    UIView* container = [[UIView alloc] initWithFrame:superView.frame];
    
    // from, toへ変わる際に、親のビューが回転してしまうので、
    // ダミーの親ビュー(container)にform,toを入れる。
    [self.fromView removeFromSuperview];
    [self.toView removeFromSuperview];
    [container addSubview:self.toView];
    [container addSubview:self.fromView];
    [superView addSubview:container];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_MSEC));
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [UIView transitionFromView:self.fromView  toView:self.toView duration:self.duration
                           options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL FINISHED) {
            if( FINISHED ) {
                // 回転した後は、ダミーの親ビューを破棄して、
                // 元に戻す
                [self.fromView removeFromSuperview];
                [self.toView removeFromSuperview];
                [container removeFromSuperview];
                if( !self.isRemoveFromViewAfterFlipped ) {
                    [superView addSubview:self.fromView];
                }
                [superView addSubview:self.toView];
            }
        }];
    });
}
-(void)stopAnimation {
    
}

@end
