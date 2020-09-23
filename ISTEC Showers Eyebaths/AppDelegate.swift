//
//  AppDelegate.swift
//  ISTEC Showers Eyebaths
//  Safety Shower Builder
//
//  Created by Doruk Türkuçar on 20.09.2020.
//  Copyright © 2020 IST Safety Ltd. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //delay splash screen
        RunLoop.current.run(until: NSDate(timeIntervalSinceNow:2) as Date)
        //finished delaying
        //ask permission
        registerForPushNotifications()
        //ask permission
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    //Force landscape or portrait
    var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
    struct AppUtility {
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }

        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }
    }
    
    //Ask permission
    
    func getNotificationSettings() {
         UNUserNotificationCenter.current().getNotificationSettings { settings in
           print("Notification settings: \(settings)")
          guard settings.authorizationStatus == .authorized else { return }
           DispatchQueue.main.async {
             UIApplication.shared.registerForRemoteNotifications()
           }
           }
         }
       
    func registerForPushNotifications() {
         UNUserNotificationCenter.current()
           .requestAuthorization(options: [.alert, .sound, .badge]) {
             [weak self] granted, error in
             print("Permission granted: \(granted)")
             guard granted else { return }
             self?.getNotificationSettings()
         }
       }
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
      let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
      let token = tokenParts.joined()
      print("Device Token: \(token)")
    }

    func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Failed to register: \(error)")
    }
    
    //Ask permission
 
}
