//
//  UserTableViewCell.m
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

#import "UserTableViewCell.h"
#import "UserListDemo-Swift.h"

@implementation UserTableViewCell

-(void)setupData:(UserPO *)user withImageLoader:(ImageLoaderHelper *)imageLoader {
    NSString * fullName = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    NSString * country = [NSString stringWithFormat:@"%@ | %@", @"Country", user.country];
    
    [self.labelFullname setText: fullName];
    [self.labelEmail setText: user.email];
    [self.labelCountry setText: country];
    
    
    NSString * regDate = [RelativeDates getRelativeDateStringWithDate: user.registered_date];
    [self.labelRegisteredData setText:regDate];
    
    self.imageViewProfile.image = nil;
    if(user.image_small == nil) return;
    [imageLoader loadImageWithUrl: user.image_small imageView: self.imageViewProfile];
    
}
@end