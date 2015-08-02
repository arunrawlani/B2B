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

        // Do any additional setup after loading the view.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var businesses: [Business] = [Business(name: "Bacon Bacon", tags: ["cool", "bacon", "convenient", "love", "beer"], sectors: ["Food Truck", "Food Provider", "Food Service"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "" )]), Business(name: "Big Dipper Baby Food", tags: ["fresh", "organic", "seasonal", "healthy", "local"], sectors: ["Baby Food", "Food Provider", "Food Service"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 3, description: "" )]), Business(name: "Blissmo", tags: ["eco-friendly", "sustainable", "subscription", "box", "deals"], sectors: ["Product Delivery", "Consumer Product", "Discount Product"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "MightySignal", tags: ["digitization", "user behavior", "mobile apps", "data fingerprint", "big data"], sectors: ["Data Mining", "Mobile Data Analysis", "User Data Analysis"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "Humanoid", tags: ["Saas", "machine learning", "task delegation", "cloud service", "data modeling"], sectors: ["Human Resource", "Crowdsourcing", "Cost Optimization"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "" )]), Business(name: "Chute", tags: ["content", "automation", "visual media", "content creation", "cool"], sectors: ["Social Media Marketing", "Online Branding", "Visual Marketing"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "Simply Measured", tags: ["democratized information", "Saas", "analytics", "Excel"], sectors: ["Business Intelligence", "Data Analysis", "Social Media Data"], legalValidation: true, city: "Seattle", state: "Washington", reviews: [Review(rating: 3, description: "" )]), Business(name: "UpCounsel", tags: ["marketplace", "on-demand", "marketplace", "cheap", "digitalization"], sectors: ["Legal Consulting", "Online Platform for Legal Services"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "" )]), Business(name: "Chameleon", tags: ["Saas", "optimization", "easy", "no-code", "A/B test"], sectors: ["User Experience Design", "User Onboarding", "Interactive Design"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "Snapsheet", tags: ["insurance", "automotive", "apps", "sel-service"], sectors: ["Mobile Development", "Mobile Solution for Auto Insurance"], legalValidation: true, city: "Chicago", state: "Illinois", reviews: [Review(rating: 3, description: "" )]), Business(name: "Stey's Calculator", tags: ["E-commerce", "best", "ruler-of-the-universe"], sectors: ["Calculator Distributor", "College Marketplace", "Consumer Product"], legalValidation: true, city: "Cupertino", state: "California", reviews: [Review(rating: 5, description: "" )]), Business(name: "Bannerman", tags: ["security guard", "valid license", "on-demand"], sectors: ["Private Bouncer", "Private Security for Events", "Human Resource"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )]), Business(name: "Esdoor", tags: ["logistic solution", "on-demand"], sectors: ["Inventory Management", "Distribution", "Trucking"], legalValidation: true, city: "Los Angeles", state: "California", reviews: [Review(rating: 3, description: "" )]), Business(name: "LegalSource", tags: ["legal", "unrealistic"], sectors: ["Legal Consulting", "Legal Service", "Tax Law"], legalValidation: true, city: "Seattle", state: "Washington", reviews: [Review(rating: 4, description: "" )])]
    
    var descriptionUpCounsel: String = "UpCounsel is an online workplace for business legal needs, enabling businesses to hire and manage trusted attorneys.\n\nUpCounsel's Mission Statement: \"At UpCounsel we are on a mission to make the legal experience remarkable for businesses. If we were a law firm, we would be the fastest growing law firm in history. Our network of attorneys already makes up the largest virtual law firm in the world.\""
    
    var twitterGuyUpCounsel: String = "Mason Blake"
    
    var twitterFeedUpCounsel: String = "Much like Uber and AirBnB have impacted their respective industries - UpCounsel, Inc. is changing the game in findin…https://lnkd.in/bsy3U78"
    
    var reviewUpCounsel: String = "Thanks UpCounsel!\nWho would've thought that a online-based company would provide such personal, prompt and thorough service.\nI needed some help navigating the nuances of starting an LLC.\nThe attorney I chose helped save me some serious cash by keeping me in the good graces of Uncle Sam's tax team.\nMy attorney was also super-quick.  Two day turn-around?! Whoa! \nOverall, 5 star service and will definitely recommend to all who need legal assistance in any facet of their lives."
    
    var reviewTwoUpCounsel: String = "I'm a commercial real estate broker and my clients always need commercial real estate attorneys to do lease reviews.  One of my clients  was tired of paying an arm and a leg much  pretty basic work.  I suggested she try UpCounsel and she found an attorney for less than half the price she usually pays.  Plus, the entire job had a turnaround time of under 24 hours.  Really impressive service and I'll recommend them to anyone looking for a commercial real estate attorney (or any other attorney)."
    
    var descriptioBacon: String =  "Bacon Bacon is a bacon provider for San Francisco features bacon on a burger, bacon dipped in chocolate, a pork belly sandwich and bacon jam for added bacon flavor.\n\n\"Start your day with a home made bacon scone and great cup of coffee, or a our signature bacon bacon cheese burger and a freshly squeezed lemonade. Just a couple options at our home base.\""
    
    var twitterGuyBacon: String = "Debbie Hunter"
    
    var twitterBacon: String = "That thing where u see the @BaconBaconSF truck & u want to run after it like girls in A Hard Days Night going after The Beatles."
    
    var reviewBacon: String = "Finally a food service with good portions, good quality food, and prices that are not through the roof. My wife and I operate a burrito business. An order of bacon fries, and chocolate bacons. We were both very happy with these two selections.\n\nOverall one of the better food truck partnership."
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
