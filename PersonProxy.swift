//
//  PersonProxy.swift
//  Sample-Architectures
//
//  Created by Ronaldo Gomes on 4/8/17.
//  Copyright © 2017 Technophile IT. All rights reserved.
//

import Foundation
import puremvc

class PersonProxy: Proxy {

    open override class func name() -> String! { return "PersonProxy" }
    
    override init() {
        super.init(proxyName: PersonProxy.name(), data: [Person]())
    }
    
    var people:[Person] {
        return data as! [Person]
    }
    
}
