

import UIKit

class BusinessInformationViewController: UIViewController {
    @IBOutlet var starsImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var costRangeLabel: UILabel!
    @IBOutlet var tagsLabel: UILabel!

    var business: Business?
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpLabels() {
        self.nameLabel.text = business?.name
        self.costRangeLabel.text = ""
        var tagsString = ""
        for string in self.business!.tags {
            tagsString += ("\(string), ")
        }
        self.tagsLabel.text = tagsString
    }
    
    func setUpStarsView() {
        var sum: Double = 0
        var average: Double = 0
        for review in self.business!.reviews {
            sum = sum + Double(review.rating)
        }
        average = round(sum/Double(self.business!.reviews.count))
        switch average {
        case 0:
            self.starsImageView.image = UIImage(named: "No Stars")
        case 1:
            self.starsImageView.image = UIImage(named: "One Star")
        case 2:
            self.starsImageView.image = UIImage(named: "Two Stars")
        case 3:
            self.starsImageView.image = UIImage(named: "3Stars")
        case 4:
            self.starsImageView.image = UIImage(named: "4Stars")
        case 5:
            self.starsImageView.image = UIImage(named: "5Stars")
        default:
            self.starsImageView.image = UIImage(named: "5Stars")
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowReviewsSegue") {
            let destinationVC: BusinessReviewsViewController = segue.destinationViewController as! BusinessReviewsViewController
            destinationVC.business = self.business
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
