//
//  UserChatViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 3.01.23.
//

import UIKit


extension UserChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            var cell: UserChatTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "UserChatTableViewCell") as? UserChatTableViewCell {
                cell = reuseCell
            } else {
                cell = UserChatTableViewCell()
            }
            
            return configure(cell: cell, for: indexPath)
        } else {
            var cell: ChatUserRightTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "ChatUserRightTableViewCell") as? ChatUserRightTableViewCell {
                cell = reuseCell
            } else {
                cell = ChatUserRightTableViewCell()
            }
            return configure(cell: cell, for: indexPath)
        }
    }
    
    private func configure(cell: UserChatTableViewCell, for indexPath: IndexPath) -> UITableViewCell {
        return cell
    }
    
    private func configure(cell: ChatUserRightTableViewCell, for indexPath: IndexPath) -> UITableViewCell {
        return cell
    }
}



class UserChatViewController: UIViewController {
    
    @IBOutlet weak var tableviewChat: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UINib(nibName: "UserChatTableViewCell", bundle: nil), forCellWithReuseIdentifier: "UserChatTableViewCell")
//        tableviewChat.register(UINib(nibName: "UserChatTableViewCell", bundle: nil), forCellWithReuseIdentifier: "UserChatTableViewCell")
        tableviewChat.register(UINib(nibName: "UserChatTableViewCell", bundle: nil), forCellReuseIdentifier: "UserChatTableViewCell")
        tableviewChat.register(UINib(nibName: "ChatUserRightTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatUserRightTableViewCell")
        tableviewChat.rowHeight = UITableView.automaticDimension
        tableviewChat.estimatedRowHeight = 44.0
        tableviewChat.translatesAutoresizingMaskIntoConstraints = false
//
//        tableviewChat.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        tableviewChat.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        tableviewChat.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        tableviewChat.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
