//
//  MainMenuTableViewController.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 3/08/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit

enum MenuOptions:Int {
    case MVC = 0
    case MVVM = 1
    case Viper = 2
    case PureMVC = 3
    
    var storyboardName:String {
        switch self {
        case .MVC: return "RegularMVC"
        case .MVVM: return "MVVM"
        case .Viper: return "Viper"
        case .PureMVC: return "PureMVC"
        }
    }

    var rootViewControllerName:String {
        switch self {
        case .MVC: return "MVCListPeopleViewController"
        case .MVVM: return "MVVMListPeopleViewController"
        case .Viper: return "Viper"
        case .PureMVC: return "PureMVC"
        }
    }
    
}

class MainMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let menuOption = MenuOptions(rawValue: indexPath.row)
        
        let storyboard = UIStoryboard(name: menuOption!.storyboardName, bundle: NSBundle.mainBundle())
        
        let viewController = storyboard.instantiateViewControllerWithIdentifier(menuOption!.rootViewControllerName)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
