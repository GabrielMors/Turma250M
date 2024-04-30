//
//  ViewController.swift
//  LifeCycle
//
//  Created by Gabriel Mors  on 24/03/24.
//

import UIKit

class ViewController: UIViewController {

    // Método quando a tela está preste a ser apresentado
    // Antes da View aparecer, esse metodo é chamado
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
//        navigationController?.navigationBar.isHidden = true
//        navigationItem.rightBarButtonItem?.title = "Voltar"
        // Configurações de navegação entre tela
        // Timer / Animação
    }
    
    // Método quando a tela é RENDERIZADA (Ou seja, será disparado apenas 1 vez!!!)
    // Antes da view ser exibida esse metodo é chamado automaticamente
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    // Método para configurações iniciais do APP.
    }

    // Método quando a tela está apresentado por completo
    // APARECEU PARA O USUÁRIO
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
        // Timer / Animação
    }
    
    // Método quando a tela está preste a sair (Ou seja, antes da tela sair esse método é chamado)
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        // Timer / Animação
    }
    
    // Método quando a tela desapareceu por completo!!
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        // Timer / Animação
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        let tela02 = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewController
        
        navigationController?.pushViewController(tela02 ?? UIViewController(), animated: true)
    }
    
}

