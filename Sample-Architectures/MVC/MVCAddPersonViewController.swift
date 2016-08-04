//
//  MVCAddPersonViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/08/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit

protocol MVCAddPersonDelegate {
    
    func didAddPerson(person:Person)
    
}

class MVCAddPersonViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField:UITextField!
    @IBOutlet private weak var emailTextField:UITextField!
    @IBOutlet private weak var ageTextField:UITextField!
    
    var delegate:MVCAddPersonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapCancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapDoneButton(sender: AnyObject) {
        
        let person = Person(
            name: self.nameTextField.text!,
            email: self.emailTextField.text!,
            age: Int(self.ageTextField.text!)!)

        do {
            try AppDelegate.dataStore.create(person) {
                self.delegate?.didAddPerson(person)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        catch {
        
        }
        
    }
    
}
