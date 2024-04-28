//
//  LoginScreen.swift
//  ViewCode-Aula
//
//  Created by Gabriel Mors  on 28/04/24.
//

//MARK: RECEITA DE BOLO VIEWCODE
// Passo a passo

// 1 Passo - Criar Screen (Ex: LoginViewController -> LoginScreen. RegisterViewController -> RegisterScreen)
// 2 Passo - Chamar o CONSTRUTOR
// 3 Passo - Criar elemento (NÃO ESQUEÇA DE CHAMAR O translatesAutoresizingMaskIntoConstraints = false)
// 4 Passo - Adicionar elemento (Chamar a função)
// 5 Passo - Configurar as constraints (Chamar a função)
// 6 Passo - Chamar no LoadView
// 7 Passo - Correr pro abraço

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedRegisterButton()
}

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenProtocol?
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    lazy var logoImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu e-mail:"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.textColor = .darkGray
        return textField
    }()

    lazy var passwordTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha:"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedRegisterButton() {
        self.delegate?.tappedRegisterButton()
        print("Cliquei no Botão!!!!")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(loginLabel)
        addSubview(logoImage)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoImage.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            emailTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
