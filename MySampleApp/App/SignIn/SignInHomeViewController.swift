//
//  SignInViewController.swift
//  MySampleApp
//
//

import UIKit
import AWSMobileHubHelper

class SignInHomeViewController: UIViewController {
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("Loading the Home Login view.")
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        navigationController?.view.backgroundColor = UIColor.clearColor()
        navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        
        // background
        self.view.addBackground()
        
    }
    
    
    // MARK: - Utility Methods

    
    
    // MARK: - IBActions

    @IBAction func createAccountPressed(sender: AnyObject) {
        print("Create account button pressed.")
        let storyboard = UIStoryboard(name: "UserPools", bundle: nil)
        let view = storyboard.instantiateViewControllerWithIdentifier("SignUp")
        self.navigationController?.pushViewController(view, animated: true)
    }
}
