//
//  ApplicationFacade.swift
//  Sample-Architectures
//
//  Created by Ronaldo Gomes on 3/8/17.
//  Copyright © 2017 Technophile IT. All rights reserved.
//

import Foundation
import puremvc

class ApplicationFacade: Facade {
    
    static var STARTUP = "startup"
    
    override func initializeController() {
        super.initializeController()
        
        registerCommand(ApplicationFacade.STARTUP, commandClassRef: StartupCommand.self)
    }
    
    static var sharedInstance: ApplicationFacade = {
        return ApplicationFacade.getInstance()
    }() as! ApplicationFacade
    
//    open class func getInstance() -> ApplicationFacade {
//        return super.getInstance { ApplicationFacade() } as! ApplicationFacade
//    }
    
    func startup(app: UINavigationController) {
        sendNotification(ApplicationFacade.STARTUP, body: app)
    }
    
}
