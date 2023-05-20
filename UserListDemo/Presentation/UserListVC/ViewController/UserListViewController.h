//
//  UserListViewController.h
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

#import <UIKit/UIKit.h>
#import "UserListViewModel.h"
#import "UserTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UserListDelegate>

@property (weak, nonatomic) IBOutlet UITableView *userList;
@property (strong, nonatomic) UserListViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
