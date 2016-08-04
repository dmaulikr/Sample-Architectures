//
//  ListPeopleViewModel.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/04/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import Foundation

protocol MVVMListPeopleViewModelProtocol: class {

    var people:[Person] { get }
    
    var peopleDidChange:( (MVVMListPeopleViewModelProtocol) -> ())? { get set }
    
    func loadPeople()
    
    func fetchPersonByIndexPath(indexPath:NSIndexPath) -> Person
    
    func removePersonByIndexPath(indexPath:NSIndexPath)
    
    func nameAndAgeForIndexPath(indexPath:NSIndexPath) -> String
    
    init()

}

class MVVMListPeopleViewModel: MVVMListPeopleViewModelProtocol {
    
    var people:[Person] = [] {
        didSet {
            self.peopleDidChange?(self)
        }
    }
    
    var peopleDidChange:( (MVVMListPeopleViewModelProtocol) -> ())?
    
    var count:Int {
        return self.people.count
    }

    required init() {
        self.loadPeople() 
    }
    
//    var nameAndAge:String {
//        let person = self.people![self.currentIndexPath.row]
//        return person.nameAndAge
//    }
    
    func nameAndAgeForIndexPath(indexPath:NSIndexPath) -> String {
        let person = self.fetchPersonByIndexPath(indexPath)
        return "-> \(person.name) (\(person.age))"
    }
    
    func loadPeople() {
        AppDelegate.dataStore.fetch { (people) in
            self.people = people
        }
    }
 
    func fetchPersonByIndexPath(indexPath:NSIndexPath) -> Person {
        return self.people[indexPath.row]
    }
    
    func removePersonByIndexPath(indexPath: NSIndexPath) {
        let person = self.people[indexPath.row]
        
        do {
            try AppDelegate.dataStore.delete(person) {
                self.loadPeople()
            }
        }
        catch {}
    }
    
}