//
//  MenuViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 23.12.22.
//

import UIKit

class MenuViewController: UIViewController {
    
    func visible() {
        profileButton.isHidden = false
        messageButton.isHidden = false
        notificationButton.isHidden = false
        settingButton.isHidden = false
    }
    
    func hide() {
        profileButton.isHidden = true
        messageButton.isHidden = true
        notificationButton.isHidden = true
        settingButton.isHidden = true
    }
    
    @IBOutlet weak var menuView: UIView!
    var userDefaults = UserDefaults.standard
    var key = "access"
    private var menuImage = false
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hide()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        visible()
        visible()
        print("viewWillAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        hide()
        print("viewDidDisappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hide()
        print("viewWillDisappear")
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
