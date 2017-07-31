//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ListPeopleAPIDataManager: ListPeopleAPIDataManagerInputProtocol {
    
    var remoteRequestHandler: ListPeopleRemoteDataManagerOutputProtocol?
    
    init() {}
    
    func retrivePeopleList() {
        
        self.remoteRequestHandler?.onPeopleRetrieved(AppDelegate.people)
        
    }
    
}
