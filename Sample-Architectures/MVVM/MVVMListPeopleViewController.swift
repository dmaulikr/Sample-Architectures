//
//  ListPeopleViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/04/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxBlocking

class MVVMListPeopleViewController: BaseListViewController {
    
    @IBOutlet private weak var tableView:UITableView!
    
    var viewModel:MVVMListPeopleViewModel? {
        didSet {
            self.viewModel!.peopleDidChange = { viewModel in
                self.tableView.reloadData()
            }
        }
    }
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MVVM"
        
        self.viewModel = MVVMListPeopleViewModel()
    }

    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.editing = editing
    }
    
    override func prepareAddViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: "MVVM", bundle: NSBundle.mainBundle())
        let navigationViewController = storyboard.instantiateViewControllerWithIdentifier("AddPersonNavigationController")
        let addPersonViewController = navigationViewController.childViewControllers.first as! MVVMAddPersonViewController
        addPersonViewController.delegate = self
        return navigationViewController
    }    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController as! MVVMShowPersonViewController
        viewController.viewModel = MVVMShowPersonViewModel(person: self.viewModel!.people[self.tableView.indexPathForSelectedRow!.row])
    }
    
}

extension MVVMListPeopleViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        switch editingStyle {
        case .Delete:

            self.viewModel!.removePersonByIndexPath(indexPath)
            
        default:
            print("ignore any other editing style")
        }
        
    }
    
}

extension MVVMListPeopleViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell = cell as! ListPeopleCell
        cell.person = self.viewModel!.fetchPersonByIndexPath(indexPath)
    }

}


extension MVVMListPeopleViewController: MVVMAddPersonDelegate {

    func didFinishCreatingPerson(person: Person) {
        self.viewModel!.loadPeople()
    }
    
}
