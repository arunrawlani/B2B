//
//  BusinessListViewController.swift
//  Sherpa
//
//  Created by Amit Mondal on 8/1/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

import UIKit

class BusinessListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var businesses: [Business] = [Business(name: "Bacon Bacon", tags: ["cool", "bacon", "convenient", "love", "beer"], sectors: ["Food Truck", "Food Provider", "Food Service"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "" )]), Business(name: "Big Dipper Baby Food", tags: ["fresh", "organic", "seasonal", "healthy", "local"], sectors: ["Baby Food", "Food Provider", "Food Service"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 3, description: "" )]), Business(name: "Blissmo", tags: ["eco-friendly", "sustainable", "subscription", "box", "deals"], sectors: ["Product Delivery", "Consumer Product", "Discount Product"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "MightySignal", tags: ["digitization", "user behavior", "mobile apps", "data fingerprint", "big data"], sectors: ["Data Mining", "Mobile Data Analysis", "User Data Analysis"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "Humanoid", tags: ["Saas", "machine learning", "task delegation", "cloud service", "data modeling"], sectors: ["Human Resource", "Crowdsourcing", "Cost Optimization"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "" )]), Business(name: "Chute", tags: ["content", "automation", "visual media", "content creation", "cool"], sectors: ["Social Media Marketing", "Online Branding", "Visual Marketing"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "Simply Measured", tags: ["democratized information", "Saas", "analytics", "Excel"], sectors: ["Business Intelligence", "Data Analysis", "Social Media Data"], legalValidation: true, city: "Seattle", state: "Washington", reviews: [Review(rating: 3, description: "" )]), Business(name: "UpCounsel", tags: ["marketplace", "on-demand", "marketplace", "cheap", "digitalization"], sectors: ["Legal Consulting", "Online Platform for Legal Services"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "" )]), Business(name: "Chameleon", tags: ["Saas", "optimization", "easy", "no-code", "A/B test"], sectors: ["User Experience Design", "User Onboarding", "Interactive Design"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "Snapsheet", tags: ["insurance", "automotive", "apps", "sel-service"], sectors: ["Mobile Development", "Mobile Solution for Auto Insurance"], legalValidation: true, city: "Chicago", state: "Illinois", reviews: [Review(rating: 3, description: "" )]), Business(name: "Stey's Calculator", tags: ["E-commerce", "best", "ruler-of-the-universe"], sectors: ["Calculator Distributor", "College Marketplace", "Consumer Product"], legalValidation: true, city: "Cupertino", state: "California", reviews: [Review(rating: 5, description: "" )]), Business(name: "Bannerman", tags: ["security guard", "valid license", "on-demand"], sectors: ["Private Bouncer", "Private Security for Events", "Human Resource"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "Esdoor", tags: ["logistic solution", "on-demand"], sectors: ["Inventory Management", "Distribution", "Trucking"], legalValidation: true, city: "Los Angeles", state: "California", reviews: [Review(rating: 3, description: "" )]), Business(name: "LegalSource", tags: ["legal", "unrealistic"], sectors: ["Legal Consulting", "Legal Service", "Tax Law"], legalValidation: true, city: "Seattle", state: "Washington", reviews: [Review(rating: 4, description: "" )])]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
