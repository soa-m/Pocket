//
//  AppDelegate.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/05/15.
//

import UIKit
import RealmSwift
import UserNotifications
import os


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // first time to launch this app
        
        
        
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: nil,
            deleteRealmIfMigrationNeeded: true)
        
        Realm.Configuration.defaultConfiguration = config
        
        let defaults = UserDefaults.standard
        let dic = ["firstLaunch": true]
        defaults.register(defaults: dic)
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        
        // 通知許可の取得
        UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                        if !granted {
                            let alert = UIAlertController(title: "エラー", message: "プッシュ通知が拒否されています。設定から有効にしてください。", preferredStyle: .alert)
                            let closeAction = UIAlertAction(title: "閉じる", style: .default) { _ in exit(1) }
                            alert.addAction(closeAction)
                            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
                        }
                    })
                UNUserNotificationCenter.current().delegate = self
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


}
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([[.banner, .list, .sound]])
    }
}



