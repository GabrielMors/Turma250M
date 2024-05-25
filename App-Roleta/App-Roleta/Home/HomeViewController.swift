//
//  ViewController.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 30/04/24.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeScreen?
    var viewModel = HomeViewModel()
    
    
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
        screen?.delegate(delegate: self)
        screen?.textFieldDelegate(delegate: self)
        blockerDrawNumberButton()
    }

    private func blockerDrawNumberButton() {
        if viewModel.setPerson.isEmpty {
            screen?.rafflePeopleButton.isEnabled = false
            screen?.rafflePeopleButton.alpha = 0.5
        } else {
            screen?.rafflePeopleButton.isEnabled = true
            screen?.rafflePeopleButton.alpha = 1.0
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // FORMA MAIS "SIMPLES" DE FAZER NA MVVM
        return viewModel.setPerson.isEmpty ? 1 : viewModel.setPerson.count

        // FORMA DE FAZER NA ARQUITETURA MVC
//        if personList.count == 0 {
//            return 1
//        } else {
//            return personList.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.setPerson.isEmpty {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier) as? PersonTableViewCell
            let person = viewModel.getPerson(indexPath: indexPath.row)
                cell?.setupCell(data: person)
        
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // FORMA MAIS "SIMPLES" DE FAZER NA MVVM
        return viewModel.setPerson.isEmpty ? 250 : 90
        
        // FORMA DE FAZER NA ARQUITETURA MVC
//        if personList.count == 0 {
//            return 250
//        } else {
//            return 90
//        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // FORMA MAIS "SIMPLES" DE FAZER NA MVVM
        viewModel.selectPerson(at: indexPath)
        
        // FORMA DE FAZER NA ARQUITETURA MVC
//        if let person = person, personList[indexPath.row] === person {
//            alert.showAlert(title: "Muito bom!!", message: "Agora é sua vez \(person.name), pague a conta")
//            personList.removeAll()
//        } else {
//            alert.showAlert(title: "Uffa", message: "Voce escapou dessa vez!!")
//            personList.remove(at: indexPath.row)
//        }
        blockerDrawNumberButton()
        screen?.tableView.reloadData()
    }
    
}

extension HomeViewController: UITextFieldDelegate {
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        guard let text = textField.text, !text.isEmpty else {
            return true
        }
        viewModel.addPerson(name: text, imageList: viewModel.imageList)
        textField.text = ""
        screen?.tableView.reloadData()
        blockerDrawNumberButton()
        
        return true
    }
}

extension HomeViewController: HomeScreenProtocol {
    
    func tappedRaffleButton() {
        viewModel.randomPersonList()
    }
}
