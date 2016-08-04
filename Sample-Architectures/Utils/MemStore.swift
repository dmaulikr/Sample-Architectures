//
//  PeopleMemStore.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/04/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import Foundation

class MemStore<T:Equatable>: StoreProtocol {
    
    typealias Element = T
    
    private var elements:[Element] = []
    
    convenience init(elements:[Element]) {
        self.init()
        self.elements = elements
    }
    
    func fetch(completionHandler: [Element] -> Void) {
        
        completionHandler(self.elements)
        
    }
    
    func create(person: Element, completionHandler: () -> Void) throws -> Void {
        
        self.elements.append(person)
        completionHandler()
        
    }
    
    func update(element: Element, completionHandler: () -> Void) throws -> Void  {
        
        let index = self.elements.indexOf { (p) -> Bool in
            return p == element
        }
        if let index = index {
            self.elements[index] = element
            completionHandler()
        } else {
            throw StoreError.CannotUpdate("Cannot update!!!")
        }
    
    }
    
    func delete(element: Element, completionHandler: () -> Void) throws -> Void {
        
        let index = self.elements.indexOf { (p) -> Bool in
            return p == element
        }
        if let index = index {
            self.elements.removeAtIndex(index)
            completionHandler()
        } else {
            throw StoreError.CannotDelete("Cannot delete")
        }
        
    }
    
}
