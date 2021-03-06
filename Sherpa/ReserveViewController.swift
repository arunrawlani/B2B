
import Foundation
import AKPickerView_Swift
import DatePickerCell
import Parse
import QuartzCore

class ReserveViewController: UIViewController, AKPickerViewDataSource, AKPickerViewDelegate {
    
    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pickerView: AKPickerView!
    @IBOutlet weak var timePicker: AKPickerView!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var requestButton: UIButton!
    var requestPressedCounter: Int = 1
    
    var business: Business? {
        didSet {
            self.setLabels()
        }
    }
    
    var cells: NSArray = []
    var languages = ["Taxation","Legal Consulting","Legal Service"]
    var time = ["9:30", "10:30", "11:30", "12:30", "1:30", "2:30", "3:30"]
    
     var serviceCost: String = "" //costLabel
     var companyName: String = "" //nameLabel
     var serviceSum: String = "" //sumLabel
     var companyService: [String] = [] //pickerView
     var appointmentTimes: [String] = [] //timePicker
     var selectedLanguage: String = ""
     var selectedTime: String = ""
     var createdBy: PFUser?
   
    func setLabels() {
        if let costLabel = self.costLabel, sumLabel = self.sumLabel, nameLabel = self.nameLabel, business = self.business{
            self.costLabel.text = business.price
            self.sumLabel.text = business.description
           // self.languages = business.services
            self.nameLabel.text = business.name
            self.languages = business.services
            
            print(self.costLabel.text)
            print(self.sumLabel.text)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLabels()
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        //self.tableView.estimatedRowHeight = 44
      
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        self.timePicker.delegate = self
        self.timePicker.dataSource = self
        
        self.pickerView.tag = 1
        self.timePicker.tag = 2
        
        // The DatePickerCell.
        let datePickerCell = DatePickerCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        // Cells is a 2D array containing sections and rows.
        datePickerCell.contentView.backgroundColor = UIColor.clearColor()
        
        cells = [[datePickerCell]]

        
        self.pickerView.font = UIFont(name: "AvenirNext-Medium", size: 17)!
        self.pickerView.textColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 0.5)
        self.pickerView.highlightedFont = UIFont(name: "AvenirNext-Medium", size: 17)!
        self.pickerView.highlightedTextColor = UIColor(red: 220.0/256.0, green: 147.0/256.0, blue: 52.0/256.0, alpha: 1.0)
        self.pickerView.textColor = UIColor.whiteColor()
        self.pickerView.interitemSpacing = 17.0
        self.pickerView.viewDepth = 1000.0
        self.pickerView.pickerViewStyle = .Wheel
        self.pickerView.maskDisabled = false
        self.pickerView.reloadData()
        
        self.timePicker.font = UIFont(name: "AvenirNext-Medium", size: 17)!
        self.timePicker.textColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 0.5)
        self.timePicker.highlightedFont = UIFont(name: "AvenirNext-Medium", size: 17)!
        self.timePicker.highlightedTextColor = UIColor(red: 220.0/256.0, green: 147.0/256.0, blue: 52.0/256.0, alpha: 1.0)
        self.timePicker.textColor = UIColor.whiteColor()
        self.timePicker.interitemSpacing = 17.0
        self.timePicker.viewDepth = 1000.0
        self.timePicker.pickerViewStyle = .Wheel
        self.timePicker.maskDisabled = false
        self.timePicker.reloadData()
        
        
        let currentDate = NSDate() //fetches current date
        datepicker.minimumDate = currentDate //makes current date to be minimum
        datepicker.date = currentDate //defaults to current date

        //nameLabel.text = companyName
        //costLabel.text = serviceCost
       // sumLabel.text = serviceSum
        
        
        
        self.selectedLanguage = "None"
        self.selectedTime = "None"
       
        
    }
    
    // MARK: - AKPickerViewDataSource
    
    func numberOfItemsInPickerView(pickerView: AKPickerView) -> Int {
        
        var arrayCount: Int
        
        if(pickerView.tag == 1){
        arrayCount = self.languages.count
        }
        else{
            arrayCount = self.time.count
        }
        
        return arrayCount
    }
    
    
    /*
    
    Image Support
    -------------
    Please comment '-pickerView:titleForItem:' entirely and
    uncomment '-pickerView:imageForItem:' to see how it works.
    
    */
    func pickerView(pickerView: AKPickerView, titleForItem item: Int) -> String {
        var title : String
        if(pickerView.tag == 1){
            title = self.languages[item]
        }
        else{
            title = self.time[item]
        }
        
        return title
    }
    
    func pickerView(pickerView: AKPickerView, imageForItem item: Int) -> UIImage {
        
        var image: UIImage
        
        if(pickerView.tag == 1){
        image = UIImage(named: self.languages[item])!
        }
        else{
         image = UIImage(named: self.time[item])!
        }
        
        return image
    }
    
    // MARK: - AKPickerViewDelegate
    
    func pickerView(pickerView: AKPickerView, didSelectItem item: Int) {
        if(pickerView.tag == 1){
        self.selectedLanguage = self.languages[item]
        print("You selected \(selectedLanguage)")
        }
        else{
            self.selectedTime = self.time[item]
            print("You selected \(selectedTime)")
        }
    }
    
    @IBAction func appointmentRequest(sender: UIButton) {
        if (self.selectedLanguage == "None" || self.selectedTime == "None"){
            //GIVES AN ERROR MESSAGE
            var alert = UIAlertController(title: "Incomplete Request!", message: "Please select a time and service.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default){ (action) in
                //...
            }
            alert.addAction(OKAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{ //User has selected time, date and language
            sender.backgroundColor = UIColor.grayColor()
            var appointment = PFObject(className: "Appointment")
            appointment["requestedTime"] = self.selectedTime
            appointment["requestedService"] = self.selectedLanguage
            appointment["fromBiz"] = PFUser.currentUser()
            appointment["isApproved"] = false
            appointment["toBiz"] = business!.name
            appointment["isRejected"] = false
            appointment["isCancelled"] = false
           // appointment["requestedDate"] = dateLabel.text
            // setting global variable requestSubmitted to true for the query to be done.
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.requestSubmitted = true
            
            appointment.saveInBackgroundWithBlock{(success: Bool, error: NSError?) -> Void in
                if (success){
                    var alert = UIAlertController(title: "Request Sent!", message: "All scheduled appointments will be displayed on the Dashboard. ", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default){ (action) in
                        //...
                        self.navigationController?.popToRootViewControllerAnimated(true)
                    }
                    alert.addAction(OKAction)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else{
                    print("Boy kya scene")
                }
            }
        }
    }

    
}




/*
 extension ReserveViewController: UITableViewDataSource{

     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // Get the correct height if the cell is a DatePickerCell.
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if (cell.isKindOfClass(DatePickerCell)) {
            return (cell as! DatePickerCell).datePickerHeight()
        }
        
        return 44//tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Deselect automatically if the cell is a DatePickerCell.
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if (cell.isKindOfClass(DatePickerCell)) {
            println("gogogo")
            var datePickerTableViewCell = cell as! DatePickerCell
            datePickerTableViewCell.selectedInTableView(tableView)
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1//cells.count
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//cells[section].count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row] as! UITableViewCell
    }
}
*/
