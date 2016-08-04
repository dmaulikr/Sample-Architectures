//
//  MVCListPeopleViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/08/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit

private extension Selector {
    
    static let DidTapAddButton = #selector(MVCListPeopleViewController.didTapAddButton(_:))
    
}

class MVCListPeopleViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    private var people:[Person] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Regular MVC"
        
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: .DidTapAddButton)
        
        self.navigationItem.rightBarButtonItems = [addBarButtonItem,self.editButtonItem()]
        
        self.loadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! ListPeopleCell
        let viewController = segue.destinationViewController as! MVCShowPersonViewController
        viewController.person = cell.person
    }
    
    func didTapAddButton(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "RegularMVC", bundle: NSBundle.mainBundle())
        let navigationViewController = storyboard.instantiateViewControllerWithIdentifier("AddPersonNavigationController")
        let addPersonViewController = navigationViewController.childViewControllers.first as! MVCAddPersonViewController
        addPersonViewController.delegate = self
        self.presentViewController(navigationViewController, animated: true, completion: nil)
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.editing = editing
    }

    private func loadData() {
        AppDelegate.dataStore.fetch({ people in
            self.people = people
        })
    }
    
}

extension MVCListPeopleViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            
            let person = self.people[indexPath.row]
            do {
                try AppDelegate.dataStore.delete(person, completionHandler: {
                    self.loadData()
                })
            }
            catch {}
            
        default:
            print("ignore other styles")
        }
    }

}

extension MVCListPeopleViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell = cell as! ListPeopleCell
        cell.person = self.people[indexPath.row]
    }

}

extension MVCListPeopleViewController: MVCAddPersonDelegate {

    func didAddPerson(person: Person) {
        self.loadData()
    }

}

