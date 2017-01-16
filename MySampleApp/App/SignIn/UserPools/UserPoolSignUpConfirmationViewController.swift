//
//  UserPoolSignUpConfirmationViewController.swift
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

class UserPoolSignUpConfirmationViewController : UIViewController {
    
    var sentTo: String?
    var user: AWSCognitoIdentityUser?
    
    @IBOutlet weak var codeSentTo: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var confirmationCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.text = self.user!.username;
        self.view.addBackground()
        userName.backgroundColor = UIColor.clearColor()
        userName.borderStyle = UITextBorderStyle.None
        confirmationCode.backgroundColor = UIColor.clearColor()
        confirmationCode.borderStyle = UITextBorderStyle.None
    }
    
    @IBAction func onConfirm(sender: AnyObject) {
        guard let confirmationCodeValue = self.confirmationCode.text where !confirmationCodeValue.isEmpty else {
            UIAlertView(title: "Confirmation code missing.",
                        message: "Please enter a valid confirmation code.",
                        delegate: nil,
                        cancelButtonTitle: "Ok").show()
            return
        }
        self.user?.confirmSignUp(self.confirmationCode.text!, forceAliasCreation: true).continueWithBlock({[weak self] (task: AWSTask) -> AnyObject? in
            guard let strongSelf = self else { return nil }
            dispatch_async(dispatch_get_main_queue(), { 
                if let error = task.error {
                    UIAlertView(title: error.userInfo["__type"] as? String,
                        message: error.userInfo["message"] as? String,
                        delegate: nil,
                        cancelButtonTitle: "Ok").show()
                } else {
                    UIAlertView(title: "Registration Complete",
                        message: "Registration was successful.",
                        delegate: nil,
                        cancelButtonTitle: "Ok").show()
                    strongSelf.navigationController?.popToRootViewControllerAnimated(true)
                }
            })
            return nil
        })
    }
    
    @IBAction func onResendConfirmationCode(sender: AnyObject) {
        self.user?.resendConfirmationCode().continueWithBlock({[weak self] (task: AWSTask) -> AnyObject? in
            guard let _ = self else { return nil }
            dispatch_async(dispatch_get_main_queue(), { 
                if let error = task.error {
                    UIAlertView(title: error.userInfo["__type"] as? String,
                        message: error.userInfo["message"] as? String,
                        delegate: nil,
                        cancelButtonTitle: "Ok").show()
                } else if let result = task.result as? AWSCognitoIdentityUserResendConfirmationCodeResponse {
                    UIAlertView(title: "Code Resent",
                        message: "Code resent to \(result.codeDeliveryDetails?.destination!)",
                        delegate: nil,
                        cancelButtonTitle: "Ok").show()
                }
            })
            return nil
        })
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
