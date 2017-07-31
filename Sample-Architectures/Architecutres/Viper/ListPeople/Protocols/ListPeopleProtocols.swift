//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

protocol ListPeopleViewProtocol: class {
    var presenter: ListPeoplePresenterProtocol? { get set }
    
    func showLoading()
    func hideLoading()
    
    func showPeople(_ people: [Person])
}

protocol ListPeopleWireFrameProtocol: class {
    func presentPersonDetailScreen(from view: ListPeopleViewProtocol, for person: Person, to segue: UIStoryboardSegue)
    static func createListPeople() -> UIViewController
}

protocol ListPeoplePresenterProtocol: class {
    var view: ListPeopleViewProtocol? { get set }
    var interactor: ListPeopleInteractorInputProtocol? { get set }
    var wireFrame: ListPeopleWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showPersonDetail(for person:Person, to segue:UIStoryboardSegue)
    
}

protocol ListPeopleInteractorOutputProtocol: class {
    
    func didRetrivePeople(_ people: [Person])
    
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol ListPeopleInteractorInputProtocol: class {
    var presenter: ListPeopleInteractorOutputProtocol? { get set }
    var APIDataManager: ListPeopleAPIDataManagerInputProtocol? { get set }
    var localDatamanager: ListPeopleLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func fetchPeole()
}

//protocol ListPeopleDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
//}

protocol ListPeopleRemoteDataManagerOutputProtocol: class {
    func onPeopleRetrieved(_ posts: [Person])
    func onError()
}

protocol ListPeopleAPIDataManagerInputProtocol: class {
    var remoteRequestHandler: ListPeopleRemoteDataManagerOutputProtocol? { get set }
    
    func retrivePeopleList()
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol ListPeopleLocalDataManagerInputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
