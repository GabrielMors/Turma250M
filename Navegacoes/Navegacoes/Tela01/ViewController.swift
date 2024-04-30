//
//  ViewController.swift
//  Navegacoes
//
//  Created by Gabriel Mors  on 19/03/24.
//

import UIKit

// Modal
// É utilizado apenas para exibir informações, mostrar algo para o usuario
// utilizamos o --> present(tela02 ?? UIViewController(), animated: true) para fazer uma navegação com uma modal
// Utilizamos o Dismiss para voltar com a tela anterior


// NavigationController
// É utilizado para obter o controle de naveegacao de fluxo de uma tela ou varias telas.
// Para ter uma navigaton, precisamos ter uma tela ROOT
// A tela root(raiz) ela é a primeira tela, sendo representada com uma tela ao lado indicando que ela é uma NavigationController
// CRIAMOS A NAVIGATIONCONTROLLER APENAS 1 VEZ NO FLUXO DO NOSSO APP
// Para chamar uma tela, utilizamos o --> navigationController?.pushViewController(tela02 ?? UIViewController(), animated: true)
// Utilizamos o --> navigationController?.popViewController(animated: true) para voltar com a tela anterior


class Tela01ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tappedShowScreen02(_ sender: UIButton) {
        
        let tela02 = UIStoryboard(name: "Tela02ViewController", bundle: nil).instantiateViewController(withIdentifier: "Tela02ViewController") as? Tela02ViewController
 
// MARK: NavigationController
//        navigationController?.pushViewController(tela02 ?? UIViewController(), animated: true)
        
// MARK: Modal
        tela02?.modalPresentationStyle = .fullScreen
        present(tela02 ?? UIViewController(), animated: true)
    }
    
}

