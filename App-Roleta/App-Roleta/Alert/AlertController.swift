//
//  AlertController.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 30/04/24.
//

import UIKit

class AlertController {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
}
