//
//  ShowPersonViewModel.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 27/07/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import Foundation

protocol ShowPersonViewModelProtocol: class {
    
    var person:Person? { get }
    
}

class ShowPersonViewModel: ShowPersonViewModelProtocol {

    var person:Person?
    
}