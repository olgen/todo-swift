import UIKit
import CoreData

@objc(Task)
class Task: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var desc: String
    
}
