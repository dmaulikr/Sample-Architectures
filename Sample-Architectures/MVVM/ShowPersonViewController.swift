//
//  ShowPersonViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 27/07/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit

class ShowPersonViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel:UILabel!
    @IBOutlet private weak var emailLabel:UILabel!
    @IBOutlet private weak var ageLabel:UILabel!

    var viewModel:ShowPersonViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
