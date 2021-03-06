//
//  TKViewControllerFactory.h
//  parts-management-iOS
//
//  Created by Anas Merbouh on 2020-03-15.
//  Copyright © 2020 Anas Merbouh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootNavigating.h"
#import "SessionManaging.h"
#import "FIRUserFetching.h"
#import "UserAuthenticating.h"
#import "SiriShortcutsAuthorizationManaging.h"
#import "NotificationsAuthorizationManaging.h"

@class SignInViewController;
@class UINavigationController;
@class BottomNavigationViewController;
@class SessionPreparationViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol TKViewControllerFactory <NSObject>

/** @brief Initializes and returns an instance of the Project List View Controller with the provided parameters. */
- (UINavigationController * _Nonnull)makeProjectListViewController;

/**
 @brief Initializes and returns an instance of the Settings  View Controller with the provided parameters.
 
 @param sessionManager                                           A SessionManaging conforming object used to handle session-related operations.
 @param userFetchingHandler                                A FIRUserFetching conforming object used to handle the fetching of user profiles.
 @param rootNavigationHandler                           A RootNavigating conforming object used to handle navigation.
 */
- (UINavigationController * _Nonnull)makeSettingsViewControllerWithSessionManager:(id <SessionManaging>)sessionManager userFetchingHandler:(id <FIRUserFetching>)userFetchingHandler rootNavigationHandler:(id <RootNavigating>)rootNavigationHandler;

/**
 @brief Initializes and returns an instance of the Bottom Navigation View Controller with the provided parameters.
 
 @param projectListViewController A UINavigationController presenting an instance of the project list view controller.
 @param settingsViewController A UINavigationController presenting an instance of the settings view controller.
 */
- (BottomNavigationViewController * _Nonnull)makeBottomNavigationViewControllerWithProjectListViewController:(UINavigationController * _Nonnull)projectListViewController settingsViewController:(UINavigationController *)settingsViewController;

/**
 @brief Initializes and returns an instance of the Sign In View Controller with the provided parameters.
 
 @param rootNavigationHandler A RootNavigating conforming object used to handle navigation.
 @param userAuthenticationHandler A UserAuthenticating conforming object used to handle authentication.
 @param siriShortcutsAuthorizationManager A SiriShortcutsAuthorizationManaging conforming object used to handle Siri authorization related operations.
 @param notificationsAuthorizationManager A makeSettingsViewControllerWithSessionManager conforming object used to handle notifications authorization related operations.
 */
- (SignInViewController * _Nonnull)makeSignInViewControllerWithRootNavigationHandler:(id <RootNavigating> _Nonnull)rootNavigationHandler userAuthenticationHandler:(id <UserAuthenticating> _Nonnull)userAuthenticationHandler siriShortcutsAuthorizationManager:(id <SiriShortcutsAuthorizationManaging>)siriShortcutsAuthorizationManager notificationsAuthorizationManager:(id <NotificationsAuthorizationManaging>)notificationsAuthorizationManager;

@end

NS_ASSUME_NONNULL_END
