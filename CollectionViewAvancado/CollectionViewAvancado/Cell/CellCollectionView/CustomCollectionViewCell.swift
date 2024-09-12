//
//  CustomCollectionViewCell.swift
//  CollectionViewAvancado
//
//  Created by Gabriel Mors  on 11/04/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    static let identifier: String = String(describing: CustomCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setupCell(value: UIImage) {
        image.image = value
    }
    
}
