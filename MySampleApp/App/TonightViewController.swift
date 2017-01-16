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
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var goodLuck: UILabel!
    var clubCount = 0
    
    override func viewDidLoad() {
        
        self.view.addBackground()
        
        // date
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE MMMM d"
        var result = formatter.stringFromDate(today)
        let tomorrow = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: 1, toDate: today, options: [])
        result = formatter.stringFromDate(tomorrow!)
        todayDate.text = result
        
        listOfOpenClubs.text = ""
        compileListOfOpenClubs()
        
    }
    
    func compileListOfOpenClubs() {
        
        // could probably also do this in a loop but I wasn't sure how we were gonna set up the database
        
        goodLuck.hidden = true
        
        // if Cannon is open..
        let cannonText = "Cannon\n"
        listOfOpenClubs.text.appendContentsOf(cannonText)
        clubCount++
        
        // if Cap is open..
        let capText = "Cap & Gown\n"
        listOfOpenClubs.text.appendContentsOf(capText)
        clubCount++
        
        // if Charter is open..
        let charterText = "Charter\n"
        listOfOpenClubs.text.appendContentsOf(charterText)
        clubCount++
        
        // if Cloister is open..
        let cloisterText = "Cloister\n"
        listOfOpenClubs.text.appendContentsOf(cloisterText)
        clubCount++
        
        // if Colonial is open..
        let colonialText = "Colonial\n"
        listOfOpenClubs.text.appendContentsOf(colonialText)
        clubCount++
        
        // if Cottage is open..
        let cottageText = "Cottage\n"
        listOfOpenClubs.text.appendContentsOf(cottageText)
        clubCount++
        
        // if Ivy is open..
        let ivyText = "Ivy\n"
        listOfOpenClubs.text.appendContentsOf(ivyText)
        clubCount++
        
        // if Quad is open..
        let quadText = "Quad\n"
        listOfOpenClubs.text.appendContentsOf(quadText)
        clubCount++
        
        // if Terrace is open..
        let terraceText = "Terrace\n"
        listOfOpenClubs.text.appendContentsOf(terraceText)
        clubCount++
        
        // if TI is open..
        let tiText = "Tiger Inn\n"
        listOfOpenClubs.text.appendContentsOf(tiText)
        clubCount++
        
        // if Tower is open..
        let towerText = "Tower\n"
        listOfOpenClubs.text.appendContentsOf(towerText)
        clubCount++
 
        if listOfOpenClubs.text == "" {
            let campusText = "Campus Club is ALWAYS open"
            listOfOpenClubs.text.appendContentsOf(campusText)
        }
        print(clubCount)
        if clubCount == 11 {
            goodLuck.hidden = false
        }
    }
    
}
