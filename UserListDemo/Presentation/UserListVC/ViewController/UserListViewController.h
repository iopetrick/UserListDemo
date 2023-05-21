//
//  UserListViewController.h
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

#import <UIKit/UIKit.h>
#import "UserListViewModel.h"
#import "UserTableViewCell.h"
@class MainCoordinator;

NS_ASSUME_NONNULL_BEGIN

@interface UserListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UserListDelegate>

@property (weak, nonatomic) IBOutlet UITableView *userList;
@property (strong, nonatomic) UserListViewModel *viewModel;
@property (weak, nonatomic) MainCoordinator *coordinator;
@end

NS_ASSUME_NONNULL_END
