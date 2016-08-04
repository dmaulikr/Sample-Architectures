//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation

protocol ListPeopleModuleViewProtocol: class
{
    var presenter: ListPeopleModulePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol ListPeopleModuleWireFrameProtocol: class
{
    static func presentListPeopleModuleModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol ListPeopleModulePresenterProtocol: class
{
    var view: ListPeopleModuleViewProtocol? { get set }
    var interactor: ListPeopleModuleInteractorInputProtocol? { get set }
    var wireFrame: ListPeopleModuleWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol ListPeopleModuleInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol ListPeopleModuleInteractorInputProtocol: class
{
    var presenter: ListPeopleModuleInteractorOutputProtocol? { get set }
    var APIDataManager: ListPeopleModuleAPIDataManagerInputProtocol? { get set }
    var localDatamanager: ListPeopleModuleLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol ListPeopleModuleDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol ListPeopleModuleAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol ListPeopleModuleLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
