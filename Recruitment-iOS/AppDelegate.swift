//
//  AppDelegate.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        let networkManager = NetworkingManager.sharedManager

        let resolver = DIResolver(networkController: networkManager)
        let startScreenController = resolver.presentStartScreenViewController()
        let navigationController = UINavigationController(rootViewController: startScreenController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
    }

}

