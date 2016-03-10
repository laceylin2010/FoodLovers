//
//  AppDelegate.swift
//  Project1
//
//  Created by Lacey Vu on 2/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 246.0/255.0, blue: 102.0/255.0, alpha: 0.0)
        
        let tabBar = UITabBar.appearance()
        tabBar.barTintColor = UIColor(red: 255.0/255.0, green: 246.0/255.0, blue: 102.0/255.0, alpha: 0.0)

        return true
    }



}

