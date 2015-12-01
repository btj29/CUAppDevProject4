//
//  DetailViewController.swift
//  Project 4
//
//  Created by Bernard JIANG on 23/10/15.
//  Copyright © 2015 Bernard JIANG. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var person: Person!
    var index: Int!
    var section: Int!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nameEdit: UILabel!
    @IBOutlet weak var ageEdit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = person.name
        ageLabel.text = String(person.age)
        image.image = UIImage(named: person.image)!
        nameField.hidden = true
        ageField.hidden = true
        doneButton.hidden = true
        nameEdit.hidden = true
        ageEdit.hidden = true
    }
    
    @IBAction func editPressed(sender: UIButton) {
        nameField.hidden = false
        ageField.hidden = false
        doneButton.hidden = false
        nameEdit.hidden = false
        ageEdit.hidden = false
        
        nameField.text = person.name
        ageField.text = String(person.age)
    }
    
    @IBAction func donePressed(sender: UIButton) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "edit" {
            person = Person(name: nameField.text ?? person.name, age: Int(ageField.text ?? "") ?? person.age, image: person.image)
        }
    }
}
