
import UIKit
import Parse

class TableViewForExplore: UITableViewController, explore {
    
    let data = DataExplore()
    var textOfCity: String = ""
    var imageOfCity: String = ""
    var city: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.places.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ExploreTableCell
        // Configure the cell...
        cell.delegate = self
        cell.imageFilename = data.places[indexPath.row].imagename
        cell.cityNameLabel.text = data.places[indexPath.row].heading
        cell.cityImageView.image = UIImage(named: cell.imageFilename)
        cell.cityId = indexPath.row
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToSector" {
            let secondVC = segue.destinationViewController as! BusinessSectorsViewController
            secondVC.mainCityLabelText = textOfCity
            secondVC.mainGraphicImageFileName = imageOfCity
            secondVC.optionSelected = city
 
        }

    }
    func pressedImage(cityLabel: String, imageFilename: String, selectedCity: Int) {
        textOfCity = cityLabel
        imageOfCity = imageFilename
        city = selectedCity
        performSegueWithIdentifier("goToSector", sender: self)
    }
}
