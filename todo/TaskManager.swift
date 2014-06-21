import UIKit

var taskMgr = TaskManager()

struct task {
    var name = "Unnamed"
    var desc = "Undescribed"
}

class TaskManager: NSObject {
    var tasks = task[]()
    
    func addTask(name: String, desc: String){
       tasks.append(task(name: name, desc: desc))
    }

}
