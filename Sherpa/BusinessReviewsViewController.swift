//
//  BusinessReviewsViewController.swift
//  Sherpa
//
//  Created by Amit Mondal on 8/1/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

import UIKit

class BusinessReviewsViewController: UIViewController {
    @IBOutlet var starsImageView: UIImageView!
    @IBOutlet var companyReview: UILabel!
    @IBOutlet var customerReview: UILabel!

    var business: Business? {
        didSet {
            self.setUpStarsView()
            self.setUpReviewLabels()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpReviewLabels()
        self.setUpStarsView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpStarsView() {
        var sum: Double = 0
        var average: Double = 0
        for review in self.business!.reviews {
            sum = sum + Double(review.rating)
        }
        average = round(sum/Double(self.business!.reviews.count))
        switch average {
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
    func setUpReviewLabels() {
        self.companyReview.text = self.business!.reviews[0].description
        self.customerReview.text = ""
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
