//
//  StreetViewController.swift
//  StreetSmart
//
//  Created by Kira Ivarsson on 1/15/17.
//
//

import Foundation
import UIKit
import AWSMobileHubHelper

class StreetViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // background
        self.view.addBackground()
    }
    
    // prepare for segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let clubView = segue.destinationViewController as! ClubViewController
        
        // pass the clicked club to the next view controller
        let buttonPushed = sender as! UIButton
        let selectedClub = buttonPushed.titleLabel!
        let clubName: String = selectedClub.text!
        clubView.viaSegue = clubName
    }
}


