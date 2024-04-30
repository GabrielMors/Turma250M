//
//  PersonTableViewCell.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 30/04/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: PersonTableViewCell.self)
    
    lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    lazy var cardsImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "credit-card")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: Person) {
        personImageView.image = UIImage(named: data.image)
        nameLabel.text = data.name
    }
    
    private func addElements() {
        addSubview(personImageView)
        addSubview(nameLabel)
        addSubview(cardsImageView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            personImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            personImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            personImageView.heightAnchor.constraint(equalToConstant: 70),
            personImageView.widthAnchor.constraint(equalToConstant: 70),
        
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: cardsImageView.leadingAnchor, constant: -8),
            
            cardsImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardsImageView.heightAnchor.constraint(equalToConstant: 60),
            cardsImageView.widthAnchor.constraint(equalToConstant: 60),
            cardsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
