//
//  SettingViewController.swift
//  FindMyPets
//
//  Created by Алексей Шамрей on 6.01.23.
//

import UIKit

class SettingViewController: UIViewController {
    
    private var userDefaults: UserDefaultsModel!
    @IBOutlet weak var themeLablel: UILabel!
    
    @IBOutlet weak var lightTheme: UILabel!
    
    @IBOutlet weak var darkTheme: UILabel!
    
    @IBOutlet weak var swithTheme: UISwitch!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults = UserDefaultsModel()
        updateUI(userDefaults.showTheme())
        swithTheme.isOn = userDefaults.showTheme()
        

    }

    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func changedTheme(_ sender: UISwitch) {
        userDefaults?.saveTheme(sender.isOn)
        updateUI(((userDefaults?.showTheme()) != nil))
        
    }
    
    func updateUI(_ type: Bool) {
        if  userDefaults.showTheme() {
            mainView.layer.backgroundColor = UIColor.black.cgColor
            navBar.tintColor = UIColor.white
            navBar.barTintColor = UIColor.black
            navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            themeLablel.textColor = UIColor.white
            lightTheme.textColor = UIColor.white
            darkTheme.textColor = UIColor.white
        } else {
            mainView.layer.backgroundColor = UIColor.white.cgColor
            navBar.tintColor = UIColor.black
            navBar.barTintColor = UIColor.white
            navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            themeLablel.textColor = UIColor.black
            lightTheme.textColor = UIColor.black
            darkTheme.textColor = UIColor.black
        }
    }
}
