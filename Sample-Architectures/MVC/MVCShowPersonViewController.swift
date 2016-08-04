//
//  MVCShowPersonViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/08/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit

class MVCShowPersonViewController: UIViewController {

    @IBOutlet private weak var nameLabel:UILabel!
    @IBOutlet private weak var emailLabel:UILabel!
    @IBOutlet private weak var ageLabel:UILabel!
    
    var person:Person?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let person = person else { return }
        self.nameLabel.text = person.name
        self.emailLabel.text = person.email
        self.ageLabel.text = "\(person.age)"
        
    }
    
}
