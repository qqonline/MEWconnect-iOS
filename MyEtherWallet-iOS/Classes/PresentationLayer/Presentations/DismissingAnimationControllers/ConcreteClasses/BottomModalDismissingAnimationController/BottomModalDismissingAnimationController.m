//
//  BottomModalDismissingAnimationController.m
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 26/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#import "BottomModalDismissingAnimationController.h"

@implementation BottomModalDismissingAnimationController

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
  return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
  UIView *dismissedView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
  UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  [fromViewController beginAppearanceTransition:NO animated:[self transitionDuration:transitionContext] > 0.0];
  [toViewController beginAppearanceTransition:YES animated:[self transitionDuration:transitionContext] > 0.0];
  
  UIView *containerView = [transitionContext containerView];
  UIView *dismissedViewSnapshot = [dismissedView snapshotViewAfterScreenUpdates:NO];
  [containerView addSubview:dismissedViewSnapshot];
  
  CGRect frame = dismissedView.frame;
  dismissedViewSnapshot.frame = frame;
  dismissedView.hidden = YES;
  
  UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseIn;
  
  [UIView animateWithDuration:[self transitionDuration:transitionContext]
                        delay:0.0
                      options:options
                   animations:^{
                     dismissedViewSnapshot.transform = CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(dismissedView.bounds));
                   } completion:^(BOOL finished) {
                     [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     [toViewController setNeedsStatusBarAppearanceUpdate];
                     [fromViewController endAppearanceTransition];
                     [toViewController endAppearanceTransition];
                   }];
}

@end
