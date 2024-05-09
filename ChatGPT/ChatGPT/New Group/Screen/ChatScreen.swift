//
//  ChatScreen.swift
//  ChatGPT
//
//  Created by Gabriel Mors  on 09/05/24.
//

import UIKit

class ChatScreen: UIView {
    
    lazy var messageInputView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        return view
    }()
    
    lazy var messageBarView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = .appLight
        return view
    }()
    
    lazy var inputMessageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "Digite aqui"
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.spellCheckingType = .no
        textField.keyboardType = .asciiCapable
        return textField
    }()
    
    lazy var sendButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.cornerRadius = 22.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowOpacity = 0.3
        button.addTarget(self, action: #selector(self.tappedSendButton), for: .touchUpInside)
        button.setImage(UIImage(named: "send"), for: .normal)
        button.isEnabled = false
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .appLight
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
//        tableView.register(<#T##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        return tableView
    }()
    
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    @objc private func tappedSendButton() {
        print("Clicou no botao")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        addElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(tableView)
        addSubview(messageInputView)
        addSubview(sendButton)
        messageInputView.addSubview(messageBarView)
        messageInputView.addSubview(inputMessageTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: messageInputView.topAnchor),
            
            messageInputView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
            messageInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            messageInputView.trailingAnchor.constraint(equalTo: trailingAnchor),
            messageInputView.heightAnchor.constraint(equalToConstant: 80),
            
            messageBarView.leadingAnchor.constraint(equalTo: messageInputView.leadingAnchor, constant: 20),
            messageBarView.trailingAnchor.constraint(equalTo: messageInputView.trailingAnchor, constant: -20),
            messageBarView.heightAnchor.constraint(equalToConstant: 55),
            messageBarView.centerYAnchor.constraint(equalTo: messageInputView.centerYAnchor),
            
            sendButton.bottomAnchor.constraint(equalTo: messageBarView.bottomAnchor, constant: -10),
            sendButton.heightAnchor.constraint(equalToConstant: 55),
            sendButton.widthAnchor.constraint(equalToConstant: 55),
            sendButton.trailingAnchor.constraint(equalTo: messageBarView.trailingAnchor, constant: -15),
            
            inputMessageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -5),
            inputMessageTextField.leadingAnchor.constraint(equalTo: messageBarView.leadingAnchor, constant: 20),
            inputMessageTextField.heightAnchor.constraint(equalToConstant: 45),
            inputMessageTextField.centerYAnchor.constraint(equalTo: messageBarView.centerYAnchor)
        ])
    }
}
