//
//  UserTableViewCell.m
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

#import "UserTableViewCell.h"
#import "UserListDemo-Swift.h"

@implementation UserTableViewCell

-(void)setupData:(UserPO *)user {
    NSString * fullName = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    NSString * country = [NSString stringWithFormat:@"%@ | %@", @"Country", user.country];
    
    [self.labelFullname setText: fullName];
    [self.labelEmail setText: user.email];
    [self.labelCountry setText: country];
    [self updateImage: user.image_small];
    
    NSString * regDate = [RelativeDates getRelativeDateStringWithDate: user.registered_date];
    [self.labelRegisteredData setText:regDate];
    
}

-(void) updateImage: (NSURL * _Nullable )url {
    if(url == nil) return;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: url];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageViewProfile.image = [UIImage imageWithData: data];
        });
        
    });
}

@end
