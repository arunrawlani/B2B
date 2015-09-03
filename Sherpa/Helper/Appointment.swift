//
//  Appointment.swift
//  BizCollab
//
//  Created by Praynaa Rawlani on 9/3/15.
//
//

import Foundation
import Parse

class Appointment:PFObject, PFSubclassing{
    
    @NSManaged var isApproved: Bool
    @NSManaged var isCancelled: Bool
    @NSManaged var isRejected: Bool
    @NSManaged var fromBiz: PFUser?
    @NSManaged var requestedTime: String?
    @NSManaged var requestedService: String?
    @NSManaged var requestedDate: String?
    @NSManaged var toBiz: PFUser?
    
    
    //MARK : PFSubclassing Protocol
    
    static func parseClassName() -> String {
        return "Appointment"
    }
    
    override init(){
        super.init()
        //isApprovedBool = false
    }
    
    override class func initialize() {
        var onceToken : dispatch_once_t = 0;
        dispatch_once(&onceToken) {
            // inform Parse about this subclass
            self.registerSubclass()
        }
    }
    
}
