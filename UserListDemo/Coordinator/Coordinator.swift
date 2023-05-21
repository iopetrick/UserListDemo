//
//  Coordinator.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 21/05/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
     func start()
}
