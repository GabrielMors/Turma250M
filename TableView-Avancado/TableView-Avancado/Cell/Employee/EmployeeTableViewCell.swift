//
//  EmployeeTableViewCell.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors  on 09/04/24.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    static let identifier: String = String(describing: EmployeeTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func setupCell(data: Employee) {
        personImage.image = data.image
        nameLabel.text = "Nome: \(data.name)"
        ageLabel.text = "Idade: \(data.age)"
        jobLabel.text = "Profissão: \(data.job)"
        salaryLabel.text = "Salário: \(data.salary)"
        
        if data.isEnableHeart {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = .red
        } else {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = .blue
        }
    }
}
