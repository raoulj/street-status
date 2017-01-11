//
//  MainViewController.swift
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

class MainViewController: UIViewController {
    
    var demoFeatures: [DemoFeature] = []
    var signInObserver: AnyObject!
    var signOutObserver: AnyObject!
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        
        // Default theme settings.
        navigationController!.navigationBar.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = UIColor(red: 0xF5/255.0, green: 0x85/255.0, blue: 0x35/255.0, alpha: 1.0)
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()

        
        var demoFeature = DemoFeature.init(
            name: NSLocalizedString("User Sign-in",
                comment: "Label for demo menu option."),
            detail: NSLocalizedString("Enable user login with popular 3rd party providers.",
                comment: "Description for demo menu option."),
            icon: "UserIdentityIcon", storyboard: "UserIdentity")
        
        demoFeatures.append(demoFeature)
        
        demoFeature = DemoFeature.init(
            name: NSLocalizedString("Push Notifications",
                comment: "Label for demo menu option."),
            detail: NSLocalizedString("Send individual or group push notifications to your apps.",
                comment: "Description for demo menu option."),
            icon: "PushIcon", storyboard: "PushNotification")
        
        demoFeatures.append(demoFeature)

        demoFeature = DemoFeature.init(
            name: NSLocalizedString("Cloud Logic",
                comment: "Label for demo menu option."),
            detail: NSLocalizedString("Run business logic in the cloud without managing servers. Integrate functionality with your app using APIs.",
                comment: "Description for demo menu option."),
            icon: "CloudLogicAPIIcon", storyboard: "CloudLogicAPI")
        
        demoFeatures.append(demoFeature)
        
        demoFeature = DemoFeature.init(
            name: NSLocalizedString("NoSQL",
                comment: "Label for demo menu option."),
            detail: NSLocalizedString("Store data in the cloud.",
                comment: "Description for demo menu option."),
            icon: "NoSQLIcon", storyboard: "NoSQLDatabase")
        
        demoFeatures.append(demoFeature)

                signInObserver = NSNotificationCenter.defaultCenter().addObserverForName(AWSIdentityManagerDidSignInNotification, object: AWSIdentityManager.defaultIdentityManager(), queue: NSOperationQueue.mainQueue(), usingBlock: {[weak self] (note: NSNotification) -> Void in
                        print("Sign In Observer observed sign in.")
                    
                })
                
                signOutObserver = NSNotificationCenter.defaultCenter().addObserverForName(AWSIdentityManagerDidSignOutNotification, object: AWSIdentityManager.defaultIdentityManager(), queue: NSOperationQueue.mainQueue(), usingBlock: {[weak self](note: NSNotification) -> Void in
                        print("Sign Out Observer observed sign out.")
                })
                
                setupRightBarButtonItem()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(signInObserver)
        NSNotificationCenter.defaultCenter().removeObserver(signOutObserver)
    }

    func setupRightBarButtonItem() {
            struct Static {
                static var onceToken: dispatch_once_t = 0
            }
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, style: .Done, target: self, action: nil)
        
            if (AWSIdentityManager.defaultIdentityManager().loggedIn) {
                navigationItem.rightBarButtonItem!.title = NSLocalizedString("Sign-Out", comment: "Label for the logout button.")
                navigationItem.rightBarButtonItem!.action = "handleLogout"
            }
            if !(AWSIdentityManager.defaultIdentityManager().loggedIn) {
                navigationItem.rightBarButtonItem!.title = NSLocalizedString("Sign-In", comment: "Label for the login button.")
                navigationItem.rightBarButtonItem!.action = "goToLogin"
            }
    }
    

    
    func goToLogin() {
            print("Handling optional sign-in.")
            let loginStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
            let loginController = loginStoryboard.instantiateViewControllerWithIdentifier("SignIn")
            navigationController?.pushViewController(loginController, animated: true)
    }
    
    func handleLogout() {
        if (AWSIdentityManager.defaultIdentityManager().loggedIn) {
            AWSIdentityManager.defaultIdentityManager().logoutWithCompletionHandler({(result: AnyObject?, error: NSError?) -> Void in
            
                self.presentSignInViewController()
                self.navigationController!.popToRootViewControllerAnimated(false)
            })
            // print("Logout Successful: \(signInProvider.getDisplayName)");
        } else {
            assert(false)
        }
    }
    
    
    private func presentSignInViewController() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let initialViewController = storyboard.instantiateViewControllerWithIdentifier("SignInHome")
        
<<<<<<< Updated upstream
        let navigationController = UINavigationController(rootViewController: initialViewController)
=======
        self.dismissViewControllerAnimated(true, completion: nil)
>>>>>>> Stashed changes
        
        // code below is for a gentle navigation to the home view
        let overlayView = self.view.snapshotViewAfterScreenUpdates(false)!
        navigationController.view.addSubview(overlayView)
        appDelegate.window!.rootViewController = navigationController
        UIView.animateWithDuration(0.7, delay: 0, options: .TransitionCrossDissolve, animations: {
            overlayView.alpha = 0}, completion: { finished in
                overlayView.removeFromSuperview()
        })
        
        makeNavBarTransparent(navigationController)
    }
    
    private func makeNavBarTransparent(navigationController: UINavigationController) {
        navigationController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.translucent = true
    }
}

class FeatureDescriptionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "Back", style: .Plain, target: nil, action: nil)
    }
}
