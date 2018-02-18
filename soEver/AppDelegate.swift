//
//  AppDelegate.swift
//  soEver
//
//  Created by Andres Felipe Ocampo Eljaiesk on 29/1/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        customUI()
        APiTaskManager.shared.cargarDatos()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        APiTaskManager.shared.salvarDatos()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    func customUI(){
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        navBar.barTintColor = CONSTANTES.COLORES.COLOR_NAV_TAB
        tabBar.barTintColor = CONSTANTES.COLORES.COLOR_NAV_TAB
        navBar.tintColor = CONSTANTES.COLORES.COLOR_TEXT_NAV
        tabBar.tintColor = CONSTANTES.COLORES.COLOR_TEXT_NAV
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : CONSTANTES.COLORES.COLOR_TEXT_NAV]
    }


}

