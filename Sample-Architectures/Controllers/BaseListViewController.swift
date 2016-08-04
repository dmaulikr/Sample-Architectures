//
//  BaseListViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/08/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit

private extension Selector {
    
    static let DidTapAddButton = #selector(BaseListViewController.didTapAddButton(_:))
    
}

class BaseListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: .DidTapAddButton)
        
        self.navigationItem.rightBarButtonItems = [addBarButtonItem,self.editButtonItem()]
        
    }

    func didTapAddButton(sender: AnyObject) {
        if let viewController = self.prepareAddViewController() {
            self.presentViewController(viewController, animated: true, completion: nil)
        }
    }

}

extension BaseListViewController {
    
    func prepareAddViewController() -> UIViewController? { return nil }
    
}
