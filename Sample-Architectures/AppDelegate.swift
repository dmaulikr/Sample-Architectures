//
//  AppDelegate.swift
//  Sample-Architectures
//
//  Created by Ronaldo GomesJr on 4/04/2016.
//  Copyright © 2016 Technophile IT. All rights reserved.
//

import UIKit
import JLRoutes

enum Architecture {
    case MVC, MVVM, PureMVC, Viper
    
    init?(name: String) {
        switch name {
        case "MVC": self = .MVC
        case "MVVM": self = .MVVM
        case "PureMVC": self = .PureMVC
        case "Viper": self = .Viper
        default: return nil
        }
    }
    
    var storyboardPath: String { return "main" }
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var architecture: Architecture?
    
    static let people = [
        Person(name: "Ron", email: "ronaldo@frontfoot.com.au", age: 37),
        Person(name: "Gomes", email: "gomes@frontfoot.com.au", age: 30)
    ]

    static let dataStore = MemStore<Person>(elements: AppDelegate.people)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        AppDelegate.architecture = Architecture(name: ProcessInfo.processInfo.environment["Architecture"]!)
        let storyboard = UIStoryboard(name: "main", bundle: nil)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.tintColor = UIColor(red: 29.0/255.0, green: 173.0/255.0, blue: 234.0/255.0, alpha: 1.0)
        
        switch AppDelegate.architecture! {
        case .Viper: self.window!.rootViewController = ListPeopleWireFrame.createListPeople()
        default: self.window!.rootViewController = storyboard.instantiateInitialViewController()!
        }
        
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        
        //TODO: This is an attempt to implement Routes
//        JLRoutes.addRoute("/person/:email") { (params: [AnyHashable: Any]!) -> Bool in
//            guard let email = params["email"] as? String else { return false }
        
//            var person:Person?
//            AppDelegate.dataStore.fetch({ people in
//                
//                person = people.filter({ (person) -> Bool in
//                    return person.email == email
//                }).first!
//                
//            })
//            
//            if let person = person {
//                
//                let viewModel = MVVMShowPersonViewModel(person: person)
//                viewModel.person = person
//                
//                let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MVVMShowPersonViewController") as! MVVMShowPersonViewController
//                viewController.viewModel = viewModel
//                
//                let currentNavigationController = self.window!.rootViewController! as! UINavigationController
//                let currentViewController = currentNavigationController.viewControllers.first
//                
//                currentViewController!.navigationController!.pushViewController(viewController, animated: true)
//                
//                return true
//            }
        
        
        
//            return false
//        }
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        return JLRoutes.routeURL(url)
    }
    

}

