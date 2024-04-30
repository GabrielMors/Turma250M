//
//  ViewController.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors  on 07/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var employeeList: [Employee] = [Employee(name: "Gabriel", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 1.000", isEnableHeart: true),
                                    Employee(name: "Nathália", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true),
                                    Employee(name: "Otávio", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true),
                                    Employee(name: "Fernando", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true),
                                    Employee(name: "Nathália", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true),
                                    Employee(name: "Otávio", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.register(EmployeeTableViewCell.nib(), forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + employeeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        switch indexPath.row == 0 {
//        case true:
//            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
//            cell?.setupCell(data: User(name: "Gabriel Mors", image: UIImage(systemName: "person.fill") ?? UIImage()))
//            return cell ?? UITableViewCell()
//        case false:
//            let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
//            cell?.setupCell(data: employeeList[indexPath.row - 1])
//            return cell ?? UITableViewCell()
//        }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
            cell?.setupCell(data: User(name: "Gabriel Mors", image: UIImage(systemName: "person.fill") ?? UIImage()))
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
            cell?.setupCell(data: employeeList[indexPath.row - 1])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        } else {
            return 250
        }
    }

    
}
