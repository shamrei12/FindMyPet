//
//  ChatsViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 3.01.23.
//

import UIKit


extension ChatsViewController: UITableViewDelegate {
    
}

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: ChatTableViewCell
         if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell") as? ChatTableViewCell {
             cell = reuseCell
         } else {
             cell = ChatTableViewCell()
         }
         
         return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: ChatTableViewCell, for indexPath: IndexPath) -> UITableViewCell {
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chat = UserChatViewController.instantiate()
        chat.modalPresentationStyle = .fullScreen
        present(chat, animated: true)
    }
}

class ChatsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        // Do any additional setup after loading the view.
    }

    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
