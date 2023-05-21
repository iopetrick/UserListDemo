//
//  MainCoordinator.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 21/05/23.
//

import Foundation
@objc
public class MainCoordinator: NSObject, Coordinator {
    
    let userListDI = UserListDIContainer()
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = userListDI.makeUserListViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    @objc public func openUserDetails(userPO: UserPO) {
        let userDetailDI = UserDetailDIContainer()
        let vc = userDetailDI.makeUserDetailViewController(userPO: userPO)
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func popViewController() {
        self.navigationController.popViewController(animated: true)
    }
}
