//
//  AppDelegate.swift
//  GoodAsOldPhones
//
//  Created by Andrew Byrne on 3/4/16.
//  Copyright © 2016 Andrew Byrne. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        var launchedFromShortCut = false
        
        initCartAction()
        
        //Check for ShortCutItem
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem
        {
            launchedFromShortCut = true
            self.handleShortCutItem(shortcutItem)
        }
        
        return !launchedFromShortCut
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        // I may have updated the cart surign this session, so update the Cart Info action
        initCartAction()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        print("Shortcut tapped")
        completionHandler(handleShortCutItem(shortcutItem) )
        
    }
    
    func handleShortCutItem( shortcutItem:UIApplicationShortcutItem ) -> Bool {
        print("Handling shortcut")
        
        var succeeded = false
        
        if( shortcutItem.type == "andrewjbyrne.goodasoldphones.cart-info" ) {
            
            // I'm not doing much here right now. I coudl launch a particular view controller
            // or perform another action. For the moment, let's just print the type of shortcut item
            print("- Handling \(shortcutItem.type)")
            
            succeeded = true
            
        }
        
        return succeeded
        
    }
    
    func initCartAction() {
        UIApplication.sharedApplication().shortcutItems?.removeAll()
        
        let ordersInCart = Orders.readOrdersFromArchive()
        
        var info: String
        
        if (ordersInCart.count == 0) {
            info = "cart is empty"
        }
        else {
            var total: Double = 0.0
            for order in ordersInCart {
                total = total + order.productPrice
            }
            
            info = "Orders: \(ordersInCart.count) Total:$\(total)"
        }
        
        /* Using an icon from the UIApplicationShortcutItemType enum found
        at https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UIApplicationShortcutIcon_Class/index.html#//apple_ref/c/tdef/UIApplicationShortcutIconType
        */
        
        let shortcutItem = UIApplicationShortcutItem(type: "andrewjbyrne.goodasoldphones.cart-info", localizedTitle: "Cart Info", localizedSubtitle: info, icon: UIApplicationShortcutIcon(type: .Love), userInfo: nil)
        
        
        UIApplication.sharedApplication().shortcutItems = [shortcutItem]
        

        
    }


}

