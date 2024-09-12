//
//  ViewController.swift
//  TransicaoDeDados
//
//  Created by Gabriel Mors  on 22/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        let tela02 = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: Tela02ViewController.self)) { coder -> Tela02ViewController? in
            return Tela02ViewController(coder: coder, name: self.nameTextField.text ?? "")
        }
        
        navigationController?.pushViewController(tela02 ?? UIViewController(), animated: true)
        view.backgroundColor = .red
        nameTextField.text = ""
    }
    
    // Coder é uma referencia da Instancia.
//    É uma ferramenta que o sistema usa para criar uma classe a partir do arquivo Storyboard
}

