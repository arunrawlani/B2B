
import UIKit

protocol company {
    func goToOverview(companyName: String, imageName: String, costLabel: String)
}

class BusinessTableCell: UITableViewCell {

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var languagesName: UILabel!
    @IBOutlet var companyName: UILabel!
    
    var imageFilename: String = ""
    
    var delegate: company? = nil
    
    @IBAction func goToOverview(sender: AnyObject) {
        if (delegate != nil) {
            delegate!.goToOverview(companyName.text!, imageName: imageFilename, costLabel: costLabel.text!)
        }
    }
}
