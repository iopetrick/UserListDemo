//
//  UserTableViewCell.h
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

#import <UIKit/UIKit.h>
@class UserPO;
@class ImageLoaderHelper;

NS_ASSUME_NONNULL_BEGIN

@interface UserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProfile;
@property (weak, nonatomic) IBOutlet UILabel *labelFullname;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;
@property (weak, nonatomic) IBOutlet UILabel *labelCountry;
@property (weak, nonatomic) IBOutlet UILabel *labelRegisteredData;

-(void)setupData:(UserPO *)user withImageLoader:(ImageLoaderHelper *)imageLoader;

@end

NS_ASSUME_NONNULL_END
