//
//  ViewController.swift
//  ChatGPT
//
//  Created by Gabriel Mors  on 09/05/24.
//

import UIKit

class ChatViewController: UIViewController {

    var screen: ChatScreen?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Gabriel"
    }
    
    override func loadView() {
        screen = ChatScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableView(delegate: self, dataSource: self)
        view.backgroundColor = .background
    }


}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
