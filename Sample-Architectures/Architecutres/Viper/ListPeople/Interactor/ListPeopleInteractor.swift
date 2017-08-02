//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ListPeopleInteractor: ListPeopleInteractorInputProtocol {
    
    weak var presenter: ListPeopleInteractorOutputProtocol?
    var APIDataManager: ListPeopleRemoteDataManagerInputProtocol?
    var localDatamanager: ListPeopleLocalDataManagerInputProtocol?
    
    init() {}
    
    func fetchPeole() {
        self.APIDataManager?.retrivePeopleList()
    }
    
}

extension ListPeopleInteractor: ListPeopleRemoteDataManagerOutputProtocol {
    
    func onRetrievePeople(_ people: [Person]) {
        
        self.presenter?.didRetrivePeople(people)
        
    }
    
    func onError() {
        
    }
    
}
