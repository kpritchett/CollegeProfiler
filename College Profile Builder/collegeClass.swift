//
//  collegeClass.swift
//  College Profile Builder
//
//  Created by kpritchett on 1/26/16.
//  Copyright (c) 2016 kpritchett. All rights reserved.
//

import UIKit

class collegeClass: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    var webPage = String()
   
    init(Name: String, Location: String, NumberOfStudents: Int, Image: UIImage, WebPage: String)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
        webPage = WebPage
    }
    init(Name: String, Location: String)
    {
        super.init()
        name = Name
        location = Location
    }
}
