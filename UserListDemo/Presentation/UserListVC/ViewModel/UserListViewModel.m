//
//  UserListViewModel.m
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

#import "UserListViewModel.h"
#import "UserListDemo-Swift.h"

@implementation UserListViewModel

const int LIMIT = 10;

-(instancetype) init {
    self = [super init];
    if (self) {
        self.page = 1;
        self.users = [[NSMutableArray alloc] init];
        self.imageLoader = [[ImageLoaderHelper alloc] init];
    }
    return self;
}

-(void) loadUsers {
    
    [self.adapter loadUserListWithCompletion:^(NSArray<UserPO *> * userList, NSError * error) {
        if (error) {
            NSLog(@"viewmode error");
            [self loadUserFromRemote];
        } else {
            self.page += 1;
            [self.users addObjectsFromArray:userList];
            [self.delegate reloadTable];
        }
    }];
    
    
}

-(void) loadUserFromRemote {
    
    [self.remoteUser loadUserWithPage: self.page limit: LIMIT completion:^(NSError * error) {
        if (error) {
            // Stop loading more data
        } else {
            [self loadUsers];
        }
    }];
}

-(NSInteger) numberOfRow; {
    
    return [self.users count];
}

@end
