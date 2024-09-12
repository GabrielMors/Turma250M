//
//  ViewController.swift
//  TableView-Aula
//
//  Created by Gabriel Mors  on 04/04/24.
//

import UIKit

// TableView é SOMENTE na VERTICAL

//PASSO A PASSO

// 1 - Criar sua tableView
// 2 - Fazer a conexão
// 3 - ASSINAR os Protocolos (UItableViewDelegate, UItableViewDataSource)
// 4 - Criar sua célula
// 5 - Criar seu identifier da célula
// 6 - Registrar sua célula
// 7 - Popular a célula na tableView
// 8 - Retornar nossa celula

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrayNames: [String] = ["Gabriel", "Otávio", "Nathália", "Fernando",
                                "Gabriel", "Otávio", "Nathália", "Fernando",
                                "Gabriel", "Otávio", "Nathália", "Fernando",
                                "Gabriel", "Otávio", "Nathália", "Fernando",
                                "Gabriel", "Otávio", "Nathália", "Fernando",
                                "Gabriel", "Otávio", "Nathália", "Fernando",
                                "Gabriel", "Otávio", "Nathália", "Fernando",
                                "Gabriel", "Otávio", "Nathália", "Fernando",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Serve para colocar quantas celular irá aparecer na tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNames.count
    }
    
    // Serve para pupular nossa tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.nameLabel.text = arrayNames[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    // Método para modificar a altura da celula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
//        if indexPath.row == 0 {
//            return 250
//        } else {
//            return 150
//        }
    }
    
    // Permitir que nós possamos editar e fazer configurações na celula
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Verifica se a célula a ser removida é um "Funcionário"
//            if indexPath.row >= 1 {
//                // Ajusta o indicar
//                let adjustedIndex = indexPath.row - 1
//                arrayNames.remove(at: adjustedIndex)
//                tableView.reloadData()
//            }
//        }
    }
    
    // Consegue fazer configurações ao clicar na celula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index da minha célula: \(indexPath.row)")
    }
}
