//
//  AppDelegate.swift
//  SCGTest
//
//  Created by Irshad Ahmad on 04/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        App.makeRootView()
        return true
    }

}

