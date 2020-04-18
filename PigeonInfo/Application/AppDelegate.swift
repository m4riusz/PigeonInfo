//
//  AppDelegate.swift
//  PigeonInfo
//
//  Created by Mariusz Sut on 14/04/2020.
//  Copyright © 2020 Mariusz Sut. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var mainCoordinator: MainCoordinator!
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        mainCoordinator = MainCoordinator(window: window!)
        mainCoordinator.start()
        window?.makeKeyAndVisible()
        return true
    }
}
