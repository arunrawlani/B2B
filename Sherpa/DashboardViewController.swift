
import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    @IBOutlet var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       //MADE THIS CHANGE AFTER THE HACKTHON
        //self.navigationItem.setHidesBackButton(true, animated: false)
        tableview.allowsSelection = false
        // Do any additional setup after loading the view.
        
    let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    
    }
    
    let data = DataDashBoard()
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.scheduledAppointment.count
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DashboardTableCell
        // Configure the cell...
        cell.backgroundColor = UIColor.clearColor()
        cell.timeLabel.text = data.scheduledAppointment[indexPath.row].appointmentTime
        cell.timeAMPMLabel.text = data.scheduledAppointment[indexPath.row].appointmentTimeAmorPM
        cell.companyNameLabel.text = data.scheduledAppointment[indexPath.row].companyName
        cell.companyGuideLabel.text = data.scheduledAppointment[indexPath.row].companyGuide
        cell.appointmentDateLabel.text = data.scheduledAppointment[indexPath.row].appointmentDate
        return cell
    }

}
