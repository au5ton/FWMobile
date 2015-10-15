//
//  ChatTableViewController.swift
//  FW Mobile
//
//  Created by Austin Jackson on 9/29/15.
//  Copyright © 2015 Austin Jackson. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Bcuz you're conforming to protocol you need to add those functions
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl:UIRefreshControl!
    
    var array: [String] = ["fluff", "world", "is", "cool"]
    
    
    override func viewDidLoad() {
        
        self.view.tintColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        //cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected cell at \(indexPath.row)")
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let infoAction: UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Info", handler: {(action: UITableViewRowAction, indexPath: NSIndexPath) in
            
            print("chat bubble \(indexPath.row) pressed")
            
        })
        infoAction.backgroundColor = self.view.tintColor
        
        /*var editAction: UITableViewRowAction = UITableViewRowAction.rowActionWithStyle(UITableViewRowActionStyle.Normal, title: "Edit", handler: {(action: UITableViewRowAction, indexPath: NSIndexPath) in
            //
        })*/
        
        
        return [infoAction]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

