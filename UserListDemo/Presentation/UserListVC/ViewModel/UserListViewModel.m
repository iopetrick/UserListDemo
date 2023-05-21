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
        self.isMoreDataAvailable = YES;
        self.isLoading = NO;
    }
    return self;
}

-(void) loadUsers {
    
    if(self.isLoading) return;
    self.isLoading = YES;
    
    [self.adapter loadUserListWithCompletion:^(NSArray<UserPO *> * userList, NSError * error) {
        if (error) {
            NSLog(@"viewmode error");
            [self loadUserFromRemote];
        } else {
            NSLog(@"reload data...");
            self.isLoading = NO;
            self.page += 1;
            [self.users addObjectsFromArray:userList];
            [self.delegate reloadTable];
        }
    }];
}

-(void) loadUserFromRemote {
    //Static condition for limiting data to 100 only
    //Just for this demo
    if(self.users.count >= 100) {
        self.isMoreDataAvailable = NO;
        return;
    }
    
    [self.remoteUser loadUserWithPage: self.page limit: LIMIT completion:^(NSError * error) {
        self.isLoading = NO;
        if (error) {
            // Stop loading more data
            self.isMoreDataAvailable = NO;            
        } else {
            [self loadUsers];
        }
    }];
}

-(NSInteger) numberOfRow; {
    return [self.users count];
}

@end
