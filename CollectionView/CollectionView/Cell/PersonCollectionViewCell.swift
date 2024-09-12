//
//  PersonCollectionViewCell.swift
//  CollectionView
//
//  Created by Gabriel Mors  on 11/04/24.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    
    static let identifier: String = String(describing: PersonCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    public func setupCell(person: Person) {
        NameLabel.text = person.name
    }
}
