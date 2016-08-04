//
//  ListPeopleViewModel.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/04/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import Foundation

protocol ListPeopleViewModelProtocol: class {

    var people:[Person]? { get }
    
    var peopleDidChange:( (ListPeopleViewModelProtocol) -> ())? { get set }
    
    func loadPeople()
    
    func fetchPersonByIndexPath(indexPath:NSIndexPath) -> Person
    
}

class ListPeopleViewModel: ListPeopleViewModelProtocol {
    
    var people:[Person]? = [] {
        didSet {
            self.peopleDidChange?(self)
        }
    }
    
    var peopleDidChange:( (ListPeopleViewModelProtocol) -> ())?
    
    var count:Int {
        return self.people!.count
    }

//    var nameAndAge:String {
//        let person = self.people![self.currentIndexPath.row]
//        return person.nameAndAge
//    }
    
    func loadPeople() {
        AppDelegate.dataStore.fetch { (people) in
            self.people = people
        }
    }
 
    func fetchPersonByIndexPath(indexPath:NSIndexPath) -> Person {
        return self.people![indexPath.row]
    }
    
}