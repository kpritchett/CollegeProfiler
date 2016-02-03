//
//  ViewController.swift
//  College Profile Builder
//
//  Created by kpritchett on 1/21/16.
//  Copyright (c) 2016 kpritchett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
    
{
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!
    var college : [collegeClass] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        college.append(collegeClass(Name: "University of Illinois", Location: "Illinois", NumberOfStudents: 30682, Image: UIImage(named: "UOFI")!))
        
        college.append(collegeClass(Name: "University of Iowa", Location: "Iowa", NumberOfStudents: 24423, Image: UIImage(named: "UOIOWA")!))
        
        college.append(collegeClass(Name: "University of Wisconsin", Location: "Wisconsin", NumberOfStudents: 23523, Image: UIImage(named: "UOWI")!))
        
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell: AnyObject = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel!!.text = college[indexPath.row].name
        myCell.detailTextLabel!!.text = college[indexPath.row].location
        
        return myCell as! UITableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return college.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            college.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }
    }
    
    @IBAction func addButtonTapped(sender: AnyObject)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler{ (nameTextField) -> Void in
            nameTextField.placeholder = "Add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler{ (locationTextField) -> Void in
            locationTextField.placeholder = "Add College Location"
        }
        myAlert.addTextFieldWithConfigurationHandler{ (numberOfStudentsTextField) -> Void in
            numberOfStudentsTextField.placeholder = "Add NumberOfStudents"
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        var addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let nameTF = myAlert.textFields![0] as! UITextField
            let locationTF = myAlert.textFields![1] as! UITextField
            let numberOfStudentsTF = myAlert.textFields![2] as! UITextField
            self.college.append(collegeClass(Name: nameTF.text, Location: locationTF.text, NumberOfStudents: numberOfStudentsTF.text.toInt()!, Image: UIImage()))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let move = college[sourceIndexPath.row]
        college.removeAtIndex(sourceIndexPath.row)
        college.insert(move, atIndex: destinationIndexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow()!.row
        detailView.colleger = college[selectedRow]
    }


}

