//
//  ClubViewController.swift
//  StreetStatus
//
//
//

import UIKit
import AWSMobileHubHelper

class ClubViewController: UIViewController {
    
    let LOW_CONF_MAX = 0.50
    let MED_CONF_MAX = 0.75
    
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var viaSegueLabel: UILabel!
    var viaSegue = ""
    let openString = "Open"
    let closedString = "Closed"
    let highLevel = "HIGH"
    let medLevel = "MED"
    let lowLevel = "LOW"
    
    // dates
    @IBOutlet weak var dayOne: UILabel!
    @IBOutlet weak var dayTwo: UILabel!
    @IBOutlet weak var dayThree: UILabel!
    @IBOutlet weak var dayFour: UILabel!
    @IBOutlet weak var dayFive: UILabel!
    
    // statuses
    @IBOutlet weak var dayOneStatus: UILabel!
    @IBOutlet weak var dayTwoStatus: UILabel!
    @IBOutlet weak var dayThreeStatus: UILabel!
    @IBOutlet weak var dayFourStatus: UILabel!
    @IBOutlet weak var dayFiveStatus: UILabel!
    
    // Levels of certainty
    @IBOutlet weak var dayOneLevel: UILabel!
    @IBOutlet weak var dayTwoLevel: UILabel!
    @IBOutlet weak var dayThreeLevel: UILabel!
    @IBOutlet weak var dayFourLevel: UILabel!
    @IBOutlet weak var dayFiveLevel: UILabel!
    
    //arrays for of the labels for convenience
    private var dayStatuses : [UILabel] = [];
    private var dayLevel : [UILabel] = [];
    
    
    override func viewDidLoad() {
        
        //background
        self.view.addBackground()
        
        // club specifics
        viaSegueLabel.text = viaSegue
        let image = UIImage(named: viaSegue)
        clubImage.image = image!
        
        // dates
        setDates()
        
        dayStatuses = [
            dayOneStatus, dayTwoStatus, dayThreeStatus, dayFourStatus, dayFiveStatus
        ];
        
        dayLevel = [
            dayOneLevel, dayTwoLevel, dayThreeLevel, dayFourLevel, dayFiveLevel
        ];
        
        // if Campus
        if viaSegue == "Campus Club" {
            handleCampus()
        }
        
        else {
            handleOthers(viaSegue)
        }
        
    }
    
    // update next 5 days
    func setDates() {
        
        var today = NSDate()
        let timeZoneAdjust = NSCalendar.currentCalendar().dateByAddingUnit(.Hour, value: -5, toDate: today, options: [])!
        today = timeZoneAdjust
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d"
        var result = formatter.stringFromDate(today)
        dayOne.text = result
        
        let tomorrow = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: 1, toDate: today, options: [])
        result = formatter.stringFromDate(tomorrow!)
        dayTwo.text = result
        
        let day3 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: 2, toDate: today, options: [])
        result = formatter.stringFromDate(day3!)
        dayThree.text = result
        
        let day4 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: 3, toDate: today, options: [])
        result = formatter.stringFromDate(day4!)
        dayFour.text = result
        
        let day5 = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: 4, toDate: today, options: [])
        result = formatter.stringFromDate(day5!)
        dayFive.text = result
    }
    
    func handleCampus() {
        
        // statuses
        dayOneStatus.text = openString
        dayTwoStatus.text = openString
        dayThreeStatus.text = openString
        dayFourStatus.text = openString
        dayFiveStatus.text = openString
        
        // levels
        dayOneLevel.text = highLevel
        dayTwoLevel.text = highLevel
        dayThreeLevel.text = highLevel
        dayFourLevel.text = highLevel
        dayFiveLevel.text = highLevel
        
        // colors
        dayOneLevel.textColor = UIColor.greenColor()
        dayTwoLevel.textColor = UIColor.greenColor()
        dayThreeLevel.textColor = UIColor.greenColor()
        dayFourLevel.textColor = UIColor.greenColor()
        dayFiveLevel.textColor = UIColor.greenColor()
    }
    
    ////////////////////////////////////
    
    func handleOthers(club: String) {
        
        var date = NSDate() //date starts out as today
        let clubStatusInterface = ClubStatusInterface()
        
        for i in 0..<5 {
            clubStatusInterface.getClubStatusForDate(club, date: date) { (clubStatus, errors) in
                self.dayStatuses[i].text = (clubStatus!.isOpen()) ? "Open" : "Closed"
                let confidence = clubStatus?.getConfidence()
                
                if (confidence < self.LOW_CONF_MAX) {
                    self.dayLevel[i].textColor = UIColor.redColor()
                    self.dayLevel[i].text = self.lowLevel
                } else if (confidence < self.MED_CONF_MAX) {
                    self.dayLevel[i].textColor = UIColor.yellowColor()
                    self.dayLevel[i].text = self.medLevel
                } else {
                    self.dayLevel[i].textColor = UIColor.greenColor()
                    self.dayLevel[i].text = self.highLevel
                }
            }
            
            //get the next day
            date = NSCalendar.currentCalendar()
                .dateByAddingUnit(
                    .Day,
                    value: 1,
                    toDate: date,
                    options: []
                )!
        }
    }
    
    ////////////////////////////////////
    
    func ifOpen(dayBlankStatus: UILabel) {
        dayBlankStatus.text = openString
    }
    
    func ifClosed(dayBlankStatus: UILabel) {
        dayBlankStatus.text = closedString
    }
    
    func ifHighLevelOfCertainty(dayBlankLevel: UILabel) {
        dayBlankLevel.text = highLevel
        dayBlankLevel.textColor = UIColor.greenColor()
    }
    
    func ifMedLevelOfCertainty(dayBlankLevel: UILabel) {
        dayBlankLevel.text = medLevel
        dayBlankLevel.textColor = UIColor.yellowColor()
    }
    
    func ifLowLevelOfCertainty(dayBlankLevel: UILabel) {
        dayBlankLevel.text = lowLevel
        dayBlankLevel.textColor = UIColor.redColor()
    }
    
}
