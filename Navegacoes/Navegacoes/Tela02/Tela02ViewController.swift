//
//  Tela02ViewController.swift
//  Navegacoes
//
//  Created by Gabriel Mors  on 19/03/24.
//

import UIKit

class Tela02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tappedBackButton(_ sender: UIButton) {
    // Modal
        dismiss(animated: true)
        
    // NavigationController
//        navigationController?.popViewController(animated: true)
    }


}
