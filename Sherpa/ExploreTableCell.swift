

import UIKit

protocol explore {
    func pressedImage(cityLabel: String, imageFilename: String, selectedCity: Int)
}


class ExploreTableCell: UITableViewCell {
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    
    var imageFilename: String = ""
    var cityId: Int = 0
    var delegate: explore? = nil

    @IBAction func onImageClicked(sender: AnyObject) {
        println("pressed image")
        if (delegate != nil) {
            delegate!.pressedImage(cityNameLabel.text!, imageFilename: imageFilename, selectedCity: cityId)
        }
    }
}
