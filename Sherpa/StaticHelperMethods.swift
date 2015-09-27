
import Foundation
class StaticHelperMethods {
    func getBuissnessWithName(allBuisness: [Business], name:String) -> [Business]{
        var returnArray = [Business]()
        for buisness in allBuisness {
            if buisness.name == name {
                returnArray.append(buisness)
                
            }
        }
        return returnArray
    }
    func get(allBuisness: [Business], name:String) -> [Business]{
        var returnArray = [Business]()
        for buisness in allBuisness {
            if buisness.name == name {
                returnArray.append(buisness)
                
            }
        }
        return returnArray
    }
    func foundTag(tags: [String], objectTags: [String]) -> Bool {
        // TODO Use better comparison
        for tag in tags {
            for objectTag in objectTags {
                //if (tag.localizedCaseInsensitiveCompare(objectTag)){
                return true
                // }
            }
        }
        return false
    }
    
    /*static func getBusiness () -> [Business]{
        var business = BusinessListViewController()
        return business.businesses
    }*/
}