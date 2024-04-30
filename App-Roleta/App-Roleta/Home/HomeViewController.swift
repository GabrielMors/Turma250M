//
//  ViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 30/04/24.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    var personList: [Person] = []
    var imageList: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    
    
    lazy var alert: AlertController = {
        let alert = AlertController(controller: self)
        return alert
    }()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        screen?.configTableView(delegate: self, dataSource: self)
        screen?.delegate = self
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if personList.count == 0 {
            return 1
        } else {
            return personList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if personList.count == 0 {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier) as? PersonTableViewCell
            cell?.setupCell(data: personList[indexPath.row])
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if personList.count == 0 {
            return 250
        } else {
            return 90
        }
    }
}

extension HomeViewController: HomeScreenProtocol {
    
    func tappedRaffleButton() {
        print("Cliquei")
    }
}
