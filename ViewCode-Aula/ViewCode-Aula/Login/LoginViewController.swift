//
//  ViewController.swift
//  ViewCode-Aula
//
//  Created by Gabriel Mors  on 28/04/24.
//

import UIKit

class LoginViewController: UIViewController {

    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        view.backgroundColor = .cyan
    }
    
}

extension LoginViewController: LoginScreenProtocol {
    
    func tappedRegisterButton() {
        let viewController = RegisterViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
