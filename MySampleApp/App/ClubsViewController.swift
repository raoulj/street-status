//
//  ClubsViewController
//  StreetStatus
//
//
//

import UIKit
import AWSMobileHubHelper

class ClubsViewController: UIViewController {
    
    
    @IBOutlet weak var campusButton: UIButton!
    @IBOutlet weak var cannonButton: UIButton!
    @IBOutlet weak var capButton: UIButton!
    @IBOutlet weak var charterButton: UIButton!
    @IBOutlet weak var cloisterButton: UIButton!
    @IBOutlet weak var colonialButton: UIButton!
    @IBOutlet weak var cottageButton: UIButton!
    @IBOutlet weak var ivyButton: UIButton!
    @IBOutlet weak var quadButton: UIButton!
    @IBOutlet weak var terraceButton: UIButton!
    @IBOutlet weak var tiButton: UIButton!
    @IBOutlet weak var towerButton: UIButton!
    
    @IBOutlet weak var campusLabel: UILabel!
    @IBOutlet weak var cannonLabel: UILabel!
    @IBOutlet weak var capLabel: UILabel!
    @IBOutlet weak var charterLabel: UILabel!
    @IBOutlet weak var cloisterLabel: UILabel!
    @IBOutlet weak var colonialLabel: UILabel!
    @IBOutlet weak var cottageLabel: UILabel!
    @IBOutlet weak var ivyLabel: UILabel!
    @IBOutlet weak var quadLabel: UILabel!
    @IBOutlet weak var terraceLabel: UILabel!
    @IBOutlet weak var tiLabel: UILabel!
    @IBOutlet weak var towerLabel: UILabel!
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        let iconHW = CGFloat(80)
        let labelHeight = CGFloat(20)
        
        let xgap = (width - 3 * iconHW) / 4.0
        let ygap = (height - 4 * iconHW) / 5.0
        
        // set background and navbar
        self.view.addBackground()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.view.backgroundColor = UIColor.clearColor()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        
        
        //button positioning code
        campusButton.frame = CGRect(x: xgap, y: ygap, width: iconHW, height: iconHW)
        campusLabel.frame = CGRect(x: xgap, y: iconHW + ygap, width: iconHW, height: labelHeight)
        cannonButton.frame = CGRect(x: 2 * xgap + iconHW, y: ygap, width: iconHW, height: iconHW)
        cannonLabel.frame = CGRect(x: 2 * xgap + iconHW, y: iconHW + ygap, width: iconHW, height: labelHeight)
        capButton.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: ygap, width: iconHW, height: iconHW)
        capLabel.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: iconHW + ygap, width: iconHW, height: labelHeight)
        charterButton.frame = CGRect(x: xgap, y: 2*ygap + iconHW, width: iconHW, height: iconHW)
        charterLabel.frame = CGRect(x: xgap, y: 2 * iconHW + 2 * ygap, width: iconHW, height: labelHeight)
        cloisterButton.frame = CGRect(x: 2 * xgap + iconHW, y: 2*ygap + iconHW, width: iconHW, height: iconHW)
        cloisterLabel.frame = CGRect(x: 2 * xgap + iconHW, y: 2 * iconHW + 2 * ygap, width: iconHW, height: labelHeight)
        colonialButton.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 2*ygap + iconHW, width: iconHW, height: iconHW)
        colonialLabel.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 2 * iconHW + 2 * ygap, width: iconHW, height: labelHeight)
        cottageButton.frame = CGRect(x: xgap, y: 3 * ygap + 2 * iconHW, width: iconHW, height: iconHW)
        cottageLabel.frame = CGRect(x: xgap, y: 3 * iconHW + 3 * ygap, width: iconHW, height: labelHeight)
        ivyButton.frame = CGRect(x: 2 * xgap + iconHW, y: 3 * ygap + 2 * iconHW, width: iconHW, height: iconHW)
        ivyLabel.frame = CGRect(x: 2 * xgap + iconHW, y: 3 * iconHW + 3 * ygap, width: iconHW, height: labelHeight)
        quadButton.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 3 * ygap + 2 * iconHW, width: iconHW, height: iconHW)
        quadLabel.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 3 * iconHW + 3 * ygap, width: iconHW, height: labelHeight)
        terraceButton.frame = CGRect(x: xgap, y: 4 * ygap + 3 * iconHW, width: iconHW, height: iconHW)
        terraceLabel.frame = CGRect(x: xgap, y: 4 * iconHW + 4 * ygap, width: iconHW, height: labelHeight)
        tiButton.frame = CGRect(x: 2 * xgap + iconHW, y: 4 * ygap + 3 * iconHW, width: iconHW, height: iconHW)
        tiLabel.frame = CGRect(x: 2 * xgap + iconHW, y: 4 * iconHW + 4 * ygap, width: iconHW, height: labelHeight)
        towerButton.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 4 * ygap + 3 * iconHW, width: iconHW, height: iconHW)
        towerLabel.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 4 * iconHW + 4 * ygap, width: iconHW, height: labelHeight)
        
        campusButton.backgroundColor = UIColor.clearColor()
        cannonButton.backgroundColor = UIColor.clearColor()
        capButton.backgroundColor = UIColor.clearColor()
        charterButton.backgroundColor = UIColor.clearColor()
        cloisterButton.backgroundColor = UIColor.clearColor()
        colonialButton.backgroundColor = UIColor.clearColor()
        cottageButton.backgroundColor = UIColor.clearColor()
        ivyButton.backgroundColor = UIColor.clearColor()
        quadButton.backgroundColor = UIColor.clearColor()
        terraceButton.backgroundColor = UIColor.clearColor()
        tiButton.backgroundColor = UIColor.clearColor()
        towerButton.backgroundColor = UIColor.clearColor()
        
        campusButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        cannonButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        capButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        charterButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        cloisterButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        colonialButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        cottageButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        ivyButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        quadButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        terraceButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        tiButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        towerButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
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
    
    
    private func setNavBarTitleTo(message : String)
    {
    }
    
}

