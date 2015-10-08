//
//  AppDelegate.swift
//  FWMobile
//
//  Created by Austin Jackson on 9/23/15.
//  Copyright © 2015 Austin Jackson. All rights reserved.
//

import UIKit

public let host_ip: String = "108.197.28.233"
public let host: String = "http://"+host_ip
public var cookie: String = ""

struct keys {
    static let session: String = "net.austinj.FWMobile.data.session"
    static let cookie: String = "net.austinj.FWMobile.data.cookie"
}

public let defaults = NSUserDefaults.standardUserDefaults()

/*Alamofire.request(.GET, FW_Mobile.host + "/api/chat_messages.php", headers: ["Cookie": session])
.responseJSON { response in
if let JSON = response.2.value {
print("Response JSON: \(JSON)") //We got the chat messages!
}

//Next up, populating a TableView

}*/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }

}

