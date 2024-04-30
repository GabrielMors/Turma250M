//
//  HomeScreen.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 30/04/24.
//

// Chave: {}
// Colchetes []
// Parenteses ()
// Tipagem :
// Receber valor =
// Igualdade ==

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedRaffleButton()
}

class HomeScreen: UIView {

    var delegate: HomeScreenProtocol?
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "card")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "Type your name:"
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.spellCheckingType = .no
        textField.keyboardType = .default
        return textField
    }()
    
    lazy var rafflePeopleButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Raffle", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tappedRaffleButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedRaffleButton() {
        self.delegate?.tappedRaffleButton()
    }
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .black
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func addElements() {
        addSubview(logoImageView)
        addSubview(nameTextField)
        addSubview(rafflePeopleButton)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
        
            nameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            rafflePeopleButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            rafflePeopleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rafflePeopleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rafflePeopleButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: rafflePeopleButton.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
