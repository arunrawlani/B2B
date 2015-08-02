//
//  MainTimeLineViewController.swift
//  Sherpa
//
//  Created by Essam Ewaisha on 8/1/15.
//  Copyright (c) 2015 Derek Argueta. All rights reserved.
//

import UIKit

class MainTimeLineViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    //Global variables
    var allBusinesses = StaticHelperMethods.getBusiness()
    //TODO make sure the previous VC assigns string to next var
    var sector:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self

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
        return self.allBusinesses.count ?? 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        allBusinesses.filter { (T:Business) -> Bool in
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! BusinessTableViewCell
        //Cell parameters:
        cell.nameLabel.text = allBusinesses[indexPath.row].name
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

