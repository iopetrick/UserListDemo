//
//  UserListViewModel.h
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

#import <Foundation/Foundation.h>
#import "UserListDelegate.h"
@class UserListAdapter;
@class UserPO;
@class RemoteUserLoader;
@class ImageLoaderHelper;

NS_ASSUME_NONNULL_BEGIN

@interface UserListViewModel : NSObject

@property(nonatomic, weak)id <UserListDelegate> delegate;
@property (nonatomic) UserListAdapter *adapter;
@property (nonatomic) RemoteUserLoader *remoteUser;
@property  NSMutableArray<UserPO*> *users;

@property  ImageLoaderHelper *imageLoader;
@property int page;
@property BOOL isMoreDataAvailable;
@property BOOL isLoading;

-(void) loadUsers;

-(NSInteger) numberOfRow;

@end

NS_ASSUME_NONNULL_END
