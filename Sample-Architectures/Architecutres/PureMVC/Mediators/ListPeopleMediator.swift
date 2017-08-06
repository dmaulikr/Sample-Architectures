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
        self.listPeopleViewController.mediator = self
    }
    
    func viewDidLoad() {

        if let personProxy = facade.retrieveProxy(PersonProxy.name()) as? PersonProxy {
            self.listPeopleViewController.people = personProxy.people
        }
        
    }
    
    func onDelete(_ person: Person) {
        sendNotification(ApplicationFacade.DELETE_PERSON)
    }
    
    func onSelect(_ person: Person) {
        sendNotification(ApplicationFacade.PERSON_SELECTED, body: person)
    }
    
    func onNew() {
        sendNotification(ApplicationFacade.NEW_PERSON)
    }
    
    override func listNotificationInterests() -> [Any]! {
        return []
    }
    
    var listPeopleViewController: ListPeopleViewController {
        return viewComponent as! ListPeopleViewController
    }    

}
