//
//  AddPersonViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 27/07/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {

    @IBOutlet private weak var nameTextField:UITextField!
    @IBOutlet private weak var emailTextField:UITextField!
    @IBOutlet private weak var ageTextField:UITextField!
    
    var viewModel:AddPersonViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = AddPersonViewModel()
        
        self.viewModel?.didCreatePerson = { person in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func didTapDoneButton(sender:AnyObject) {
        
        let person = Person(
            name: self.nameTextField.text!,
            email: self.emailTextField.text!,
            age: Int(self.ageTextField.text!)!)
        
        self.viewModel?.createPerson(person)
    
    }

    @IBAction func didTapCancelButton(sender:AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)    
    }
    
}
