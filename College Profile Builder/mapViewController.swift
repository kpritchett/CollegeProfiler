//
//  mapViewController.swift
//  College Profile Builder
//
//  Created by kpritchett on 3/3/16.
//  Copyright © 2016 kpritchett. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController
{
    @IBOutlet weak var myMapView: MKMapView!

    var colleger : collegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("buttonpress")
        geoCodeLocation(colleger.location)
    }
    func geoCodeLocation(Location: String)
    {
        let myGeoCode = CLGeocoder()
        myGeoCode.geocodeAddressString(Location) { (placeMarkes, error) -> Void in
            if error != nil
            {
                print("error")
            }
            else
            {
                self.displayMap((placeMarkes!.first)!)
            }
        }
    }
    func displayMap(MyPlaceMark : CLPlacemark)
    {
        let myPin = MKPointAnnotation()
        colleger.location = MyPlaceMark.name!
        let myLocation = MyPlaceMark
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake((myLocation.location?.coordinate)!, span)
        myMapView.setRegion(region, animated: true)
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = MyPlaceMark.name
        myMapView.addAnnotation(myPin)
    }
}
