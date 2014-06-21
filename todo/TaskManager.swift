import UIKit
import CoreData

var taskMgr = TaskManager()

struct Task {
    var name = ""
    var desc = ""
}

class TaskManager: NSObject {
    var tasks = Task[]()
    
    func addTask(name: String, desc: String){
        let task = Task(name: name, desc: desc)
        tasks.append(task)
        saveTask(task)
    }
    
    func saveTask(task: Task) {
        var context = ctx()
        var dbTask = NSEntityDescription.insertNewObjectForEntityForName("Tasks", inManagedObjectContext: context) as NSManagedObject
        dbTask.setValue(task.name, forKey: "name")
        dbTask.setValue(task.desc, forKey: "desc")
        context.save(nil)
        
        println(dbTask)
        println("Task saved!")
    }
    
    func loadTasks(){
        var context = ctx()
        var request = NSFetchRequest(entityName: "Tasks")
        request.returnsObjectsAsFaults = false
        
        // request.predicate = NSPredicate(format: "username = %@", txtUsername.text as String)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        if (results.count > 0){
            
            for res in results {
               var task = Task(name: res.valueForKey("name") as String,
                desc: res.valueForKey("desc") as String)
                tasks.append(task)
            }
        } else {
            println("ERROR: Zero results returned!")
        }
        
    }
    
    func ctx()-> NSManagedObjectContext {
        var appDel = UIApplication.sharedApplication().delegate as AppDelegate
        return appDel.managedObjectContext
    }
    
}
