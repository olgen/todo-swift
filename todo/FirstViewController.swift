//
//  FirstViewController.swift
//  todo
//
//  Created by Eugen on 21/06/14.
//  Copyright (c) 2014 olgen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblTasks : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Returning to view
    override func viewDidAppear(animated: Bool) {
        tblTasks.reloadData()
    }
    
    //UITableViewDelegate
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            taskMgr.remove(indexPath.row)
            tblTasks.reloadData()
        }
        
    }
    
    // UITabkeViewDataSource
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
       return taskMgr.tasks.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
       let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "default")
        
        let task = taskMgr.tasks[indexPath.row]
        cell.text = task.name
        cell.detailTextLabel.text = task.desc
        
        return cell
    }


}

