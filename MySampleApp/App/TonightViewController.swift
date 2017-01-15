//
//  TonightViewController.swift
//  StreetStatus
//
//
//

import UIKit
import AWSMobileHubHelper

class TonightViewController: UIViewController {
    
    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var listOfOpenClubs: UITextView!
    
    override func viewDidLoad() {
        
        self.view.addBackground()
        
        // date
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE MMMM d"
        let result = formatter.stringFromDate(today)
        todayDate.text = result
        
        listOfOpenClubs.text = ""
        compileListOfOpenClubs()
        
    }
    
    func compileListOfOpenClubs() {
        
        // could probably also do this in a loop but I wasn't sure how we were gonna set up the database
        
        // if Cannon is open..
        let cannonText = "Cannon\n"
        listOfOpenClubs.text.appendContentsOf(cannonText)
        
        // if Cap is open..
        let capText = "Cap & Gown\n"
        listOfOpenClubs.text.appendContentsOf(capText)
        
        // if Charter is open..
        let charterText = "Charter\n"
        listOfOpenClubs.text.appendContentsOf(charterText)
        
        // if Cloister is open..
        let cloisterText = "Cloister\n"
        listOfOpenClubs.text.appendContentsOf(cloisterText)
        
        // if Colonial is open..
        let colonialText = "Colonial\n"
        listOfOpenClubs.text.appendContentsOf(colonialText)
        
        // if Cottage is open..
        let cottageText = "Cottage\n"
        listOfOpenClubs.text.appendContentsOf(cottageText)
        
        // if Ivy is open..
        let ivyText = "Ivy\n"
        listOfOpenClubs.text.appendContentsOf(ivyText)
        
        // if Quad is open..
        let quadText = "Quad\n"
        listOfOpenClubs.text.appendContentsOf(quadText)
        
        // if Terrace is open..
        let terraceText = "Terrace\n"
        listOfOpenClubs.text.appendContentsOf(terraceText)
        
        // if TI is open..
        let tiText = "Tiger Inn\n"
        listOfOpenClubs.text.appendContentsOf(tiText)
        
        // if Tower is open..
        let towerText = "Tower\n"
        listOfOpenClubs.text.appendContentsOf(towerText)
 
        if listOfOpenClubs.text == "" {
            let campusText = "Campus Club is ALWAYS open"
            listOfOpenClubs.text.appendContentsOf(campusText)
        }
    }
    
}
