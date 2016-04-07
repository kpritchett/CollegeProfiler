//
//  DetailViewController.swift
//  
//
//  Created by kpritchett on 1/29/16.
//
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collegeTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var studentsTF: UITextField!
    let imagePicker = UIImagePickerController()

    
    var colleger : collegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(colleger.webPage)
        
        collegeTF.text = colleger.name
        locationTF.text = colleger.location
        studentsTF.text = "\(colleger.numberOfStudents)"
        imageView.image = colleger.image
        imagePicker.delegate = self
    }

    @IBAction func onSaveTapped(sender: AnyObject)
    {
        colleger.name = collegeTF.text!
        colleger.location = locationTF.text!
        colleger.numberOfStudents = Int(studentsTF.text!)!
        colleger.image = imageView.image
    }

    @IBAction func onWebsiteTapped(sender: UIButton)
    {
        if #available(iOS 9.0, *)
        {
            let myURL = NSURL(string: colleger.webPage)

            let SVC = SFSafariViewController(URL: myURL!)
            SVC.delegate = self
            presentViewController(SVC, animated: true, completion: nil)
        }

    }
    
    @available(iOS 9.0, *)
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func changePicTapped(sender: UIButton)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        
        imagePicker.dismissViewControllerAnimated(true, completion: { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let mapView = segue.destinationViewController as! MapViewController
        mapView.colleger = colleger
    }
}
