//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

class ListPeopleModuleWireFrame: ListPeopleModuleWireFrameProtocol
{
    class func presentListPeopleModuleModule(fromView view: AnyObject)
    {
        // Generating module components
        var view: ListPeopleModuleViewProtocol = ListPeopleModuleView()
        var presenter: protocol<ListPeopleModulePresenterProtocol, ListPeopleModuleInteractorOutputProtocol> = ListPeopleModulePresenter()
        var interactor: ListPeopleModuleInteractorInputProtocol = ListPeopleModuleInteractor()
        var APIDataManager: ListPeopleModuleAPIDataManagerInputProtocol = ListPeopleModuleAPIDataManager()
        var localDataManager: ListPeopleModuleLocalDataManagerInputProtocol = ListPeopleModuleLocalDataManager()
        var wireFrame: ListPeopleModuleWireFrameProtocol = ListPeopleModuleWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
    }
}