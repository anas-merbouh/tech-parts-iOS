//
//  AppDependencyContainer.m
//  parts-management-iOS
//
//  Created by Anas Merbouh on 2020-03-15.
//  Copyright © 2020 Anas Merbouh. All rights reserved.
//

#import "AppDependencyContainer.h"
#import "UserRepository.h"
#import "SessionController.h"
#import "RootNavigationController.h"
#import "AuthenticationController.h"
#import "TKViewControllerFactoryImpl.h"

@interface AppDependencyContainer ()

@property (nonatomic, nonnull) RLMRealm * realm;
@property (nonatomic, nonnull) FIRFirestore * firestore;

@end

@implementation AppDependencyContainer

#pragma mark - Initialization

- (instancetype)initWithRealm:(RLMRealm *)realm firestore:(FIRFirestore *)firestore
{
    self = [super init];
    if (self) {
        _realm = realm;
        _firestore = firestore;
    }
    return self;
}

#pragma mark - Methods

- (id<SessionManaging>)makeSessionManager
{
    UserRepository * userRepository = [[UserRepository alloc] initWithRealm:self.realm firestore:self.firestore];
    
    // Return a newly created instance of the Session Controller class.
    return [[SessionController alloc] initWithUserDeletionHandler:userRepository];
}

- (id<RootNavigating>)makeRootNavigationHandler
{
    UIWindow * applicationWindow = [[UIApplication sharedApplication] keyWindow];
    
    // Return a newly created instance of the RootNavigationController class.
    return [[RootNavigationController alloc] initWithAppDependencyContainer:self
                                                      viewControllerFactory:[TKViewControllerFactoryImpl new]
                                                                     window:applicationWindow];
}

- (id<UserAuthenticating>)makeUserAuthenticationHandler
{
    UserRepository * userRepository = [[UserRepository alloc] initWithRealm:self.realm firestore:self.firestore];
    
    // Return a newly created instance of the AuthenticationController class.
    return [[AuthenticationController alloc] initWithUserSavingHandler:userRepository
                                                   userFetchingHandler:userRepository];
}

@end