//
//  MenuViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.12.22.
//

import UIKit




class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var stackButton: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        hide()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        visible()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hide()
    }
    
    func visible() {
        stackButton.isHidden = false
    }
    
    func hide() {
        stackButton.isHidden = true
    }
    
    @IBAction func SettingTapped(_ sender: UIButton) {
        let setting = SettingViewController.instantiate()
        setting.modalPresentationStyle = .fullScreen
        present(setting, animated: true)
    }
    
    @IBAction func messageTapped(_ sender: UIButton) {
        let message = ChatsViewController.instantiate()
        message.modalPresentationStyle = .fullScreen
        present(message, animated: true)
    }
    
    @IBAction func profileTapped(_ sender: UIButton) {
        let profile = ProfileViewController.instantiate()
        profile.modalPresentationStyle = .fullScreen
        present(profile, animated: true)
    }
    
}
