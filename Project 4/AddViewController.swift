//
//  AddViewController.swift
//  Project 4
//
//  Created by Bernard JIANG on 23/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    var person: Person!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "add" {
            person = Person(name: nameField.text!, age: Int(ageField.text!)!)
        }
    }

}
