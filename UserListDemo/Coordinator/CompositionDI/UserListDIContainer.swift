//
//  UserListDIContainer.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 21/05/23.
//

import Foundation

final class UserListDIContainer {
    
    static let USER_LIST_URL = URL(string: "https://randomuser.me/api/")!
    
    func makeUserListViewController() -> UserListViewController {
        let userlistStoryboard = UIStoryboard(name: "UserListVC", bundle: nil)
        let userListVC = userlistStoryboard.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        userListVC.viewModel = makeUserListViewModel(vc: userListVC)
        return userListVC
    }
    
    private func makeUserListViewModel(vc: UserListViewController) -> UserListViewModel {
        let viewModel = UserListViewModel()
        
        viewModel.delegate = vc
                
        viewModel.remoteUser = remoteLoader()
        
        let fetchData = FetchUserData()
        viewModel.adapter = UserListAdapter(fetchUser: fetchData)
        
        return viewModel
    }
    
    private func remoteLoader() -> RemoteUserLoader {
        let httpClient = ApiClient(session: URLSession.shared)
        let storeData = StoreUserData()
        return RemoteUserLoader(httpClient: httpClient, url: UserListDIContainer.USER_LIST_URL, storeData: storeData)
    }
}
