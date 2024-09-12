//
//  ViewController.swift
//  UserDefaults
//
//  Created by Gabriel Mors  on 07/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = Utils.getUserDefaults(key: "name") as? String
    }


    @IBAction func tappedAddButton(_ sender: Any) {
        Utils.addUserDefaults(value: nameTextField.text ?? "", key: "name")
    }
    
    @IBAction func tappedRemoveButton(_ sender: Any) {
        nameTextField.text = ""
        Utils.removeUserDefaults(key: "name")
    }
}

