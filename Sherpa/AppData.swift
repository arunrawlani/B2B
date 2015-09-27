
import Foundation

class DataExplore {
    class Entry {
        let imagename: String
        let heading: String
        init(fname: String,heading: String){
            self.imagename = fname
            self.heading = heading
        }
    }
    //TODO Write names of images of 2 cells
    let places = [
        Entry(fname: "serviceImage", heading: "Services"),
        Entry(fname: "supplyImage", heading: "Supplies"),
        
    ]
}

class DataBiz {
    class BizEntry {
        let bgImage: String
        let companyName: String
        let languages: String
        let cost: String
        let circularImage: String
        let cityImage: String
        init(bgImage: String, companyName: String, languages: String, cost: String, circularImage: String, cityImage: String){
            self.bgImage = bgImage
            self.companyName = companyName
            self.languages = languages
            self.cost = cost
            self.circularImage = circularImage
            self.cityImage = cityImage
        }
    }
    
    let bizNY = [
        BizEntry(bgImage: "BizEntryBG", companyName: "Central Park", languages: "UpCounsel", cost: "$24", circularImage: "User", cityImage: "serviceImage"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Statue of Liberty", languages: "UpCounsel", cost: "$42", circularImage: "User", cityImage: "serviceImage"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Upper East Side", languages: "UpCounsel", cost: "$99", circularImage: "User", cityImage: "serviceImage"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Manhattan", languages: "UpCounsel", cost: "$12", circularImage: "User", cityImage: "serviceImage")
    ]
    let bizLV = [
        BizEntry(bgImage: "BizEntryBG", companyName: "Bellagio Resort", languages: "Mandarin, Hindi", cost: "$15", circularImage: "DisplayPicture", cityImage: "supplyImage"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Vegas Night Club", languages: "Japanese, Korean", cost: "$78", circularImage: "DisplayPicture", cityImage: "supplyImage"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Mandalay Bay", languages: "Greek, English", cost: "$32", circularImage: "DisplayPicture", cityImage: "supplyImage"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Stratosphere Tower", languages: "Hebrew, Dutch", cost: "$98", circularImage: "DisplayPicture", cityImage: "supplyImage")
    ]
    let bizLA = [
        BizEntry(bgImage: "BizEntryBG", companyName: "Venice Beach", languages: "Mandarin, Hindi", cost: "$10", circularImage: "DisplayPicture", cityImage: "LosAngeles"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Downtown", languages: "English, German", cost: "$24", circularImage: "DisplayPicture", cityImage: "LosAngeles"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Hollywood", languages: "Spanish, Hindi", cost: "$95", circularImage: "DisplayPicture", cityImage: "LosAngeles"),
        BizEntry(bgImage: "BizEntryBG", companyName: "Santa Monica", languages: "Spanish, Italian", cost: "$40", circularImage: "DisplayPicture", cityImage: "LosAngeles")
    ]
}

class DataDashBoard {
    class ScheduledEntry {
        let appointmentTime: String
        let appointmentTimeAmorPM: String
        let companyName: String
        let appointmentDate: String
        let companyGuide: String
        
        init(appointmentTime: String, appointmentTimeAmorPM: String, companyName: String, appointmentDate: String, companyGuide: String){
            self.companyName = companyName
            self.appointmentTime = appointmentTime
            self.appointmentTimeAmorPM = appointmentTimeAmorPM
            self.appointmentDate = appointmentDate
            self.companyGuide = companyGuide
        }
    }
    
    let scheduledAppointment = [
        ScheduledEntry(appointmentTime: "10", appointmentTimeAmorPM: "AM", companyName: "Monkey Off Your Back", appointmentDate: "19.08.2015", companyGuide: ""),
        ScheduledEntry(appointmentTime: "07", appointmentTimeAmorPM: "PM", companyName: "UpCounsel", appointmentDate: "10.12.2015", companyGuide: ""),
        ScheduledEntry(appointmentTime: "12", appointmentTimeAmorPM: "AM", companyName: "Mighty Signal", appointmentDate: "13.05.2015", companyGuide: ""),
        ScheduledEntry(appointmentTime: "03", appointmentTimeAmorPM: "PM", companyName: "Humanoid", appointmentDate: "24.03.2015", companyGuide: "")
    ]
    
}
