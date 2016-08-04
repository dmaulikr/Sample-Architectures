//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ListPeopleModulePresenter: ListPeopleModulePresenterProtocol, ListPeopleModuleInteractorOutputProtocol
{
    weak var view: ListPeopleModuleViewProtocol?
    var interactor: ListPeopleModuleInteractorInputProtocol?
    var wireFrame: ListPeopleModuleWireFrameProtocol?
    
    init() {}
}