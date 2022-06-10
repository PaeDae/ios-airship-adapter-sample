//
//  AppDelegate.swift
//  airship-adapter-sample
//
//  Created by Andrew Tran on 5/17/22.
//

import UIKit
import AirshipGimbalAdapter
import AirshipKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
                window?.rootViewController = EventsViewController()
                window?.makeKeyAndVisible()
        
        Airship.takeOff(launchOptions: launchOptions)
        Airship.push.userPushNotificationsEnabled = true
        Airship.push.defaultPresentationOptions = [.alert, .badge, .sound]
        AirshipGimbalAdapter.shared.shouldTrackCustomEntryEvents = true
        AirshipGimbalAdapter.shared.shouldTrackCustomExitEvents = true
        AirshipGimbalAdapter.shared.start("YOUR_GIMBAL_API_KEY")
        AirshipGimbalAdapter.shared.restore()
        
        print("My Application Channel ID: \(String(describing: Airship.channel.identifier))")
            
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
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse) async {
        self.notifyAndSavePlaceEventWith(
            firstDescriptor: "Background Notification Received",
            secondDescriptor: Date().toFormattedLocalString()
        )
    }
    
    private func notifyAndSavePlaceEventWith(firstDescriptor: String, secondDescriptor: String) {
        let newEvent = AdapterEvent(firstDescriptor: firstDescriptor, secondDescriptor: secondDescriptor)
        DefaultsService.shared().save(event: newEvent)
        
        NotificationCenter.default.post(name: .didReceiveNewGimbalEvent, object: nil)
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        self.notifyAndSavePlaceEventWith(
            firstDescriptor: "Foreground Notification Received",
            secondDescriptor: Date().toFormattedLocalString()
        )
        completionHandler([.banner, .list, .sound])
    }
}

