//
//  TableViewController.swift
//  Project 4
//
//  Created by Bernard JIANG on 21/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var friends = [Person(name: "Bernard", age: 18, image: "Bernard"), Person(name: "Nicole", age: 18, image: "Nicole"),
                  Person(name: "George", age: 18, image: "George"), Person(name: "Brittany", age: 18, image: "Brittany"),
                  Person(name: "Chris", age: 17, image: "Chris"), Person(name: "Teun", age: 17, image: "Teun"),
                  Person(name: "Nich", age: 17, image: "Nich"), Person(name: "Default", age: 2)]
    
    var enemies = [Person(name: "Default2", age: 12)]
    
    @IBAction func saveToTableViewController (segue: UIStoryboardSegue) {
        let detailViewController = segue.sourceViewController as! DetailViewController
        
        let index = detailViewController.index
        let newPerson = detailViewController.person
        
        if detailViewController.section == 0 {
            friends[index!] = newPerson
        }
        
        if detailViewController.section == 1 {
            enemies[index!] = newPerson
        }
        
        tableView.reloadData()
    }
    
    @IBAction func addToTableViewController (segue: UIStoryboardSegue) {
        let addViewController = segue.sourceViewController as! AddViewController
        let newPerson = addViewController.person
        friends.append(newPerson)
        
        tableView.reloadData()
    }
    
    @IBAction func addToEnemyTableViewController (segue: UIStoryboardSegue) {
        let addViewController = segue.sourceViewController as! AddViewController
        let newPerson = addViewController.person
        enemies.append(newPerson)
        
        tableView.reloadData()
    }
    
    @IBAction func cancelAddToTableViewController (segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return friends.count
        }
        
        return enemies.count
    }

    override func tableView(tableView:UITableView, titleForHeaderInSection section:Int) -> String {

        if(section == 0) {
            return "Friends"
        }
        return "Enemies"
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        if indexPath.section == 0 {
            cell.personLabel.text = "\(friends[indexPath.row].name) is \(friends[indexPath.row].age) years old."
            cell.personImage.image = UIImage(named: friends[indexPath.row].image)!
        }
        
        if indexPath.section == 1 {
            cell.personLabel.text = "\(enemies[indexPath.row].name) is \(enemies[indexPath.row].age) years old."
            cell.personImage.image = UIImage(named: enemies[indexPath.row].image)!
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 40
        } else {
            return 60
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            if indexPath.section == 0 {
                friends.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            
            if indexPath.section == 1 {
                enemies.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detail" {
            let destination = segue.destinationViewController as! DetailViewController
            
            if tableView.indexPathForSelectedRow!.section == 0 {
                destination.person = friends[tableView.indexPathForSelectedRow!.row]
                destination.index = tableView.indexPathForSelectedRow!.row
                destination.section = 0
            }
            
            if tableView.indexPathForSelectedRow!.section == 1 {
                destination.person = enemies[tableView.indexPathForSelectedRow!.row]
                destination.index = tableView.indexPathForSelectedRow!.row
                destination.section = 1
            }
        }
    }
}
