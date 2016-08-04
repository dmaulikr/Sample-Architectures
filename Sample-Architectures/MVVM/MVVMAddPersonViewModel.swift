//
//  AddPersonViewModel.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 27/07/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import Foundation

protocol MVVMAddPersonViewModelProtocol {
    
    func createPerson(person:Person)
    
    var didCreatePerson:((Person) -> Void)? { get set }
    
}

class MVVMAddPersonViewModel: MVVMAddPersonViewModelProtocol {

    var didCreatePerson:((Person) -> Void)?
    
    func createPerson(person:Person) {
        
        do {
            try AppDelegate.dataStore.create(person) {
                self.didCreatePerson?(person)
            }
        } catch {
        
        }
        
    }
    
}