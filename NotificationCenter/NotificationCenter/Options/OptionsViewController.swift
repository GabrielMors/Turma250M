//
//  OptionsViewController.swift
//  NotificationCenter
//
//  Created by Gabriel Mors  on 07/05/24.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBOutlet weak var macbookButton: UIButton!
    @IBOutlet weak var imacButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func tappedMacbookButton(_ sender: Any) {
        // Nesse exemplo alem de gritar a nossa chave "macbook", também estamos levando o object UICOlor (Voce pode setar qualquer tipagem no object)
        NotificationCenter.default.post(name: .macbook, object: UIColor.cyan)
        
        dismiss(animated: true)
    }
    
    @IBAction func tappedImacButton(_ sender: Any) {
        NotificationCenter.default.post(name: .imac, object: nil)
        
        dismiss(animated: true)
    }
    
    
}
