import UIKit
import CoreData

var taskMgr = TaskManager()

class TaskManager: NSObject {
    var tasks = Task[]()
    
    func addTask(name: String, desc: String){
        var context = ctx()
        let ent = NSEntityDescription.entityForName("Tasks", inManagedObjectContext: context)
        
        var task = Task(entity: ent, insertIntoManagedObjectContext: context)
        task.name = name
        task.desc = desc
        context.save(nil)
        println("Task saved")
    
        tasks.append(task)
    }
    func remove(index: Int) {
        var task = tasks[index]
        ctx().deleteObject(task)
        tasks.removeAtIndex(index)
    }
    
    
    func loadTasks(){
        var context = ctx()
        
        let request = NSFetchRequest(entityName: "Tasks")
        request.returnsObjectsAsFaults = false
        
        // request.predicate = NSPredicate(format: "username = %@", txtUsername.text as String)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        if (results.count > 0){
            
            for result in results {
                var task = result as Task
                println(task.name)
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
