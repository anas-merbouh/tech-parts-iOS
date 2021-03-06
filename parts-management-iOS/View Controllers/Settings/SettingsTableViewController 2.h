//
//  SettingsTableViewController.h
//  parts-management-iOS
//
//  Created by Anas Merbouh on 2020-03-14.
//  Copyright © 2020 Anas Merbouh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootNavigating.h"
#import "SessionManaging.h"
#import "FIRUserFetching.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsTableViewController : UITableViewController

@property (strong, nonatomic, nonnull) id <SessionManaging> sessionManager;
@property (strong, nonatomic, nonnull) id <FIRUserFetching> userFetchingHandler;
@property (strong, nonatomic, nonnull) id <RootNavigating> rootNavigationHandler;

@end

NS_ASSUME_NONNULL_END
