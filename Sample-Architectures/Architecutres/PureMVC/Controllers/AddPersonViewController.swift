//
//  AddPersonViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo Gomes on 7/8/17.
//  Copyright © 2017 Technophile IT. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {

    @IBOutlet fileprivate weak var nameTextField:UITextField!
    @IBOutlet fileprivate weak var emailTextField:UITextField!
    @IBOutlet fileprivate weak var ageTextField:UITextField!
    
//    var delegate:AddPersonDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapCancelButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapDoneButton(_ sender: AnyObject) {
        
        let person = Person(
            name: self.nameTextField.text!,
            email: self.emailTextField.text!,
            age: Int(self.ageTextField.text!)!)
        
        do {
            try AppDelegate.dataStore.create(person) {
//                self.delegate?.didAddPerson(person)
                self.dismiss(animated: true, completion: nil)
            }
        }
        catch {
            
        }
        
    }

}
