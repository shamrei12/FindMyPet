//
//  UserChatViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 3.01.23.
//

import UIKit


extension UserChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messageList[indexPath.row].typeMessage % 2 != 0 {
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
        cell.message.text = messageList[indexPath.row].textMessage
        return cell
    }
    
    private func configure(cell: ChatUserRightTableViewCell, for indexPath: IndexPath) -> UITableViewCell {
        cell.message.text = messageList[indexPath.row].textMessage
        return cell
    }
}



class UserChatViewController: UIViewController, UITextFieldDelegate {
    private var messageList: [Messages] = []
    
    @IBOutlet weak var tableviewChat: UITableView!
    
    @IBOutlet weak private  var textMessage: UITextField!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.register(UINib(nibName: "UserChatTableViewCell", bundle: nil), forCellWithReuseIdentifier: "UserChatTableViewCell")
        //        tableviewChat.register(UINib(nibName: "UserChatTableViewCell", bundle: nil), forCellWithReuseIdentifier: "UserChatTableViewCell")
        tableviewChat.register(UINib(nibName: "UserChatTableViewCell", bundle: nil), forCellReuseIdentifier: "UserChatTableViewCell")
        tableviewChat.register(UINib(nibName: "ChatUserRightTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatUserRightTableViewCell")
        tableviewChat.rowHeight = UITableView.automaticDimension
        tableviewChat.estimatedRowHeight = 44.0
        tableviewChat.translatesAutoresizingMaskIntoConstraints = false
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        messageList.append(MessageUser(typeMessage: 1, textMessage: "Привет! Видел вашу собаку. Она на улице Мицкевича 38. Стоит у входа в общежитие."))
        messageList.append(MessageUser(typeMessage: 2, textMessage: "Привет! Спасибо за информацию. А какие у нее приметы?"))
        messageList.append(MessageUser(typeMessage: 1, textMessage: "Красный ошейник и на нем значок."))
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height
//            }
            self.tableviewChat.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func sendMessageTapped(_ sender: UIButton) {
        messageList.append(MessageUser(typeMessage: 2, textMessage: textMessage.text ?? "" ))
        textMessage.text = ""
        tableviewChat.reloadData()
    }
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
