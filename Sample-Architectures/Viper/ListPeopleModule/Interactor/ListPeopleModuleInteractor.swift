//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ListPeopleModuleInteractor: ListPeopleModuleInteractorInputProtocol
{
    weak var presenter: ListPeopleModuleInteractorOutputProtocol?
    var APIDataManager: ListPeopleModuleAPIDataManagerInputProtocol?
    var localDatamanager: ListPeopleModuleLocalDataManagerInputProtocol?
    
    init() {}
}