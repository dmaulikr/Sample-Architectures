//
//  ListPeopleMediator.swift
//  Sample-Architectures
//
//  Created by Ronaldo Gomes on 4/8/17.
//  Copyright © 2017 Technophile IT. All rights reserved.
//

import Foundation
import puremvc

class ListPeopleMediator: Mediator {

    open override class func name() -> String! { return "ListPeopleMediator" }
    
    init(viewComponent: ListPeopleViewController) {
        super.init(mediatorName: ListPeopleMediator.name(), viewComponent: viewComponent)
    }
    
    override func onRegister() {
//        employeeAdmin._delegate = self
    }
    
    func viewDidLoad() {
//        facade.register(UserListMediator(viewComponent: employeeAdmin.userList))
    }
    
    override func listNotificationInterests() -> [Any]! {
        return []
    }
    
    var listPeopleViewController: ListPeopleViewController {
        return viewComponent as! ListPeopleViewController
    }    

}
