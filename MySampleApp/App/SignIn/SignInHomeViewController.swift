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
        print("Sign In Loading.")
        
        
        // Custom UI Setup
        //customProviderButton.addTarget(self, action: "handleCustomSignIn", forControlEvents: .TouchUpInside)
        //customCreateAccountButton.addTarget(self, action: "handleUserPoolSignUp", forControlEvents: .TouchUpInside)
        //customForgotPasswordButton.addTarget(self, action: "handleUserPoolForgotPassword", forControlEvents: .TouchUpInside)
        //customProviderButton.setImage(UIImage(named: "LoginButton"), forState: .Normal)
        
        
    }
    
    deinit {
        //NSNotificationCenter.defaultCenter().removeObserver(didSignInObserver)
    }
    
    // MARK: - Utility Methods

    
    
    // MARK: - IBActions

    @IBAction func createAccountPressed(sender: AnyObject) {
        print("test")
    }
}
//
//let storyboard = UIStoryboard(name: "UserPools", bundle: nil)
//let view = storyboard.instantiateViewControllerWithIdentifier("SignUp")
//self.navigationController?.pushViewController(view, animated: true)
