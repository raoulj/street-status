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
    
    override func viewDidLoad() {
        
        self.view.addBackground()
        
        pickClub.dataSource = self
        pickClub.delegate = self
        
        pickerDate.setValue(UIColor.whiteColor(), forKey: "textColor")
        
        
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
    
}
