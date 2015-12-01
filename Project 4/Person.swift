//
//  Person.swift
//  Project 4
//
//  Created by Bernard JIANG on 21/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var age: Int
    var image = "Default"
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    init(name: String, age: Int, image: String) {
        self.name = name
        self.age = age
        self.image = image
    }
    
}
