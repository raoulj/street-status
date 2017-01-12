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
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        let iconHW = CGFloat(80)
        
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
        cannonButton.frame = CGRect(x: 2 * xgap + iconHW, y: ygap, width: iconHW, height: iconHW)
        capButton.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: ygap, width: iconHW, height: iconHW)
        charterButton.frame = CGRect(x: xgap, y: 2*ygap + iconHW, width: iconHW, height: iconHW)
        cloisterButton.frame = CGRect(x: 2 * xgap + iconHW, y: 2*ygap + iconHW, width: iconHW, height: iconHW)
        colonialButton.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 2*ygap + iconHW, width: iconHW, height: iconHW)
        cottageButton.frame = CGRect(x: xgap, y: 3 * ygap + 2 * iconHW, width: iconHW, height: iconHW)
        ivyButton.frame = CGRect(x: 2 * xgap + iconHW, y: 3 * ygap + 2 * iconHW, width: iconHW, height: iconHW)
        quadButton.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 3 * ygap + 2 * iconHW, width: iconHW, height: iconHW)
        terraceButton.frame = CGRect(x: xgap, y: 4 * ygap + 3 * iconHW, width: iconHW, height: iconHW)
        tiButton.frame = CGRect(x: 2 * xgap + iconHW, y: 4 * ygap + 3 * iconHW, width: iconHW, height: iconHW)
        towerButton.frame = CGRect(x: 3 * xgap + 2 * iconHW, y: 4 * ygap + 3 * iconHW, width: iconHW, height: iconHW)
        
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

    
    private func setNavBarTitleTo(message : String)
    {
    }
    
}

