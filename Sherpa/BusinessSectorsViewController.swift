
import UIKit
import Parse
import CoreLocation
import MapKit


class BusinessSectorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var optionImage: UIImageView!
    let services: [String] = ["Finance", "Data Analysis", "Marketing", "Development", "Distribution & Retail", "Management"]
    let supplies: [String] = ["Distributors","Craftsmen","Dropshippers", "Manufacturers"]
    var sectionSelected: Int = 0
    var selectedSector: String = ""
    //Added for now
    var mainCityLabelText: String = ""
    var mainGraphicImageFileName: String = ""
    var optionSelected: Int = 0
    //close
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is \(mainCityLabelText) what")
        optionLabel.text = mainCityLabelText
        optionImage.image = UIImage(named: mainGraphicImageFileName)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if(optionSelected == 0){
            self.selectedSector = self.services[indexPath.row]
        }
        else{
            self.selectedSector = self.supplies[indexPath.row]
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SectorCell", forIndexPath: indexPath) as! BusinessSectorTableViewCell
        if(optionSelected == 0){
            cell.sectorNameLabel.text = self.services[indexPath.row]
        }
        else{
            cell.sectorNameLabel.text = self.supplies[indexPath.row]
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        //These properties run on only iOS8 and higher so check
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.preservesSuperviewLayoutMargins = false
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.optionSelected == 0){
        return self.services.count
        }
        else{
            return self.supplies.count
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(optionSelected == 0){
            self.selectedSector = self.services[indexPath.row]
        }
        else{
            self.selectedSector = self.supplies[indexPath.row]
        }
        self.performSegueWithIdentifier("goToBusiness", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToBusiness" {
            let destination = segue.destinationViewController as? MainTimeLineViewController
            destination!.sector = self.selectedSector
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





