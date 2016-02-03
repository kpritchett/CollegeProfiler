//
//  DetailViewController.swift
//  
//
//  Created by kpritchett on 1/29/16.
//
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collegeTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var studentsTF: UITextField!
    
    var colleger : collegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collegeTF.text = colleger.name
        locationTF.text = colleger.location
        studentsTF.text = "\(colleger.numberOfStudents)"
        imageView.image = colleger.image
    }

    @IBAction func onSaveTapped(sender: AnyObject)
    {
        colleger.name = collegeTF.text
        colleger.location = locationTF.text
        colleger.numberOfStudents = studentsTF.text.toInt()!
    }


}
