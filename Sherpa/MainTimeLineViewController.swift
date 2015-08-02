//
//  MainTimeLineViewController.swift
//  Sherpa
//
//  Created by Essam Ewaisha on 8/1/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

import UIKit

class MainTimeLineViewController: UIViewController {
    var newArray = [Business]()


    @IBOutlet var tableView: UITableView!
    //Global variables
    //TODO make sure the previous VC assigns string to next var
    var sector:String?
    var allBusinesses: [Business] = [Business(name: "Bacon Bacon", sector: "Distribution & Retail", tags: ["cool", "bacon", "convenient", "love", "beer"], services: ["Food Truck", "Food Provider", "Food Service"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "Finally a food service with good portions, good quality food, and prices that are not through the roof. My wife and I operate a burrito business. An order of bacon fries, and chocolate bacons. We were both very happy with these two selections.\n\nOverall one of the better food truck partnership." )], price: "$", description: "Bacon Bacon is a bacon provider for San Francisco features bacon on a burger, bacon dipped in chocolate, a pork belly sandwich and bacon jam for added bacon flavor.\n\n\"Start your day with a home made bacon scone and great cup of coffee, or a our signature bacon bacon cheese burger and a freshly squeezed lemonade. Just a couple options at our home base.\""), Business(name: "Big Dipper Baby Food", sector: "Distribution & Retail", tags: ["fresh", "organic", "seasonal", "healthy", "local"], services: ["Baby Food", "Food Provider", "Food Service"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 3, description: "" )], price: "$$$", description: ""), Business(name: "Blissmo", sector: "Distribution & Retail", tags: ["eco-friendly", "sustainable", "subscription", "box", "deals"], services: ["Product Delivery", "Consumer Product", "Discount Product"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )], price: "$$", description: ""), Business(name: "MightySignal", sector: "Data Analysis", tags: ["digitization", "user behavior", "mobile apps", "data fingerprint", "big data"], services: ["Data Mining", "Mobile Data Analysis", "User Data Analysis"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )], price: "$", description: ""), Business(name: "Humanoid", sector: "Management", tags: ["Saas", "machine learning", "task delegation", "cloud service", "data modeling"], services: ["Human Resource", "Crowdsourcing", "Cost Optimization"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "" )], price: "$$", description: ""), Business(name: "Chute", sector: "Marketing", tags: ["content", "automation", "visual media", "content creation", "cool"], services: ["Social Media Marketing", "Online Branding", "Visual Marketing"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )], price: "$$$", description: ""), Business(name: "Simply Measured", sector: "Development", tags: ["democratized information", "Saas", "analytics", "Excel"], services: ["Business Intelligence", "Data Analysis", "Social Media Data"], legalValidation: true, city: "Seattle", state: "Washington", reviews: [Review(rating: 3, description: "" )], price: "$$", description: ""), Business(name: "UpCounsel", sector: "Management", tags: ["marketplace", "on-demand", "marketplace", "cheap", "digitalization"], services: ["Legal Consulting", "Online Platform for Legal Services"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "UpCounsel is an online workplace for business legal needs, enabling businesses to hire and manage trusted attorneys.\n\nUpCounsel's Mission Statement: \"At UpCounsel we are on a mission to make the legal experience remarkable for businesses. If we were a law firm, we would be the fastest growing law firm in history. Our network of attorneys already makes up the largest virtual law firm in the world.\"" )], price: "$$", description: "Thanks UpCounsel!\nWho would've thought that a online-based company would provide such personal, prompt and thorough service.\nI needed some help navigating the nuances of starting an LLC.\nThe attorney I chose helped save me some serious cash by keeping me in the good graces of Uncle Sam's tax team.\nMy attorney was also super-quick.  Two day turn-around?! Whoa! \nOverall, 5 star service and will definitely recommend to all who need legal assistance in any facet of their lives."), Business(name: "Chameleon", sector: "Development", tags: ["Saas", "optimization", "easy", "no-code", "A/B test"], services: ["User Experience Design", "User Testing", "Interactive Design"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )], price: "$$$", description: ""), Business(name: "Snapsheet", sector: "Development", tags: ["insurance", "automotive", "apps", "sel-service"], services: ["Mobile Development", "Mobile Solution for Auto Insurance"], legalValidation: true, city: "Chicago", state: "Illinois", reviews: [Review(rating: 3, description: "" )], price: "$$", description: ""), Business(name: "Stey's Calculator", sector: "Distribution & Retail", tags: ["E-commerce", "best", "ruler-of-the-universe"], services: ["Calculator Distributor", "College Marketplace", "Consumer Product"], legalValidation: true, city: "Cupertino", state: "California", reviews: [Review(rating: 5, description: "" )], price: "$$$", description: ""), Business(name: "Bannerman", sector: "Management", tags: ["security guard", "valid license", "on-demand"], services: ["Private Bouncer", "Private Security for Events", "Human Resource"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )], price: "$", description: ""), Business(name: "Esdoor", sector: "Management", tags: ["logistic solution", "on-demand"], services: ["Inventory Management", "Distribution", "Trucking"], legalValidation: true, city: "Los Angeles", state: "California", reviews: [Review(rating: 3, description: "" )], price: "$$", description: ""), Business(name: "LegalSource", sector: "Management", tags: ["legal", "unrealistic"], services: ["Legal Consulting", "Legal Service", "Tax Law"], legalValidation: true, city: "Seattle", state: "Washington", reviews: [Review(rating: 4, description: "" )], price: "$$$", description: "")]
    override func viewDidLoad() {
        super.viewDidLoad()
        println(self.allBusinesses[0].name)
        self.tableView.dataSource = self
        newArray =  allBusinesses.filter { (T:Business) -> Bool in
            // checking it is not nil
            if let sector = self.sector{
                if sector == T.sector{
                    return true
                }
            }
            return false
        }
        // Do any additional setup after loading the view.
    }
    //TODO IBOutlets

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
extension MainTimeLineViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newArray.count ?? 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as! BusinessTableViewCell
        //Cell parameters:
        cell.nameLabel.text = newArray[indexPath.row].name
        cell.priceLabel.text = "Cost: \(newArray[indexPath.row].price)"
        cell.locationLabel.text = ("\(newArray[indexPath.row].location.city), \(newArray[indexPath.row].location.state)")
       //TODO implement price range cell.rating = allBusinesses[indexPath.row].reviews
        return cell
    }
}
/*func search(tags: [String], name: String, location: Location, searchRadius: Double, userLocation: CLLocationCoordinate2D){
    var allBuisnesses: [Business] = getBusiness()
    //WARNING check if it actually mutatates the object
    //TODO reimpelemnt when errors are gone
    
    // filtering by name         // filtering by location
    // filtering by tags and sector
    allBuisnesses.filter { (T:Business) -> Bool in
        T.name == name
    }
    allBuisnesses.filter { (T:Business) -> Bool in
        T.location?.isInRange(userLocation, rangeInMeters: searchRadius) ?? false
    }
    allBuisnesses.filter { (T:Business) -> Bool in
        self.foundTag(tags, objectTags: T.tags)
    }
    allBuisnesses.filter { (T:Business) -> Bool in
        // checking it is not nil
        if let sector = self.sector{
            for sectorInArray in T.sectors {
                if sector == sectorInArray{
                    return true
                }
            }
        }
        return false
    }
    
    
}*/

