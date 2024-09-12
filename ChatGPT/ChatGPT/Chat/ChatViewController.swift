//
//  ViewController.swift
//  ChatGPT
//
//  Created by Gabriel Mors  on 09/05/24.
//

import UIKit

class ChatViewController: UIViewController {

    var screen: ChatScreen?
    var messageList: [Message] = []
    
    override func loadView() {
        screen = ChatScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTableView(delegate: self, dataSource: self)
        view.backgroundColor = .background
    }
    
    func addMessage(message: String, type: TypeMessage) {
        messageList.insert(Message(message: message.trimmingCharacters(in: .whitespacesAndNewlines), typeMessage: type), at: .zero)
    }
    
    func loadCurrentMessage(indexPath: IndexPath) -> Message {
        return messageList[indexPath.row]
    }
    
    func heightForRow(indexPath: IndexPath) -> CGFloat {
        let message = loadCurrentMessage(indexPath: indexPath).message
        let font = UIFont.helveticaNeueMedium(size: 16)
        let estimetedHeight = message.heightWithConstrainedWidth(width: 220, font: font)
        return estimetedHeight + 65
    }
    
    func reloadTableView() {
        screen?.tableView.reloadData()
    }
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = loadCurrentMessage(indexPath: indexPath)
        switch message.typeMessage {

        case .user:
            let cell = tableView.dequeueReusableCell(withIdentifier: OutgoingTextMessageTableViewCell.identifier, for: indexPath) as? OutgoingTextMessageTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
            
        case .chatGPT:
            let cell = tableView.dequeueReusableCell(withIdentifier: IncomingTextMessageTableViewCell.identifier, for: indexPath) as? IncomingTextMessageTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow(indexPath: indexPath)
    }
}

extension ChatViewController: ChatScreenProtocol {
    
    func sendMessage(text: String) {
        addMessage(message: text, type: .user)
        reloadTableView()
    }
}
