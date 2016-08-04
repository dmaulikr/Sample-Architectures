//
//  ShowPersonViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 27/07/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit

class MVVMShowPersonViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel:UILabel!
    @IBOutlet private weak var emailLabel:UILabel!
    @IBOutlet private weak var ageLabel:UILabel!

    var viewModel:MVVMShowPersonViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = self.viewModel!.nameText
        self.emailLabel.text = self.viewModel!.emailText
        self.ageLabel.text = self.viewModel!.ageText
        
    }

}
