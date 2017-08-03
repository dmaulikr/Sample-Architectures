//
//  NavigationMediator.swift
//  Sample-Architectures
//
//  Created by Ronaldo Gomes on 4/8/17.
//  Copyright © 2017 Technophile IT. All rights reserved.
//

import Foundation
import puremvc
import UIKit

class NavigationMediator: Mediator {

    open override class func name() -> String! { return "NavigationMediator" }
    
    init(viewComponent: UINavigationController) {
        super.init(mediatorName: NavigationMediator.name(), viewComponent: viewComponent)
    }
    
    override func onRegister() {
        //        employeeAdmin._delegate = self
    }
    
//    func viewDidLoad() {
//        facade.register(UserListMediator(viewComponent: employeeAdmin.userList))
//    }
    
    override func listNotificationInterests() -> [Any]! {
        return []
    }
    
    var navigationViewController: UINavigationController {
        return viewComponent as! UINavigationController
    }    

}
