//
//  TabBarController.swift
//  TabBarTurma250M
//
//  Created by Gabriel Mors  on 14/04/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
        configLayout()
    }
    
    func addControllers() {
        
        let firstViewController: UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: Tela01ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela01ViewController.self)) as? Tela01ViewController
            let nav = UINavigationController(rootViewController: viewController ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Tela 01", image: UIImage(systemName: "house"), tag: 0)
            
            return nav
        }()
        
        let secondViewController: UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewController
            let nav = UINavigationController(rootViewController: viewController ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Tela 02", image: UIImage(systemName: "trash.fill"), tag: 1)
            
            return nav
        }()
        
        let lastViewController: UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: Tela03ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela03ViewController.self)) as? Tela03ViewController
            let nav = UINavigationController(rootViewController: viewController ?? UIViewController())
            nav.tabBarItem = UITabBarItem(title: "Tela 03", image: UIImage(systemName: "person.fill"), tag: 2)
            
            return nav
        }()
        
        viewControllers = [firstViewController, secondViewController, lastViewController]
    }
    
    func configLayout() {
        tabBar.layer.borderWidth = 5.0
        tabBar.layer.borderColor = UIColor.red.cgColor
        tabBar.backgroundColor = .blue
    }
}

