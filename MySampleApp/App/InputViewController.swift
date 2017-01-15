//
//  InputViewController.swift
//  StreetStatus
//
//
//

import UIKit
import AWSMobileHubHelper

class InputViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var pickClub: UIPickerView!
    let pickerData = ["Cannon","Cap & Gown","Charter","Cloister","Colonial","Cottage","Ivy","Quad","Terrace","Tiger Inn","Tower"]
    
    @IBOutlet weak var pickerDate: UIDatePicker!
    @IBOutlet weak var selectStatus: UISegmentedControl!
    @IBOutlet weak var dayOfWeek: UILabel!
    
    
    override func viewDidLoad() {
        
        self.view.addBackground()
        
        pickClub.dataSource = self
        pickClub.delegate = self
        
        pickerDate.setValue(UIColor.whiteColor(), forKey: "textColor")
        
        // day of the week today (just to initialize)
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE"
        var result = formatter.stringFromDate(today)
        dayOfWeek.text = result
    }
    
    // data sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // font color
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        return myTitle
    }
    
    // capture picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedClub = pickerData[row]
    }
    
    // date picker format
    @IBAction func datePickerAction(sender: UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        var strDate = dateFormatter.stringFromDate(pickerDate.date)
        self.dayOfWeek.text = strDate
        
    }
    
    
    // get selected values
    @IBAction func pushSubmit(sender: UIButton) {
        
        // get club
        let selectedClub = pickerData[pickClub.selectedRowInComponent(0)]
        print(selectedClub)
        
        // get date
        let selectedDate = self.pickerDate.date
        let timeZoneAdjust = NSCalendar.currentCalendar().dateByAddingUnit(.Hour, value: -5, toDate: selectedDate, options: [])!
        print(selectedDate)
        
        // get status
        let selectedStatus: String = selectStatus.titleForSegmentAtIndex(selectStatus.selectedSegmentIndex)!
        print(selectedStatus)
        
        // check if date is out of 5-day range
        let today = NSDate()
        let yesterday = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: -1, toDate: today, options: [])
        let fiveDays = NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: 4, toDate: today, options: [])
        if !(selectedDate.isBetween(yesterday!, andDate: fiveDays!)) {
            sendAlert()
        }
        
        // enter info into database..
        
        
    }
    
    func sendAlert() {
        let alertController = UIAlertController(title: "Out of Range", message: "Please enter a date within the next 5 days", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

extension NSDate {
    func isBetween(date: NSDate, andDate: NSDate) -> Bool {
        return date.compare(self).rawValue * self.compare(andDate).rawValue >= 0
    }
}
