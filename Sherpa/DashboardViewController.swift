
import UIKit
import Parse

class DashboardViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var appointments: [Appointment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //MADE THIS CHANGE AFTER THE HACKTHON
        //self.navigationItem.setHidesBackButton(true, animated: false)
        tableView.allowsSelection = false
        // Do any additional setup after loading the view.
        
    let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        var isCancelledQuery: PFQuery?
        
        let appointmentQuery = Appointment.query()
        appointmentQuery!.whereKey("fromBiz", equalTo: PFUser.currentUser()!)
        
        if let appointmentQuery = appointmentQuery{
            isCancelledQuery = PFQuery.orQueryWithSubqueries([appointmentQuery])
            isCancelledQuery!.whereKey("isCancelled", equalTo: false)
            
           // isCancelledQuery!.includeKey("toBiz") //dont need as both of them are Strings for now
            //isCancelledQuery!.includeKey("fromBiz") //dont need as both of them are Strings for now
        }
        
        isCancelledQuery!.findObjectsInBackgroundWithBlock {(result: [AnyObject]?, error: NSError?) -> Void in
            
            self.appointments = result as? [Appointment] ?? []
            println("This is \(self.appointments.count)")
            self.tableView.reloadData()
            
        }
    println("This is \(self.appointments.count)")
    }
    
}


extension DashboardViewController: UITableViewDataSource{
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.appointments.count ?? 0
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (appointments.count == 0) {
            var messageLabel = UILabel(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))
            messageLabel.text = "No scheduled tours"
            messageLabel.textColor = UIColor.whiteColor()
            messageLabel.font = UIFont(name: "Avenir Next", size: 27)
            messageLabel.numberOfLines = 1
            messageLabel.textAlignment = NSTextAlignment.Center
            messageLabel.sizeToFit()
            self.tableView.backgroundView = messageLabel
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
            return 0
        }
        else {
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            return 1
        }
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DashboardTableCell
        // Configure the cell...
        cell.backgroundColor = UIColor.clearColor()
        cell.timeLabel.text = appointments[indexPath.row].requestedTime
        cell.timeAMPMLabel.text = "19.09.2015" //this would become the date afterwards
        cell.companyNameLabel.text = appointments[indexPath.row].toBiz
        cell.companyGuideLabel.text = "Pending"
        cell.appointmentDateLabel.text = appointments[indexPath.row].requestedService
        cell.cancelButton.hidden = true
        //Can crash in below iOS8
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.preservesSuperviewLayoutMargins = false
        return cell
    }

}

