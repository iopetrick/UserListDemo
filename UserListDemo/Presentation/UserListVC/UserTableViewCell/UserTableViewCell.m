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
        
    [self.labelFullname setText: fullName];
    [self.labelEmail setText: user.email];
    
    NSString * regDate = [RelativeDates getRelativeDateStringWithDate: user.registered_date];
    [self.labelRegisteredData setText:regDate];
    
    self.imageViewProfile.image = nil;
    if(user.image_small == nil) return;
    [imageLoader loadImageWithUrl: user.image_small imageView: self.imageViewProfile];
    
    [self setupCountryName: user.country];
}

-(void)setupCountryName:(NSString *) country {
    NSString * placeholder = @"Country | ";
    NSString * countryString = country;
    
    NSString * completeString = [NSString stringWithFormat:@"%@%@", placeholder, countryString];
    
    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc] initWithString:completeString];
    
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont boldSystemFontOfSize: 14.0]
                             range:[completeString rangeOfString:placeholder]];
    
    [self.labelCountry setAttributedText: attributedString];
}
@end
