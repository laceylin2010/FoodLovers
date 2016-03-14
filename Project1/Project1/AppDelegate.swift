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
        navigationBar.barTintColor = UIColor(red: 9.0/255.0, green: 170.0/255.0, blue: 20.0/255.0, alpha: 1.0/255.0)
        
        let tabBar = UITabBar.appearance()
        tabBar.barTintColor = UIColor(red: 9.0/255.0, green: 170.0/255.0, blue: 20.0/255.0, alpha: 1.0/255.0)
        tabBar.tintColor = UIColor.blackColor()


        
        return true
    }


}

