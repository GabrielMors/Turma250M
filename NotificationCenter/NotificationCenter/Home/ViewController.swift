//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Gabriel Mors  on 07/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configObserver()
    }

    private func configObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeMacbook), name: .macbook, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeImac), name: .imac, object: nil)
    }
    
    @objc func changeMacbook() {
        view.backgroundColor = .green
        logoImageView.image = UIImage(named: "macbook_pro")
        titleLabel.text = "Macbook Pro"
    }
    
    @objc func changeImac() {
        view.backgroundColor = .cyan
        logoImageView.image = UIImage(named: "imac_pro")
        titleLabel.text = "Imac das galáxias"
    }
    
    @IBAction func tappedChoosebutton(_ sender: Any) {
        let viewController = UIStoryboard(name: String(describing: OptionsViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: OptionsViewController.self)) as? OptionsViewController
        viewController?.modalPresentationStyle = .fullScreen
        present(viewController ?? UIViewController(), animated: true)
    }
    
}

