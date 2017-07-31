//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import Foundation
import UIKit

class ListPeopleWireFrame: ListPeopleWireFrameProtocol {

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "main", bundle: Bundle.main)
    }
    
    class func createListPeople() -> UIViewController {
        
        if let navigationController = mainStoryboard.instantiateInitialViewController(),
            let viewController = navigationController.childViewControllers.first as? ListPeopleViewController {
            
            let presenter: ListPeoplePresenterProtocol & ListPeopleInteractorOutputProtocol = ListPeoplePresenter()
            let interactor: ListPeopleInteractorInputProtocol & ListPeopleRemoteDataManagerOutputProtocol = ListPeopleInteractor()
            let remoteDataManager: ListPeopleAPIDataManager = ListPeopleAPIDataManager()
            let wireFrame: ListPeopleWireFrameProtocol = ListPeopleWireFrame()
            
            viewController.presenter = presenter
            presenter.view = viewController
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
            interactor.APIDataManager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navigationController
        }
        
        return UIViewController()
    }
    
    func presentPersonDetailScreen(from view: ListPeopleViewProtocol, for person: Person, to segue:UIStoryboardSegue) {
        let personDetailViewController = PersonDetailWireFrame.createPersonDetailModule(for: person, to: segue)
        
        
//        // Generating  components
//        let view: ListPeopleViewProtocol = ListPeopleItem()
//        let presenter: ListPeoplePresenterProtocol & ListPeopleInteractorOutputProtocol = ListPeoplePresenter()
//        let interactor: ListPeopleInteractorInputProtocol = ListPeopleInteractor()
//        let APIDataManager: ListPeopleAPIDataManagerInputProtocol = ListPeopleAPIDataManager()
//        let localDataManager: ListPeopleLocalDataManagerInputProtocol = ListPeopleLocalDataManager()
//        let wireFrame: ListPeopleWireFrameProtocol = ListPeopleWireFrame()
//        
//        // Connecting
//        view.presenter = presenter
//        presenter.view = view
//        presenter.wireFrame = wireFrame
//        presenter.interactor = interactor
//        interactor.presenter = presenter
//        interactor.APIDataManager = APIDataManager
//        interactor.localDatamanager = localDataManager
    }

}
