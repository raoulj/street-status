//
//  AppDelegate.swift
//  MySampleApp
//
//
// Copyright 2016 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.8
//

import UIKit
import AWSMobileHubHelper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.
        let launchWasSuccessful = AWSMobileClient.sharedInstance.didFinishLaunching(application, withOptions: launchOptions)
        
        // if the user is logged in, we immediate present the main view, else we display the loginview controller
        if (!AWSIdentityManager.defaultIdentityManager().loggedIn) {
            // the user is not logged in, show the login screen
            presentSignInViewController()
            //else we continue to the home
        }

        return launchWasSuccessful
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        // print("application application: \(application.description), openURL: \(url.absoluteURL), sourceApplication: \(sourceApplication)")
        return AWSMobileClient.sharedInstance.withApplication(application, withURL: url, withSourceApplication: sourceApplication, withAnnotation: annotation)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        /*if (AWSIdentityManager.defaultIdentityManager().loggedIn) {
            AWSIdentityManager.defaultIdentityManager().logoutWithCompletionHandler({(result: AnyObject?, error: NSError?) -> Void in
                print("logged the user out")
            })
        }*/
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        AWSMobileClient.sharedInstance.applicationDidBecomeActive(application)
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        // Clear the badge icon when you open the app.
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        AWSMobileClient.sharedInstance.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        AWSMobileClient.sharedInstance.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        AWSMobileClient.sharedInstance.application(application, didReceiveRemoteNotification: userInfo)
    }
    
    // MARK: Private helper methods
    
    private func presentSignInViewController() {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        
        let initialViewController = storyboard.instantiateViewControllerWithIdentifier("SignInHome")
        
        let navigationController = UINavigationController(rootViewController: initialViewController)
        
        self.window?.rootViewController = navigationController
        
        makeNavBarTransparent(navigationController)
        
    }
    
    private func makeNavBarTransparent(navigationController: UINavigationController) {
        navigationController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.translucent = true
    }
    
}

