//
//  UserDetailDIContainer.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 21/05/23.
//

import Foundation

final class UserDetailDIContainer {
    
    func makeUserDetailViewController(userPO: UserPO) -> UserDetailViewController {
        let userDetailStoryboard = UIStoryboard(name: "UserDetail", bundle: nil)
        let detailVC = userDetailStoryboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        detailVC.viewModel = makeUserDetailViewModel(userPO: userPO)
        return detailVC
    }
    
    private func makeUserDetailViewModel(userPO: UserPO) -> UserDetailViewModel {
        return UserDetailViewModel(userPO: userPO, imageLoader: ImageLoaderHelper())
    }
    
}
