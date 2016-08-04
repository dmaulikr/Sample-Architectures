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

extension Selector {
    
    static var ArchivedBarButtonTapped = #selector(ListPeopleViewController.archivedBarButtonTapped(_:))
    
}

class ListPeopleViewController: UITableViewController {
    
//    var worker = Worker(store: PeopleMemStore())
    var viewModel:ListPeopleViewModel = ListPeopleViewModel()
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem()
        self.navigationItem.rightBarButtonItem!.style = .Plain
        self.navigationItem.rightBarButtonItem!.title = "archived"
//            UIBarButtonItem(title: "archived", style: .Plain, target: self, action: .ArchivedBarButtonTapped)
        
//        self.navigationItem.rightBarButtonItem!.rx_tap.
//        
//        self.navigationItem.rightBarButtonItem?.rx_tap.asDriver().wi
//
//            self.viewModel.showArchived = !self.viewModel.showArchived
//            if self.viewModel.showArchived {
//                self.navigationItem.rightBarButtonItem?.title = "hide"
//            } else {
//                self.navigationItem.rightBarButtonItem?.title = "archived"
//            }
//            
//        }).doOnNext({ 
//            self.tableView.reloadData()
//        })
        
//        worker.fetchPeople { (people) in
//            self.viewModel = ListPeopleViewModel(people: people)
//            self.tableView.reloadData()
//        }
        
    }

    func archivedBarButtonTapped(sender:AnyObject) {
        
        
        
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        let viewController = segue.destinationViewController as! ShowPersonViewController
//        viewController.viewModel = ShowPersonViewModel(person: self.viewModel.people[self.tableView.indexPathForSelectedRow!.row])
//        
//    }
    
}

extension ListPeopleViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // self.viewModel.tableViewData.count
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let cell = cell as! PersonCell
//        cell.detailLabel!.text = self.viewModel.nameAndAge
//        cell.archivedSwitch.on = self.viewModel.archived
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        self.viewModel.currentIndexPath = indexPath
        return tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
    }
        
}

class PersonCell: UITableViewCell {
    
    @IBOutlet var detailLabel:UILabel!
    @IBOutlet var archivedSwitch:UISwitch!
    
}