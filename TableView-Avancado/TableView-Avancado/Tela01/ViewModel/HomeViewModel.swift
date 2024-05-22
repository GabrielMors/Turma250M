//
//  HomeViewModel.swift
//  TableView-Avancado
//
//  Created by Gabriel Mors  on 22/05/24.
//

import UIKit

class HomeViewModel: NSObject {
    
   private(set) var employeeList: [Employee] = [Employee(name: "Gabriel", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 1.000", isEnableHeart: true),
                                    Employee(name: "Nathália", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true),
                                    Employee(name: "Otávio", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true),
                                    Employee(name: "Fernando", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true),
                                    Employee(name: "Nathália", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true),
                                    Employee(name: "Otávio", age: 19, job: "iOS Developer", image: UIImage(systemName: "person.circle.fill") ?? UIImage(), salary: "R$: 15.000", isEnableHeart: true)
    ]
    
   public var numberOfRowsInSection: Int {
        return employeeList.count + 1
    }
    
    public func LoadCurrentEmployeeList(indexPath: IndexPath) -> Employee {
        return employeeList[indexPath.row - 1]
    }
    
    public func removeEmployeeList(indexPath: IndexPath) {
        employeeList.remove(at: indexPath.row - 1)
    }
    
}


