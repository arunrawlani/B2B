

import UIKit
import FBSDKLoginKit

protocol dashboard {
    func itemPressed()
}

class DashboardTableCell: UITableViewCell {
    
    var delegate: dashboard? = nil
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var companyGuideLabel: UILabel!
    @IBOutlet var appointmentDateLabel: UILabel!
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var timeAMPMLabel: UILabel!    
    @IBOutlet weak var cancelButton: UIButton!
}
