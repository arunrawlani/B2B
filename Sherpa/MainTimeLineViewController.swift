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
    var newNewArray = [Business]()
    var searchRadius: Float = 0
    var selectedBusiness: Business?
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    //Global variables
    @IBOutlet weak var distanceRadiusLabel: UILabel!
    @IBAction func sliderValueChanged(sender: UISlider) {
        self.searchRadius = round((sender.value * 3500))
        distanceRadiusLabel.text = ("\(self.searchRadius) Miles")
        self.newNewArray = newArray.filter { (T: Business) -> Bool in
            let boolLocation =  T.location.isInRange(Double(self.searchRadius) * 1609.34)
            var searchBool = true

            if self.searchBar.text != ""{
            let string = self.searchBar.text
            var nameBool = false
            if  T.name.lowercaseString.rangeOfString(string) != nil{
                nameBool = true
            }
            
            if nameBool ||  self.foundTag(string, objectTags: T.tags) || self.checkServices(T, serviceToBeSearched: string ){
                searchBool = true
            } else {
                searchBool = false
                }
            }
            
                        // Do any additional setup after loading the view.
            return searchBool && boolLocation
        }

        self.tableView.reloadData()
    }
    //TODO make sure the previous VC assigns string to next var
    var sector:String?
    var allBusinesses: [Business] = [Business(name: "Bacon Bacon", sector: "Distribution & Retail", tags: ["cool", "bacon", "convenient", "love", "beer"], services: ["Food Truck", "Food Provider", "Food Service"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "Finally a food service with good portions, good quality food, and prices that are not through the roof. My wife and I operate a burrito business. An order of bacon fries, and chocolate bacons. We were both very happy with these two selections.\n\nOverall one of the better food truck partnership." )], price: "$30-$50", description: "Bacon Bacon is a bacon provider for San Francisco features bacon on a burger, bacon dipped in chocolate, a pork belly sandwich and bacon jam for added bacon flavor.\n\n\"Start your day with a home made bacon scone and great cup of coffee, or a our signature bacon bacon cheese burger and a freshly squeezed lemonade. Just a couple options at our home base.\""), Business(name: "Big Dipper Baby Food", sector: "Distribution & Retail", tags: ["fresh", "organic", "seasonal", "healthy", "local"], services: ["Baby Food", "Food Provider", "Food Service"], legalValidation: true, city: "New York City", state: "New York", reviews: [Review(rating: 3, description: "" )], price: "$100-$200", description: ""), Business(name: "Blissmo", sector: "Distribution & Retail", tags: ["eco-friendly", "sustainable", "subscription", "box", "deals"], services: ["Product Delivery", "Consumer Product", "Discount Product"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "" )], price: "$200-$300", description: ""), Business(name: "MightySignal", sector: "Data Analysis", tags: ["digitization", "user behavior", "mobile apps", "data fingerprint", "big data"], services: ["Data Mining", "Mobile Data Analysis", "User Data Analysis"], legalValidation: true, city: "Boston", state: "Massachusetts", reviews: [Review(rating: 4, description: "" )], price: "$1000-$1200", description: ""), Business(name: "Humanoid", sector: "Management", tags: ["Saas", "machine learning", "task delegation", "cloud service", "data modeling"], services: ["Human Resource", "Crowdsourcing", "Cost Optimization"], legalValidation: true, city: "Sunnyvale", state: "California", reviews: [Review(rating: 5, description: "" )], price: "$400-$500", description: ""), Business(name: "Chute", sector: "Marketing", tags: ["content", "automation", "visual media", "content creation", "cool"], services: ["Social Media Marketing", "Online Branding", "Visual Marketing"], legalValidation: true, city: "New York City", state: "New York", reviews: [Review(rating: 4, description: "" )], price: "$700-$1000", description: ""), Business(name: "Simply Measured", sector: "Development", tags: ["democratized information", "Saas", "analytics", "Excel"], services: ["Business Intelligence", "Data Analysis", "Social Media Data"], legalValidation: true, city: "Seattle", state: "Washington", reviews: [Review(rating: 3, description: "" )], price: "$200-$300", description: ""), Business(name: "UpCounsel", sector: "Management", tags: ["marketplace", "on-demand", "marketplace", "cheap", "digitalization"], services: ["Legal Consulting", "Online Platform for Legal Services"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "UpCounsel is an online workplace for business legal needs, enabling businesses to hire and manage trusted attorneys.\n\nUpCounsel's Mission Statement: \"At UpCounsel we are on a mission to make the legal experience remarkable for businesses. If we were a law firm, we would be the fastest growing law firm in history. Our network of attorneys already makes up the largest virtual law firm in the world.\"" )], price: "$500-$700", description: "Thanks UpCounsel!\nWho would've thought that a online-based company would provide such personal, prompt and thorough service.\nI needed some help navigating the nuances of starting an LLC.\nThe attorney I chose helped save me some serious cash by keeping me in the good graces of Uncle Sam's tax team.\nMy attorney was also super-quick.  Two day turn-around?! Whoa! \nOverall, 5 star service and will definitely recommend to all who need legal assistance in any facet of their lives."), Business(name: "Chameleon", sector: "Development", tags: ["Saas", "optimization", "easy", "no-code", "A/B test"], services: ["User Experience Design", "User Testing", "Interactive Design"], legalValidation: true, city: "Boulder", state: "Colorado", reviews: [Review(rating: 4, description: "" )], price: "$300-$600", description: ""), Business(name: "Snapsheet", sector: "Development", tags: ["insurance", "automotive", "apps", "sel-service"], services: ["Mobile Development", "Mobile Solution for Auto Insurance"], legalValidation: true, city: "Chicago", state: "Illinois", reviews: [Review(rating: 3, description: "" )], price: "$600-$700", description: ""), Business(name: "Stey's Calculator", sector: "Distribution & Retail", tags: ["E-commerce", "best", "ruler-of-the-universe"], services: ["Calculator Distributor", "College Marketplace", "Consumer Product"], legalValidation: true, city: "Urbana", state: "Illinois", reviews: [Review(rating: 5, description: "" )], price: "$10000-$20000", description: ""), Business(name: "Bannerman", sector: "Management", tags: ["security guard", "valid license", "on-demand"], services: ["Private Bouncer", "Private Security for Events", "Human Resource"], legalValidation: true, city: "New York City", state: "New York", reviews: [Review(rating: 4, description: "" )], price: "$1000-$2000", description: ""), Business(name: "Esdoor", sector: "Management", tags: ["logistic solution", "on-demand"], services: ["Inventory Management", "Distribution", "Trucking"], legalValidation: true, city: "Los Angeles", state: "California", reviews: [Review(rating: 3, description: "" )], price: "$300-$400", description: ""), Business(name: "LegalSource", sector: "Management", tags: ["legal", "unrealistic"], services: ["Legal Consulting", "Legal Service", "Tax Law"], legalValidation: true, city: "Seattle", state: "Washington", reviews: [Review(rating: 4, description: "" )], price: "$900-$1300", description: ""), Business(name: "Monkey Off Your Back", sector: "Finance", tags: ["collaborative", "advisor", "taxes"], services: ["Accounting Service", "Bookkeeping", "Clutter Clearing"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 5, description: "After hiring two incompetent so called accountants who screwed up my books, didn't do the job I paid them for, and basically just wasted my money, Julie came to the rescue. She brought my Quickbooks up to date and reconciled it with my bank statements to a T. She also coached and trained me so that I could run Quickbooks all by myself. After our sessions were over, I called her with a few questions and problems I was having on my own, and she immediately returned my call, and walked me through everything step by step. Julie and Monkey Off Your Back, truly has the best interest of the client at heart. She was very knowledgeable and very easy to work with.  I will definitely be using Julie in the future for my small business accounting needs. Thanks for all your help Julie!")], price: "$400-$700", description: "Monkey Off Your Back offers judgment-free, collaborative guidance for eliminating, categorizing, and organizing the \"stuff\" in any area of your home or office. We will help you decide what to discard and organize what's left.\nIn 2008, Julie came up with the idea for Monkey Off Your Back. As she was happily setting up filing systems and online bank accounts for a friend's new business, she saw how her knack for organization could help people better function in their personal and professional lives."), Business(name: "First Republic Bank", sector: "Finance", tags: ["reliable", "consultant", "bank"], services: ["Financial Service", "Private Business Banking", "Lending"], legalValidation: true, city: "San Francisco", state: "California", reviews: [Review(rating: 4, description: "")], price: "$800-$1000", description: "First Republic Bank provides a level of personal service that is rare in banking these days and the peace of mind that comes from doing business with a bank with a strong capital foundation, a long history of profitable performance, and a client-driven service culture.\n\"We deliver friendly, old-fashioned banking services, with a sharp focus on extraordinary, customized services that include personal banking, private business banking, lending, and private wealth management delivered through a team of highly-experienced financial professionals.\""), Business(name: "Hoppe Tax", sector: "Finance", tags: ["reliable", "consultant", "bank"], services: ["Investing", "Financial Advising", "Tax Services"], legalValidation: true, city: "Oakland", state: "California", reviews: [Review(rating: 4, description: "")], price: "$800-$900", description: "Hoppe Tax, a remote CPA firm, started in the North Beach neighborhood of Oakland and established itself to work remotely with clients across the nation to provide straightforward tax advice to individuals, sole proprietors and local businesses.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for business in allBusinesses {
            business.location.assignLocation()
        }
        self.searchBar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        newArray =  allBusinesses.filter { (T:Business) -> Bool in
            // checking it is not nil
            if let sector = self.sector{
                if sector == T.sector{
                    return true
                }
            }
            return false
        }
        self.newNewArray = newArray
        // Do any additional setup after loading the view.
    }
    //TODO IBOutlets

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showBusinessSegue" {
            let destination = segue.destinationViewController as! ReserveViewController
            destination.business = self.selectedBusiness
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
extension MainTimeLineViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newNewArray.count ?? 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as! BusinessTableViewCell
        //Cell parameters:
        cell.nameLabel.text = newNewArray[indexPath.row].name
        cell.priceLabel.text = "Cost: \(newNewArray[indexPath.row].price)"
        cell.locationLabel.text = ("\(newNewArray[indexPath.row].location.city), \(newNewArray[indexPath.row].location.state)")
        var servicesString: String = ""
        for string in newNewArray[indexPath.row].services {
            servicesString += string + ", "
        }
        cell.servicesLabel.text = servicesString.substringToIndex(advance(servicesString.startIndex, count(servicesString)-2))
        cell.selectionStyle = UITableViewCellSelectionStyle.None
       //TODO implement price range cell.rating = allBusinesses[indexPath.row].reviews
        return cell
    }
}
extension MainTimeLineViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedBusiness = newNewArray[indexPath.row]
        performSegueWithIdentifier("showBusinessSegue", sender: self)
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
extension MainTimeLineViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        let string = searchBar.text
        if !string.isEmpty{
        var temp = newArray.filter{(T:Business) -> Bool in
            // checking it is not nil
            var nameBool = false
            if  T.name.lowercaseString.rangeOfString(string) != nil{
                nameBool = true
            }
            
            if nameBool ||  self.foundTag(string, objectTags: T.tags) || self.checkServices(T, serviceToBeSearched: string ){
                return true
            }
            
            return false
            // Do any additional setup after loading the view.
        }
        self.newNewArray = temp
        }
        self.tableView.reloadData()
        
    }

    

private func foundTag(tags: String, objectTags: [String]) -> Bool {
    // TODO Use better comparison
        for objectTag in objectTags {
            if objectTag.lowercaseString.rangeOfString(tags) != nil{
                return true
             }
        
    }
    return false
}
private func checkServices(T: Business, serviceToBeSearched:String) -> Bool{
    for service in T.services {
            if service.lowercaseString.rangeOfString(serviceToBeSearched) != nil{
                return true
            }
    }
    return false
}



}

