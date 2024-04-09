//
//  UserTableViewCell.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors  on 09/04/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier: String = String(describing: UserTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // Referenciar o nosso modelo com os elementos.
    public func setupCell(data: User) {
        nameLabel.text = data.name
        userImageView.image = data.image
    }
}
