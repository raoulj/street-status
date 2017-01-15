//
//  UserPoolForgotPasswordViewController.swift
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
//

import Foundation
import UIKit
import AWSCognitoIdentityProvider
import AWSMobileHubHelper

class UserPoolForgotPasswordViewController: UIViewController {
    
    var pool: AWSCognitoIdentityUserPool?
    var user: AWSCognitoIdentityUser?
    
    @IBOutlet weak var userName: UITextField!
    
    @IBAction func onForgotPassword(sender: AnyObject) {
        guard let username = self.userName.text where !username.isEmpty else {
            UIAlertView(title: "Missing UserName",
                        message: "Please enter a valid user name.",
                        delegate: nil,
                        cancelButtonTitle: "Ok").show()
            return
        }
        
        self.user = self.pool?.getUser(self.userName.text!)
        self.user?.forgotPassword().continueWithBlock({[weak self] (task: AWSTask) -> AnyObject? in
            guard let strongSelf = self else {return nil}
            dispatch_async(dispatch_get_main_queue(), {
                if let error = task.error {
                    UIAlertView(title: error.userInfo["__type"] as? String,
                        message: error.userInfo["message"] as? String,
                        delegate: nil,
                        cancelButtonTitle: "Ok").show()
                } else {
                    strongSelf.performSegueWithIdentifier("NewPasswordSegue", sender: sender)
                }
            })
            return nil
        })
        
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pool = AWSCognitoIdentityUserPool.init(forKey: AWSCognitoUserPoolsSignInProviderKey)
        self.view.addBackground()
        userName.backgroundColor = UIColor.clearColor()
        userName.borderStyle = UITextBorderStyle.None
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let newPasswordViewController = segue.destinationViewController as? UserPoolNewPasswordViewController {
            newPasswordViewController.user = self.user
        }
    }
}
