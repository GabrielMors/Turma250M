//
//  HomeViewModel.swift
//  App-Roleta
//
//  Created by Gabriel Mors  on 25/05/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didUpdateButtonState()
    func didShowAlert(title: String, message: String)
    func didReloadData()
}

class HomeViewModel: NSObject {
    
    weak var delegate: HomeViewModelDelegate?
    var selectedPerson: Person?
    var imageList: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    
    private var personList: [Person] = [] {
        didSet {
            delegate?.didUpdateButtonState()
        }
    }
    
    public func selectPerson(at indexPath: IndexPath) {
        if let person = selectedPerson, personList[indexPath.row] === person {
            delegate?.didShowAlert(title: "Muito bom!!", message: "Agora é sua vez \(person.name), pague a conta")
            clearPersonList()
        } else {
            delegate?.didShowAlert(title: "Uffa", message: "Você escapou dessa vez!!")
            personList.remove(at: indexPath.row)
        }
    }
    
    public var setPerson: [Person] {
        personList
    }
    
    public func getPerson(indexPath: Int) -> Person {
        return personList[indexPath]
    }
    
    func clearPersonList() {
        personList.removeAll()
    }
    
    public func addPerson(name: String, imageList: [String]) {
        let randomImage = imageList.randomElement() ?? ""
        let person = Person(name: name, image: randomImage)
        personList.append(person)
    }
    
    public func randomPersonList() {
        personList.randomElement()
    }
}

