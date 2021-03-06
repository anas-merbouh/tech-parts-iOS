//
//  RootNavigationController.m
//  parts-management-iOS
//
//  Created by Anas Merbouh on 2019-12-27.
//  Copyright © 2019 Anas Merbouh. All rights reserved.
//

#import "RootNavigationController.h"
#import "AppDependencyContainer.h"

@implementation RootNavigationController {
    UIWindow * _window;
    AppDependencyContainer * _appDependencyContainer;
    id <TKViewControllerFactory> _viewControllerFactory;
}

#pragma mark - Initialization

- (instancetype)initWithAppDependencyContainer:(AppDependencyContainer *)appDependencyContainer viewControllerFactory:(id<TKViewControllerFactory>)viewControllerFactory window:(UIWindow *)window
{
    self = [super init];
    if (self) {
        _window = window;
        _viewControllerFactory = viewControllerFactory;
        _appDependencyContainer = appDependencyContainer;
    }
    return self;
}

#pragma mark - Methods

- (void)navigateToBottomNavigationViewController
{
    UINavigationController * const projectListViewController = [_viewControllerFactory makeProjectListViewController];
    UINavigationController * const settingsViewController = [_viewControllerFactory makeSettingsViewControllerWithSessionManager:[_appDependencyContainer makeSessionManager]
                                                                                                                 userFetchingHandler: [_appDependencyContainer makeUserFetchingHandler]
                                                                                                               rootNavigationHandler:[_appDependencyContainer makeRootNavigationHandler]];
    
    // Create a new instance of the bottom navigation view controller.
    UIViewController * bottomNavigationViewController = (UIViewController *) [_viewControllerFactory makeBottomNavigationViewControllerWithProjectListViewController:projectListViewController settingsViewController:settingsViewController];
        
    // Set the Bottom Navigation View Controller instance as the window's root view controller.
    [_window setRootViewController:bottomNavigationViewController];
    
    // Animate the transition.
    [UIView transitionWithView:_window duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:NULL completion:NULL];
}

- (void)navigateToSignInViewController
{
    UIViewController * signInViewController = (UIViewController *) [_viewControllerFactory makeSignInViewControllerWithRootNavigationHandler:[_appDependencyContainer makeRootNavigationHandler]
                                                                                                                   userAuthenticationHandler:[_appDependencyContainer makeUserAuthenticationHandler]
                                                                                                           siriShortcutsAuthorizationManager:[_appDependencyContainer makeSiriShorcutsAuthorizationManager]
                                                                                                           notificationsAuthorizationManager:[_appDependencyContainer makeNotificationsAuthorizationManager]];
    
    // Set the Sign In View Controller instance as the window's root view controller.
    [_window setRootViewController:signInViewController];
    
    // Animate the transition.
    [UIView transitionWithView:_window duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:NULL completion:NULL];
}

@end
