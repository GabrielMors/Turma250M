//
//  IncomingTextMessageTableViewCell.swift
//  ChatGPT
//
//  Created by Gabriel Mors  on 09/05/24.
//

import UIKit

class IncomingTextMessageTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: IncomingTextMessageTableViewCell.self)
    
    lazy var contactMessageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .incomingColor
        view.layer.cornerRadius = 20
        view.layer.maskedCorners =  [.layerMaxXMaxYCorner, .layerMinXMinYCorner , .layerMaxXMinYCorner]
        return view
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .background
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(contactMessageView)
        contactMessageView.addSubview(messageLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            contactMessageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contactMessageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            contactMessageView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            messageLabel.leadingAnchor.constraint(equalTo: contactMessageView.leadingAnchor, constant: 15),
            messageLabel.topAnchor.constraint(equalTo: contactMessageView.topAnchor, constant: 15),
            messageLabel.bottomAnchor.constraint(equalTo: contactMessageView.bottomAnchor, constant: -15),
            messageLabel.trailingAnchor.constraint(equalTo: contactMessageView.trailingAnchor, constant: -15),
        ])
    }
    
    
    public func setupCell(data: Message) {
        messageLabel.text = data.message
    }
    
}
