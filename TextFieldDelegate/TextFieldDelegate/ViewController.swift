//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Gabriel Mors  on 02/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var EnterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField(textField: emailTextField, placeholder: "Digite seu e-mail:", keyboard: .emailAddress, isSecure: false)
        configTextField(textField: passwordTextField, placeholder: "Digite sua senha:", keyboard: .default, isSecure: true)
        
        // Desabilita a interação com o usuario
        EnterButton.isEnabled = false
    }

    func configTextField(textField: UITextField, placeholder: String, keyboard: UIKeyboardType, isSecure: Bool) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboard
        textField.isSecureTextEntry = isSecure
        textField.delegate = self
        
        
    }

    
}

extension ViewController: UITextFieldDelegate {
    
    // Este método é disparado quando o teclado sobe
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderWidth = 3.0
        textField.layer.borderColor = UIColor.blue.cgColor
        
//        switch textField {
//            case emailTextField:
//            textField.layer.borderColor = UIColor.blue.cgColor
//            
//            case passwordTextField:
//            textField.layer.borderColor = UIColor.purple.cgColor
//            
//        default:
//            print("Nenhum deles")
//        }
        
//        if textField == emailTextField {
//            textField.layer.borderColor = UIColor.blue.cgColor
//        } else {
//            textField.layer.borderColor = UIColor.purple.cgColor
//        }
        
    }
    
    // Este método é disparado quando o teclado some/ abaixa
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        textField.layer.borderWidth = 0.0
        
        if emailTextField.hasText && passwordTextField.hasText {
            EnterButton.isEnabled = true
        } else {
            EnterButton.isEnabled = false
            textField.layer.borderWidth = 3.0
            textField.layer.borderColor = UIColor.red.cgColor
        }
        
        print(#function)
    }
    
    
    // Este método sempre é disparado quando clicamos no botao "retorno"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        // Faz o teclado se abaixar quando clicado no botao
        textField.resignFirstResponder()
        return true
    }
    
//    Esse método é disparado assim que é feito qualquer alteração de texto no TextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
            let newText = text.replacingCharacters(in: range, with: string)
            print(newText)
        }
        return true
    }
}



