//
//  ListPeopleViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo Gomes on 6/12/16.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit
import PKHUD

class ListPeopleViewController: BaseListViewController {

    @IBOutlet weak var tableView:UITableView!
    
    var presenter: ListPeoplePresenterProtocol?
    
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Viper"
        self.presenter?.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPersonSegue" {
//            let navigationViewController = segue.destination as! UINavigationController
//            let addPersonViewController = navigationViewController.childViewControllers.first as! AddPersonViewController
//            addPersonViewController.delegate = self
        } else {
            
            if let cell = sender as? ListPeopleCell, let person = cell.person {
                self.presenter?.showPersonDetail(for: person, to: segue)
            }
//            let viewController = segue.destination as! ShowPersonViewController
//            viewController.viewModel = ShowPersonViewModel(person: self.viewModel!.people[self.tableView.indexPathForSelectedRow!.row])
        }
        
    }

}

extension ListPeopleViewController: ListPeopleViewProtocol {

    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showPeople(_ people: [Person]) {
        self.people = people
        self.tableView.reloadData()
    }
    
}

extension ListPeopleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            
            let person = self.people[indexPath.row]
            do {
                try AppDelegate.dataStore.delete(person, completionHandler: {
//                    self.loadData()
                })
            }
            catch {}
            
            break
            
        default:
            print("ignore other styles")
        }
    }
    
}

extension ListPeopleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! ListPeopleCell
        cell.person = self.people[indexPath.row]
    }
    
}

//extension ListPeopleViewController: AddPersonDelegate {
//    
//    func didAddPerson(_ person: Person) {
//        self.loadData()
//    }
//    
//}


