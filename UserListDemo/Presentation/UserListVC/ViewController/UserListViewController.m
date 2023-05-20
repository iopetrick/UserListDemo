//
//  UserListViewController.m
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

#import "UserListViewController.h"

@interface UserListViewController ()

@end

@implementation UserListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"Users List"];
    [self setupView];
    [self.viewModel loadUsers];
}

-(void) setupView {
    
    UINib *cellNib = [UINib nibWithNibName: @"UserTableViewCell" bundle:nil];
    [self.userList registerNib:cellNib forCellReuseIdentifier:@"UserTableViewCell"];
    [self.userList setDelegate:self];
    [self.userList setDataSource:self];
}

// MARK: - UITableView Delegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRow];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserTableViewCell"];
    [cell setupData: self.viewModel.users[indexPath.row]];
    return cell;
}

-(void) reloadTable {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"reload Table called");
        [self.userList reloadData];
    });
}

@end
