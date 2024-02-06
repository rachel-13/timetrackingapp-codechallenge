//
//  AppDelegate.swift
//  timetracking
//
//  Created by pohz on 05/02/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
    
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        _ = CoreDataStack.shared
        
        return true
    }
}

